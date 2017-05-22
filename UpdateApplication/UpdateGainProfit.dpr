program UpdateGainProfit;

uses
  Vcl.Forms,
  View.Main in 'source\main\View.Main.pas' {FrmMain},
  Model.Main in 'source\main\Model.Main.pas',
  ApiUtils in 'source\ApiUtils.pas',
  ViewModel.Main in 'source\main\ViewModel.Main.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.