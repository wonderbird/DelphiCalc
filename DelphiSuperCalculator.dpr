program DelphiSuperCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCalculator in 'uFormCalculator.pas' {FormCalc},
  uCalculator in 'uCalculator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCalc, FormCalc);
  Application.Run;
end.
