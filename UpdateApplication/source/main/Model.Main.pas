unit Model.Main;

interface

uses
  Classes, System.SysUtils, System.DateUtils;

type
  TClient = class(TObject)
  private
    FKode: string;
    FNama: string;
    FAlamat: string;
    FExpired: LongInt;
  public
    constructor Create; overload;
    constructor Create(AKode, ANama, AAlamat: string;
      AExpired: LongInt); overload;
    function GetExpiredDate: TDate;
  published
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property Alamat: string read FAlamat write FAlamat;
    property Expired: LongInt read FExpired write FExpired;
  end;

  TVersion = class(TObject)
  protected
    FMajor: Integer;
    FMinor: Integer;
    FRelease: Integer;
    FBuild: Integer;
  public
    constructor Create(AMayor, AMinor, ARelease, ABuild: Integer); overload;
    constructor Create(const AVersion: String); overload;
    function CompareTo(const version: TVersion): Integer;
    function AsString: string;
    class function Equal(const left, right: TVersion): Boolean;
    class function NotEqual(const left, right: TVersion): Boolean;
    class function GreaterThan(const left, right: TVersion): Boolean;
    class function LessThan(const left, right: TVersion): Boolean;
  published
    property Major: Integer read FMajor;
    property Minor: Integer read FMinor;
    property Release: Integer read FRelease;
    property Build: Integer read FBuild;
  end;

  TApplication = class(TObject)
  private
    FPath: string;
    FName: string;
    FVersion: string;
    FUrl: string;
    FMd5: string;
  public
    constructor Create(APath, AName, AVersion, AUrl, AMd5: string);
  published
    property Path: string read FPath;
    property Name: string read FName;
    property version: string read FVersion;
    property Url: string read FUrl;
    property Md5: string read FMd5;
  end;

implementation

{ TClient }

{ TClient }

constructor TClient.Create(AKode, ANama, AAlamat: string; AExpired: Integer);
begin
  FKode := AKode;
  FNama := ANama;
  FAlamat := AAlamat;
  FExpired := AExpired;
end;

function TClient.GetExpiredDate: TDate;
var
  LStart: TDate;
begin
  LStart := EncodeDate(2015, 1, 1);
  Result := IncDay(LStart, FExpired);
end;

constructor TClient.Create;
begin
  inherited Create;
end;

{ TApplication }

constructor TApplication.Create(APath, AName, AVersion, AUrl, AMd5: string);
begin
  FPath := APath;
  FName := AName;
  FVersion := AVersion;
  FUrl := AUrl;
  FMd5 := AMd5;
end;

{ TVersion }

function TVersion.AsString: string;
begin
  Result := Format('%d.%d.%d.%d', [Self.FMajor, Self.FMinor, Self.FRelease,
    Self.FBuild]);
end;

constructor TVersion.Create(AMayor, AMinor, ARelease, ABuild: Integer);
begin
  FMajor := AMayor;
  FMinor := AMinor;
  FRelease := ARelease;
  FBuild := ABuild;
end;

function TVersion.CompareTo(const version: TVersion): Integer;
begin
  Result := Major - version.Major;
  if Result = 0 then
  begin
    Result := Minor - version.Minor;
    if Result = 0 then
    begin
      Result := Release - version.Release;
      if Result = 0 then
        Result := Build - version.Build;
    end;
  end;
end;

constructor TVersion.Create(const AVersion: String);
var
  LVersion: TStrings;
begin
  LVersion := TStringList.Create;
  LVersion.Delimiter := '.';
  LVersion.DelimitedText := AVersion;

  Self.FMajor := 0;
  Self.FMinor := 0;
  Self.FRelease := 0;
  Self.FBuild := 0;

  if LVersion.Count > 0 then
    Self.FMajor := StrToIntDef(LVersion[0], 0);

  if LVersion.Count > 1 then
    Self.FMinor := StrToIntDef(LVersion[1], 0);

  if LVersion.Count > 2 then
    Self.FRelease := StrToIntDef(LVersion[2], 0);

  if LVersion.Count > 3 then
    Self.FBuild := StrToIntDef(LVersion[3], 0);

  FreeAndNil(LVersion);
end;

class function TVersion.Equal(const left, right: TVersion): Boolean;
begin
  Result := left.CompareTo(right) = 0;
end;

class function TVersion.GreaterThan(const left, right: TVersion): Boolean;
begin
  Result := left.CompareTo(right) > 0;
end;

class function TVersion.LessThan(const left, right: TVersion): Boolean;
begin
  Result := left.CompareTo(right) < 0;
end;

class function TVersion.NotEqual(const left, right: TVersion): Boolean;
begin
  Result := left.CompareTo(right) <> 0;
end;

end.
