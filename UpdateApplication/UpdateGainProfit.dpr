program UpdateGainProfit;

uses
  Vcl.Forms,
  View.Main in 'source\main\View.Main.pas' {FrmMain},
  Model.Main in 'source\main\Model.Main.pas',
  ApiUtils in 'source\ApiUtils.pas',
  ViewModel.Main in 'source\main\ViewModel.Main.pas',
  DbUtils in 'source\DbUtils.pas',
  FileUtils in 'source\FileUtils.pas',
  View.Setting in 'source\setting\View.Setting.pas' {FrmSetting},
  ViewModel.Setting in 'source\setting\ViewModel.Setting.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
