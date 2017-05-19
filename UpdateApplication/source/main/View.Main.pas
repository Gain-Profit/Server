unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, IPPeerClient, Vcl.StdCtrls, REST.Response.Adapter, REST.Client,
  Data.Bind.ObjectScope, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.ComCtrls, System.DateUtils;

type
  TFrmMain = class(TForm)
    StringGrid1: TStringGrid;
    Client: TRESTClient;
    Req: TRESTRequest;
    Response: TRESTResponse;
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
begin
//  Screen.Cursor := crHourGlass;
//  Req.Resource := 'clients/ps001/expired.json';
//  Req.Execute;
//  Req.ExecuteAsync(procedure
//                   begin
//                     ShowMessage(Req.Response.JSONText);
//                   end);
//  ShowMessage(Response.JSONText);
//  Screen.Cursor := crDefault;
  Expired := EncodeDate(2015, 1, 1);
  ShowMessage(IntToStr(DaysBetween(Expired, Date)));
end;

end.
