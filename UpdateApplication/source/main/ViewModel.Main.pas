unit ViewModel.Main;

interface

uses
  Model.Main, ApiUtils, System.DateUtils, System.SysUtils;

type
  TProci = reference to procedure (msg: string);

  TViewModelMain = class
  private
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
    procedure Start(ACid: string);
    procedure SetOnShowMessage(AProc: TProci);
    procedure SetOnLoadClient(AProc: TProc<TClient>);
  published
    property Client: TClient read GetClient;
  end;

implementation

const
  BASE_URL = 'https://gain-profit-update.firebaseio.com';
  PATH_CLIENT = 'clients/';

{ TViewModelMain }

constructor TViewModelMain.Create;
begin
  FClient := TClient.Create;
  FApi := TFirebaseApi.Create(BASE_URL);
end;

destructor TViewModelMain.Destroy;
begin
  if not(FClient = nil) then
    FClient.Free;

  FApi.Free;
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
  LStart := EncodeDate(2015,1,1);
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

procedure TViewModelMain.Start(ACid: string);
begin
  FClient := FApi.GetAsT<TClient>(PATH_CLIENT + ACid);
  if (Assigned(FOnLoadClient)) then
    FOnLoadClient(FClient);

  if FClient.Expired < GetNow then
  begin
    FOnShowMessage('Masa Garansi Sudah Expired');
    Exit;
  end;
end;

end.
