program UpdateDatabase;

uses
  Vcl.Forms,
  View.Main in 'source\main\View.Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
