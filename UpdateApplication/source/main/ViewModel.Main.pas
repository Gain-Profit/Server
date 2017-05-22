unit ViewModel.Main;

interface

uses
  Model.Main, ApiUtils;

type
  TProci = reference to procedure (msg: string);

  TViewModelMain = class
  private
    FApi: TFirebaseApi;
    FClient : TClient;
    FOnShowMessage : TProci;
    FStarted: Boolean;
    function GetClient: TClient;
  public
    constructor Create;
    destructor Destroy;
    procedure Start(ACid: string);
    procedure SetOnShowMessage(AProc: TProci);
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

procedure TViewModelMain.SetOnShowMessage(AProc: TProci);
begin
  FOnShowMessage := AProc;
end;

procedure TViewModelMain.Start(ACid: string);
begin
  FClient := FApi.GetAsT<TClient>(PATH_CLIENT + ACid);
end;

end.
