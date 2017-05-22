unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, ApiUtils, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls,IPPeerClient;

type
  TFrmMain = class(TForm)
    StringGrid1: TStringGrid;
    PnlHeader: TPanel;
    BtnCekUpdate: TButton;
    StatusBar1: TStatusBar;
    procedure BtnCekUpdateClick(Sender: TObject);
  private
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
//  Screen.Cursor := crHourGlass;
//  Expired := EncodeDate(2015, 1, 1);
//  ShowMessage(IntToStr(DaysBetween(Expired, Date)));

  LRes := TFirebaseApi.Create('https://gain-profit-update.firebaseio.com');
  Hasil := LRes.Get('clients/ps001');
  ShowMessage(Hasil);

end;

end.
