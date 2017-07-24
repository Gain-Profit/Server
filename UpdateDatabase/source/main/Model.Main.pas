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
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    property Alamat: string read FAlamat write FAlamat;
    property Expired: LongInt read FExpired write FExpired;
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

end.
