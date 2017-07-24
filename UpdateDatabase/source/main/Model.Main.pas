unit Model.Main;

interface

uses
  System.SysUtils, System.DateUtils;

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
    property Kode: string read FKode;
    property Nama: string read FNama;
    property Alamat: string read FAlamat;
    property Expired: LongInt read FExpired;
  end;

  TDbVersion = class
    FId: string;
    FVersion: string;
    FUrl: string;
  public
    constructor Create(AId, AVersion, AUrl: string);
  published
    property Id: string read FID;
    property Version: string read FVersion;
    property Url: string read FUrl;
  end;

implementation

{ TClient }

constructor TClient.Create;
begin
  inherited Create;
end;

constructor TClient.Create(AKode, ANama, AAlamat: string; AExpired: LongInt);
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

{ TDbVersion }

constructor TDbVersion.Create(AId, AVersion, AUrl: string);
begin
  FId := AId;
  FVersion := AVersion;
  FUrl := AUrl;
end;

end.
