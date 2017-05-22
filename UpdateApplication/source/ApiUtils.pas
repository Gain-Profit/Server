unit ApiUtils;

interface

uses
  REST.Client, System.SysUtils;

Type
  TFirebaseApi = class
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
  public
    constructor Create(const ABaseApiURL: string);
    destructor Destroy;
    function Get(const APath: string): string;
    procedure GetAsync(const APath: string; AProc : TProc = nil);
  end;

implementation

{ TRestApi }

constructor TFirebaseApi.Create(const ABaseApiURL: string);
begin
  FClient := TRESTClient.Create(ABaseApiURL);
  FClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  FClient.AcceptCharset := 'UTF-8, *;q=0.8';
  FClient.HandleRedirects := True;

  FResponse := TRESTResponse.Create(FClient);
  FResponse.ContentType := 'application/json';

  FRequest := TRESTRequest.Create(FClient);
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
  FRequest.SynchronizedEvents := True;
end;

destructor TFirebaseApi.Destroy;
begin
  FClient.Free;
end;

function TFirebaseApi.Get(const APath: string): string;
begin
  FRequest.Resource := APath + '.json';
  FRequest.Execute;
  Result := FResponse.JSONText;
end;

procedure TFirebaseApi.GetAsync(const APath: string; AProc: TProc);
begin
  FRequest.Resource := APath + '.json';
  FRequest.ExecuteAsync(AProc);
end;

end.
