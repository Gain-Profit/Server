unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, ApiUtils, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls,IPPeerClient, ViewModel.Main;

type
  TFrmMain = class(TForm)
    StringGrid1: TStringGrid;
    PnlHeader: TPanel;
    BtnCekUpdate: TButton;
    StatusBar1: TStatusBar;
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
var
  Expired: TDate;
  Hasil : string;
  LRes : TFirebaseApi;
begin
  FVm.Start('ps001');
  ShowMessage(FVm.Client.Nama);
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
