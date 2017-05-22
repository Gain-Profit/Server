unit ViewModel.Main;

interface

uses
  Model.Main, ApiUtils, classes, System.SysUtils;

type
  TProci = reference to procedure (msg: string);

  TViewModelMain = class
  private
    FApi: TFirebaseApi;
    FClientId: string;
    FClient : TClient;
    FOnShowMessage : TProci;
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
  CLIENT_ID_CANNOT_BE_EMPTY = 'Client Id Cannot be empty';

{ TViewModelMain }

constructor TViewModelMain.Create;
begin
  FClient := TClient.Create;
  FApi := TFirebaseApi.Create(BASE_URL);
end;

destructor TViewModelMain.Destroy;
begin
  FClient.Free;
  FApi.Free;
end;

function TViewModelMain.GetClient: TClient;
begin
  if (FClientId = '') then
  begin
    raise Exception.Create(CLIENT_ID_CANNOT_BE_EMPTY);
  end;

  Result := FApi.GetAsT<TClient>(PATH_CLIENT + FClientId);
end;

procedure TViewModelMain.SetOnShowMessage(AProc: TProci);
begin
  FOnShowMessage := AProc;
end;

procedure TViewModelMain.Start(ACid: string);
begin
  FClientId := ACid;
end;

end.
