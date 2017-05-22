unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, ViewModel.Main, Model.Main,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, Datasnap.DBClient,
  REST.Response.Adapter;

type
  TFrmMain = class(TForm)
    SgApp: TStringGrid;
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
    DataSet: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    DataSetNama: TStringField;
    DataSetVersi: TStringField;
    DataSetPath: TStringField;
    DataSetDownload: TStringField;
    DataSetMd5: TStringField;
    DataSetversi_now: TStringField;
    procedure BtnCekUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FVm: TViewModelMain;
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
  FVm.Start;
  Screen.Cursor := crDefault;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FVm := TViewModelMain.Create;
  FVm.Api.Adapter.Dataset := DataSet;
  FVm.SetOnShowMessage(
    procedure(msg: string)
    begin
      ShowMessage(msg);
    end);

  FVm.SetOnLoadClient(
    procedure(AClient: TClient)
    begin
      EdKode.Text := AClient.Kode;
      EdNama.Text := AClient.Nama;
      EdAlamat.Text := AClient.Alamat;
      EdExpired.Text := FormatDateTime('dd/MM/yyyy', AClient.GetExpiredDate);
    end);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FVm.Free;
end;

end.
