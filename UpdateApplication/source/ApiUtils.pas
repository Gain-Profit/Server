unit ApiUtils;

interface

uses
  REST.Client, System.SysUtils, REST.Json, IPPeerClient,
  REST.Response.Adapter;

Type
  TFirebaseApi = class
  private
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
    FAdapter: TRESTResponseDataSetAdapter;
  public
    constructor Create(const ABaseApiURL: string; ARootElement: string = '');
    destructor Destroy;
    function Get(const APath: string): string;
    function GetAsT<T: class, constructor>(const APath: string): T;
    procedure GetAsync(const APath: string; AProc: TProc = nil);
    procedure GetToAdapter(const APath: string);
  published
    property Adapter: TRESTResponseDataSetAdapter read FAdapter;
  end;

implementation

{ TRestApi }

constructor TFirebaseApi.Create(const ABaseApiURL: string; ARootElement: string = '');
begin
  FClient := TRESTClient.Create(ABaseApiURL);
  FClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  FClient.AcceptCharset := 'UTF-8, *;q=0.8';
  FClient.HandleRedirects := True;

  FResponse := TRESTResponse.Create(FClient);
  FResponse.ContentType := 'application/json';
  FResponse.RootElement := ARootElement;

  FRequest := TRESTRequest.Create(FClient);
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
  FRequest.SynchronizedEvents := True;

  FAdapter := TRESTResponseDataSetAdapter.Create(FClient);
  FAdapter.Response := FResponse;
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

function TFirebaseApi.GetAsT<T>(const APath: string): T;
begin
  FRequest.Resource := APath + '.json';
  FRequest.Execute;
  Result := TJson.JsonToObject<T>(FResponse.JSONText);
end;

procedure TFirebaseApi.GetAsync(const APath: string; AProc: TProc);
begin
  FRequest.Resource := APath + '.json';
  FRequest.ExecuteAsync(AProc);
end;

procedure TFirebaseApi.GetToAdapter(const APath: string);
begin
  FRequest.Resource := APath + '.json';
  FRequest.Execute;
end;

end.
