unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, ViewModel.Main;

type
  TFrmMain = class(TForm)
    StringGrid1: TStringGrid;
    PnlHeader: TPanel;
    StatusBar1: TStatusBar;
    PnlFooter: TPanel;
    BtnCekUpdate: TButton;
    BtnUpdate: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdKode: TEdit;
    EdExpired: TEdit;
    EdNama: TEdit;
    EdAlamat: TEdit;
    procedure BtnCekUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FVm : TViewModelMain;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.BtnCekUpdateClick(Sender: TObject);
begin
  FVm.Start('ps001');
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FVm := TViewModelMain.Create;
  FVm.SetOnShowMessage(procedure (msg: string)
                       begin
                         ShowMessage(msg);
                       end);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FVm.Free;
end;

end.
