unit ViewModel.Main;

interface

uses
  Model.Main, DbUtils, ApiUtils, System.DateUtils, System.SysUtils,
  FileUtils, Data.DB;

type
  TProci = reference to procedure(msg: string);

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
    FStarted: Boolean;
    function GetClient: TClient;
    function GetNow: LongInt;
    procedure GetFileVersion;
  public
    constructor Create(LPath: string; LTempPath: string);
    destructor Destroy;
    procedure Start;
    procedure Update;
    procedure SetOnShowMessage(AProc: TProci);
    procedure SetOnLoadClient(AProc: TProc<TClient>);
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
end;

destructor TViewModelMain.Destroy;
begin
  FClient.Free;
  FApi.Free;
  FDb.Free;
end;

function TViewModelMain.GetClient: TClient;
begin
  Result := FClient;
end;

procedure TViewModelMain.GetFileVersion;
var
  i: Integer;
  Data: TDataSet;
  AppFile: TFileName;
  FileVersion: string;
begin
  Data := FApiApplication.Adapter.Dataset;
  Data.First;
  for i := 0 to Pred(Data.RecordCount) do
  begin
    AppFile := FAppPath + Data.FieldByName('path').AsString +
    Data.FieldByName('nama').AsString;

    if FileExists(AppFile) then
    begin
      FileVersion := AppVersion(AppFile);
      Data.Edit;
      Data.FieldByName('versi_now').AsString := FileVersion;
      Data.Post;
    end;

    Data.Next;
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
end;

end.
