unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, IPPeerClient, Vcl.StdCtrls, REST.Response.Adapter, REST.Client,
  Data.Bind.ObjectScope, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.ComCtrls;

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
begin
  Screen.Cursor := crHourGlass;
  Req.Resource := 'profit.json';
  Req.Execute;
  Screen.Cursor := crDefault;
end;

end.
