unit uUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, mySQLDbTables, ComCtrls, StdCtrls, MySQLBatch;

type
  TFUtama = class(TForm)
    Con: TmySQLDatabase;
    pgc1: TPageControl;
    TsKoneksi: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdHost: TEdit;
    EdPort: TEdit;
    EdUser: TEdit;
    EdPassword: TEdit;
    BtnConnect: TButton;
    TsDatabase: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdDatabase: TEdit;
    EdUserDb: TEdit;
    EdPasswordDb: TEdit;
    BtnBuat: TButton;
    Batch: TMySQLBatchExecute;
    Label8: TLabel;
    EdPerusahaan: TEdit;
    procedure BtnConnectClick(Sender: TObject);
    procedure ConAfterConnect(Sender: TObject);
    procedure BtnBuatClick(Sender: TObject);
    procedure ConAfterDisconnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUtama: TFUtama;

implementation

{$R *.dfm}

procedure TFUtama.BtnConnectClick(Sender: TObject);
begin
  Con.Host:= EdHost.Text;
  Con.Port:= StrToIntDef(EdPort.Text, 3306);
  Con.UserName:= EdUser.Text;
  Con.UserPassword:= EdPassword.Text;
  Con.Connected:= True;
  if Con.Connected then
    ShowMessage('Berhasil terhubung dengan ' + Con.Host);
end;

procedure TFUtama.ConAfterConnect(Sender: TObject);
begin
  Caption:= 'Utama Connected to: ' + Con.Host;
  BtnBuat.Enabled:= True;
end;

procedure TFUtama.BtnBuatClick(Sender: TObject);
var FileMaster: string;
begin
  FileMaster:= ExtractFilePath(Application.ExeName) + 'db\v_2_1_4.sql';
  if not(FileExists(FileMaster)) then
  begin
    ShowMessage('file tidak ketemu: ' + FileMaster);
    Exit;
  end;  
  try
    Con.StartTransaction;
    Con.Execute(Format('CREATE DATABASE IF NOT EXISTS `%s`', [EdDatabase.Text]));
    Con.Execute(Format('CREATE USER IF NOT EXISTS "%s"@"%%" IDENTIFIED BY "%s"',
      [EdUserDb.Text, EdPasswordDb.Text]));
    Con.Execute(Format('GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE '+
      'ON `%s`.* TO "%s"@"%%"', [EdDatabase.Text, EdUserDb.Text]));
    Con.SelectDB(EdDatabase.Text);
    Batch.Database:= Con;
    Batch.Sql.LoadFromFile(FileMaster);
    Batch.ExecSql;
//    Con.Execute(Format('Call sp_awal_install("%s")', [EdPerusahaan.Text]));
//    Con.Execute('Call sp_awal_akun');
//    Con.Execute('Call sp_awal_kiraan_all');
    Con.Commit;
    ShowMessage('Pembuatan Database Berhasil');
  except
    Con.Rollback;
    Con.Execute(Format('DROP DATABASE IF EXISTS `%s`', [EdDatabase.Text]));
    Con.Execute(Format('DROP USER IF EXISTS "%s"@"%%"', [EdUserDb.Text]));
    ShowMessage('Pembuatan Database Gagal');
  end;
end;

procedure TFUtama.ConAfterDisconnect(Sender: TObject);
begin
  BtnBuat.Enabled:= False;
  Caption:= 'Utama Not Connected';
end;

end.
