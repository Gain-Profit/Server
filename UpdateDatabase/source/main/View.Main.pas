unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Generics.Collections, Model.Main, System.JSON;

type
  TFrmMain = class(TForm)
    PnlHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdKode: TEdit;
    EdExpired: TEdit;
    EdNama: TEdit;
    EdAlamat: TEdit;
    PnlFooter: TPanel;
    BtnCekUpdate: TButton;
    BtnUpdate: TButton;
    BtnSetting: TButton;
    PnlDownload: TPanel;
    LblDownload: TLabel;
    PbDownload: TProgressBar;
    EdVersiNew: TEdit;
    Label5: TLabel;
    EdVersiOld: TEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LDaftar: TList<TDbVersion>;
  LIsi: TDbVersion;
  I: Integer;
begin
  LDaftar := TList<TDbVersion>.Create;
  for I := 1 to 4 do
  begin
    LIsi := TDbVersion.Create('ID00' + IntToStr(I), IntToStr(I), 'https:\\aku.sql');
    LDaftar.Add(LIsi);
  end;

  for LIsi in LDaftar do
  begin
    ShowMessage(LIsi.FId);
  end;
end;

end.
