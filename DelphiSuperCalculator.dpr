program DelphiSuperCalculator;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormCalculator in 'uFormCalculator.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
