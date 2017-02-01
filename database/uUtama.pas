unit uUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, mySQLDbTables, ComCtrls, StdCtrls, MySQLBatch, ExtCtrls;

type
  TFUtama = class(TForm)
    Con: TmySQLDatabase;
    pgc1: TPageControl;
    TsKoneksi: TTabSheet;
    TsDatabase: TTabSheet;
    GbKoneksi: TGroupBox;
    Label4: TLabel;
    EdPassword: TEdit;
    EdUser: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    EdPort: TEdit;
    EdHost: TEdit;
    Label1: TLabel;
    GbDb: TGroupBox;
    Label5: TLabel;
    EdDatabase: TEdit;
    EdUserDb: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdPasswordDb: TEdit;
    EdPerusahaan: TEdit;
    Label8: TLabel;
    pnl1: TPanel;
    BtnConnect: TButton;
    procedure BtnConnectClick(Sender: TObject);
    procedure ConAfterConnect(Sender: TObject);
    procedure ConAfterDisconnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FFileMaster: TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

{$R *.dfm}

procedure TFUtama.BtnConnectClick(Sender: TObject);
var
  FileMaster: TFileName;
begin
  Con.Host:= EdHost.Text;
  Con.Port:= StrToIntDef(EdPort.Text, 3306);
  Con.UserName:= EdUser.Text;
  Con.UserPassword:= EdPassword.Text;
  Con.Connected:= True;
  if not(Con.Connected) then
  begin
    ShowMessage('Tidak Dapat Terhubung Dengan ' + Con.Host);
    Exit;
  end;

  FileMaster:= ExtractFilePath(Application.ExeName) + 'db\v_2_1_4.sql';
  if not(FileExists(FileMaster)) then
  begin
    ShowMessage('file : ' + FileMaster + ' Tidak Ketemu');
    Exit;
  end;
  FFileMaster.LoadFromFile(FileMaster);
  try
    Con.StartTransaction;
    Con.Execute(Format('CREATE DATABASE IF NOT EXISTS `%s`', [EdDatabase.Text]));
    Con.Execute(Format('CREATE USER IF NOT EXISTS "%s"@"%%" IDENTIFIED BY "%s"',
      [EdUserDb.Text, EdPasswordDb.Text]));
    Con.Execute(Format('GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE '+
      'ON `%s`.* TO "%s"@"%%"', [EdDatabase.Text, EdUserDb.Text]));
    Con.SelectDB(EdDatabase.Text);
    Con.Execute(FFileMaster.Text);
    Con.Execute(Format('Call sp_awal_install("%s")', [EdPerusahaan.Text]));
    Con.Execute('Call sp_awal_akun');
    Con.Execute('Call sp_awal_kiraan_all');
    Con.Commit;
    ShowMessage('Pembuatan Database Berhasil');
  except
    Con.Rollback;
    Con.Execute(Format('DROP DATABASE IF EXISTS `%s`', [EdDatabase.Text]));
    Con.Execute(Format('DROP USER IF EXISTS "%s"@"%%"', [EdUserDb.Text]));
    ShowMessage('Pembuatan Database Gagal');
  end;

end;

procedure TFUtama.ConAfterConnect(Sender: TObject);
begin
  Caption:= 'Utama Connected to: ' + Con.Host;
end;

procedure TFUtama.ConAfterDisconnect(Sender: TObject);
begin
  Caption:= 'Utama Not Connected';
end;

procedure TFUtama.FormCreate(Sender: TObject);
begin
  FFileMaster:= TStringList.Create;
end;

procedure TFUtama.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFileMaster.Free;
end;

end.
