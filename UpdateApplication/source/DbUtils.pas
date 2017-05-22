unit DbUtils;

interface

uses
  MyAccess, System.SysUtils;

type
  TDatabase = class(TObject)
  private
    FConnection: TMyConnection;
  public
    constructor Create;
    destructor Destroy;
    function IsConnected: Boolean;
  end;

implementation

function Decrypt(const s: string; CryptInt: Integer): string;
var
  i: integer;
  s2: string;
begin
  if not (Length(s) = 0) then
    for i := 1 to Length(s) do
      s2 := s2 + Chr(Ord(s[i]) - cryptint);
  Result := s2;
end;

{ TDatabase }

constructor TDatabase.Create;
var
  host, db, jalur, user, kunci: string;
  X: TextFile;
begin
  FConnection := TMyConnection.Create(nil);

  assignfile(X, 'koneksi.cbCon');
  reset(X);
  readln(X, host);
  readln(X, db);
  readln(X, jalur);
  readln(X, user);
  readln(X, kunci);
  closefile(X);

  with FConnection do
  begin
    Server := Decrypt(host, 6);
    Database := Decrypt(db, 6);
    Username := Decrypt(user, 6);
    Password := Decrypt(kunci, 6);
    port := StrToInt(Decrypt(jalur, 6));
    Connected := True;
  end;

end;

destructor TDatabase.Destroy;
begin
  FConnection.Free;
end;

function TDatabase.IsConnected: Boolean;
begin
  FConnection.Connect;
  Result := FConnection.Connected;
end;

end.
