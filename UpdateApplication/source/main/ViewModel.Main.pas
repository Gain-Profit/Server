unit ViewModel.Main;

interface

uses
  System.Types,
  System.IOUtils,
  System.Classes,
  System.SysUtils,
  System.UITypes,
  System.Variants,
  System.DateUtils,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  Model.Main,
  DbUtils,
  ApiUtils,
  FileUtils,
  Data.DB;

type
  TProci = reference to procedure(msg: string);
  TProcInt = reference to procedure(AValue: Integer);
  TProcIntMsg = reference to procedure(AValue: Integer; AMsg: string);

  TViewModelMain = class
  private
    FDb: TDatabase;
    FApi: TFirebaseApi;
    FApiApplication: TFirebaseApi;
    FClient: TClient;
    FAppPath: string;
    FAppTempPath: string;
    FOnShowMessage: TProci;
    FOnLoadClient: TProc<TClient>;
    FOnProgressChange: TProcIntMsg;
    FOnMaxProgressChange: TProcInt;
    FStarted: Boolean;
    FApplicationData: TDataSet;
    FDownload: THTTPClient;

    FDownloadStream: TStream;
    FGlobalStart: Cardinal;
    FAsyncResult: IAsyncResult;

    function GetClient: TClient;
    function GetNow: LongInt;
    procedure GetFileVersion;
    procedure CheckApplication;
    procedure UpdateApplication(AFileName, AUrl: string);
    procedure DoEndDownload(const AsyncResult: IAsyncResult);
    procedure ReceiveDataEvent(const Sender: TObject; AContentLength,
      AReadCount: Int64; var Abort: Boolean);
    procedure ExtractDownloadedFile;
  public
    constructor Create(LPath: string; LTempPath: string);
    destructor Destroy;
    procedure Start;
    procedure Update;
    procedure OpenFormSetting;
    procedure SetOnShowMessage(AProc: TProci);
    procedure SetOnLoadClient(AProc: TProc<TClient>);
    procedure OnMaxProgressChange(AProc: TProcInt);
    procedure OnProgressChange(AProc: TProcIntMsg);
  published
    property Client: TClient read GetClient;
    property Api: TFirebaseApi read FApiApplication;
  end;

implementation

const
  BASE_URL = 'https://gain-profit-update.firebaseio.com';
  PATH_CLIENT = 'clients/';
  BASE_APPLICATION_URL = 'http://gain-profit.github.io';
  PATH_APPLICATION = 'updater';

  { TViewModelMain }

constructor TViewModelMain.Create(LPath: string; LTempPath: string);
begin
  FAppPath := LPath;
  FAppTempPath := LTempPath;

  FClient := TClient.Create;
  FApi := TFirebaseApi.Create(BASE_URL);
  FApiApplication := TFirebaseApi.Create(BASE_APPLICATION_URL, 'profit');

  FDb := TDatabase.Create;

  FDownload := THTTPClient.Create;
  FDownload.OnReceiveData := ReceiveDataEvent;
end;

destructor TViewModelMain.Destroy;
begin
  FClient.Free;
  FApi.Free;
  FDb.Free;
  FDownload.Free;
end;

function TViewModelMain.GetClient: TClient;
begin
  Result := FClient;
end;

procedure TViewModelMain.GetFileVersion;
var
  i: Integer;
  AppFile: TFileName;
  FileVersion: string;
begin
  FApplicationData.First;
  for i := 0 to Pred(FApplicationData.RecordCount) do
  begin
    AppFile := FAppPath + FApplicationData.FieldByName('path').AsString +
    FApplicationData.FieldByName('nama').AsString;

    if FileExists(AppFile) then
    begin
      FileVersion := AppVersion(AppFile);
      FApplicationData.Edit;
      FApplicationData.FieldByName('versi_now').AsString := FileVersion;
      FApplicationData.Post;
    end;

    FApplicationData.Next;
  end;

end;

function TViewModelMain.GetNow: LongInt;
var
  LStart: TDate;
begin
  // let's start from 2015
  LStart := EncodeDate(2015, 1, 1);
  Result := DaysBetween(LStart, Date);
end;

procedure TViewModelMain.OnMaxProgressChange(AProc: TProcInt);
begin
  FOnMaxProgressChange := AProc;
end;

procedure TViewModelMain.OnProgressChange(AProc: TProcIntMsg);
begin
  FOnProgressChange := AProc;
end;

procedure TViewModelMain.OpenFormSetting;
begin
  //
end;

procedure TViewModelMain.SetOnLoadClient(AProc: TProc<TClient>);
begin
  FOnLoadClient := AProc;
end;

procedure TViewModelMain.SetOnShowMessage(AProc: TProci);
begin
  FOnShowMessage := AProc;
end;

procedure TViewModelMain.Start;
var
  LCid: string;
begin
  if not(FDb.IsConnected) then
  begin
    FOnShowMessage('Tidak Dapat Terhubung Ke Database');
    Exit;
  end;

  LCid := FDb.GetClientId;
  if (LCid = '') then
  begin
    FOnShowMessage('Kode Perusahaan Tidak Ditemukan Pada Database');
    Exit;
  end;

  FClient := FApi.GetAsT<TClient>(PATH_CLIENT + LCid);
  if (Assigned(FOnLoadClient)) then
    FOnLoadClient(FClient);

  FApiApplication.GetToAdapter(PATH_APPLICATION);
  FApplicationData := FApiApplication.Adapter.Dataset;
  GetFileVersion;
end;

procedure TViewModelMain.Update;
begin
  if not(DirectoryExists(FAppTempPath)) then
  begin
    CreateDir(FAppTempPath);
  end;

  if FClient.Expired < GetNow then
  begin
    FOnShowMessage('Masa Garansi Sudah Expired pada: ' +
      FormatDateTime('dd MMM yyyy', FClient.GetExpiredDate));
    Exit;
  end;

  FApplicationData.First;
  CheckApplication;
end;

procedure TViewModelMain.CheckApplication;
var
  LNama: string;
  LVersiOnline: string;
  LVersiOffline: string;
  LUrl: string;
begin
  if FApplicationData.Eof then Exit;

  LNama := FApplicationData.FieldByName('nama').AsString;
  LUrl:= FApplicationData.FieldByName('download').AsString;
  LVersiOnline := FApplicationData.FieldByName('versi').AsString;
  LVersiOffline:= FApplicationData.FieldByName('versi_now').AsString;

  if not SameStr(LVersiOnline, LVersiOffline) then
  begin
    UpdateApplication(LNama, LUrl);
  end else
  begin
    FApplicationData.Next;
    CheckApplication;
  end;
end;

procedure TViewModelMain.UpdateApplication(AFileName, AUrl: string);
var
  LFileName: string;
begin
  if ProcessExists(AFileName) then
  begin
    FOnShowMessage('Tidak Bisa Update, Applikasi ' + AFileName + ' masih berjalan');
    Exit;
  end;

  LFileName := TPath.Combine(FAppTempPath, TPath.GetFileName(AUrl));

  if FileExists(LFileName) then
  begin
    ExtractDownloadedFile;
    Exit;
  end;

  try
    FDownloadStream := TFileStream.Create(LFileName, fmCreate);
    FDownloadStream.Position := 0;

    FGlobalStart := TThread.GetTickCount;

    // Start the download process
    FAsyncResult := FDownload.BeginGet(DoEndDownload, AUrl, FDownloadStream);
  finally
  end;
end;

procedure TViewModelMain.ReceiveDataEvent(const Sender: TObject; AContentLength, AReadCount: Int64;
  var Abort: Boolean);
var
  LTime: Cardinal;
  LSpeed: Integer;
begin
  LTime := TThread.GetTickCount - FGlobalStart;
  LSpeed := (AReadCount * 1000) div LTime;
  TThread.Queue(nil,
    procedure
    begin
      FOnMaxProgressChange(AContentLength);
      FOnProgressChange(AReadCount, Format(' %d KB/dtk - %d KB dari %d KB',
      [LSpeed div 1024, AReadCount div 1024, AContentLength div 1024]));
    end);
end;

procedure TViewModelMain.DoEndDownload(const AsyncResult: IAsyncResult);
var
  LAsyncResponse: IHTTPResponse;
begin
  try
    LAsyncResponse := THTTPClient.EndAsyncHTTP(AsyncResult);
    TThread.Synchronize(nil,
      procedure
      begin
        if not(LAsyncResponse.StatusCode = 200) then
        begin
          FOnShowMessage(Format('Download Gagal, %s', [LAsyncResponse.StatusText]));
        end;
      end);
  finally
    LAsyncResponse := nil;
    FreeandNil(FDownloadStream);
    ExtractDownloadedFile;
  end;
end;

procedure TViewModelMain.ExtractDownloadedFile;
var
  LNama: string;
  LUrl: string;
  LPath: string;
  LZipFileName: string;
  LFileName: string;
begin
  LNama := FApplicationData.FieldByName('nama').AsString;
  LUrl:= FApplicationData.FieldByName('download').AsString;
  LPath:= FApplicationData.FieldByName('path').AsString;

  LZipFileName := TPath.Combine(FAppTempPath, TPath.GetFileName(LUrl));
  LFileName := FAppPath + LPath + LNama;

  try
    ExtractZipFile(LZipFileName, LFileName);

    FApplicationData.Edit;
    FApplicationData.FieldByName('versi_now').AsString :=
      FApplicationData.FieldByName('versi').AsString;
    FApplicationData.Post;
  except
  on e: Exception do
    FOnShowMessage(Format('Extract File Gagal, %s', [e.Message]));
  end;

  FApplicationData.Next;
  CheckApplication;
end;

end.
