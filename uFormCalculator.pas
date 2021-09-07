unit uFormCalculator;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,

  uCalculator;

type
  TFormCalc = class(TForm)
    LayoutDisplay: TLayout;
    LabelDisplay: TLabel;
    GridLayoutButtons: TGridLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Refresh;

    procedure ButtonNumberClick(Sender: TObject);
    procedure ButtonDecimalClick(Sender: TObject);
    procedure ButtonEqualsClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonSubtractClick(Sender: TObject);
    procedure ButtonMultiplyClick(Sender: TObject);
    procedure ButtonDivideClick(Sender: TObject);
  private
    { Private-Deklarationen }
    CalcStatus: TCalcStatus;
  public
    { Public-Deklarationen }
  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.fmx}

  procedure TFormCalc.FormCreate(Sender: TObject);
  begin
    CalcStatus := TCalcStatus.Create;
  end;

  procedure TFormCalc.FormDestroy(Sender: TObject);
  begin
    CalcStatus.Free;
  end;

  procedure TFormCalc.Refresh;
  begin
    LabelDisplay.Text := CalcStatus.DisplayValue;
  end;

  procedure TFormCalc.ButtonNumberClick(Sender: TObject);
  begin
    CalcStatus.AddDigit((Sender as TButton).Text);
    Refresh;
  end;

  procedure TFormCalc.ButtonDecimalClick(Sender: TObject);
  begin
    CalcStatus.AddDecimalSeparator;
    Refresh;
  end;

  procedure TFormCalc.ButtonEqualsClick(Sender: TObject);
  begin
    CalcStatus.CalcTotal;
    Refresh;
  end;

  procedure TFormCalc.ButtonAddClick(Sender: TObject);
  begin
    CalcStatus.NewOperation(opAdd);
    Refresh;
  end;

  procedure TFormCalc.ButtonSubtractClick(Sender: TObject);
  begin
    CalcStatus.NewOperation(opSubtract);
    Refresh;
  end;

  procedure TFormCalc.ButtonMultiplyClick(Sender: TObject);
  begin
    CalcStatus.NewOperation(opMultiply);
    Refresh;
  end;

  procedure TFormCalc.ButtonDivideClick(Sender: TObject);
  begin
    CalcStatus.NewOperation(opDivide);
    Refresh;
  end;

end.
