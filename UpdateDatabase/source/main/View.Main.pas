unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

end.
