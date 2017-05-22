unit ViewModel.Main;

interface

uses
  Model.Main, DbUtils, ApiUtils, System.DateUtils, System.SysUtils;

type
  TProci = reference to procedure(msg: string);

  TViewModelMain = class
  private
    FDb: TDatabase;
    FApi: TFirebaseApi;
    FClient: TClient;
    FOnShowMessage: TProci;
    FOnLoadClient: TProc<TClient>;
    FStarted: Boolean;
    function GetClient: TClient;
    function GetNow: LongInt;
  public
    constructor Create;
    destructor Destroy;
    procedure Start;
    procedure SetOnShowMessage(AProc: TProci);
    procedure SetOnLoadClient(AProc: TProc<TClient>);
  published
    property Client: TClient read GetClient;
    property Api: TFirebaseApi read FApi;
  end;

implementation

const
  BASE_URL = 'https://gain-profit-update.firebaseio.com';
  PATH_CLIENT = 'clients/';
  PATH_APPLICATION = 'profit';

  { TViewModelMain }

constructor TViewModelMain.Create;
begin
  FClient := TClient.Create;
  FApi := TFirebaseApi.Create(BASE_URL);
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

  if FClient.Expired < GetNow then
  begin
    FOnShowMessage('Masa Garansi Sudah Expired');
    Exit;
  end;

  FApi.GetToAdapter(PATH_APPLICATION);
end;

end.
