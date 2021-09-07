unit uCalculator;

interface

uses System.SysUtils;

type

  TOperatorEnum = (opNull, opAdd, opSubtract, opMultiply, opDivide);

  TCalcStatus = class
  private
    FInputValue: string;
    FCurrentTotal: Double;
    FOperation: TOperatorEnum;
    FDisplayTotal: Boolean;

  public
    constructor Create;

    procedure AddDigit(Digit: string);
    procedure AddDecimalSeparator;
    procedure CalcTotal;
    procedure NewOperation(Oper: TOperatorEnum);
    function DisplayValue: string;
  end;

  TCalculator = class

  public
    class function Add(a, b: Double): Double;
    class function Subtract(a, b: Double): Double;
    class function Multiply(a, b: Double): Double;
    class function Divide(a, b: Double): Double;
  end;

implementation

  {TCalcStatus}

  constructor TCalcStatus.Create;
  begin
  end;

  procedure TCalcStatus.AddDigit(Digit: string);
  begin
    FDisplayTotal := False;
    FInputValue := FInputValue + Digit;
  end;

  procedure TCalcStatus.AddDecimalSeparator;
  begin
    FInputValue := FInputValue + FormatSettings.DecimalSeparator;
  end;

  procedure TCalcStatus.CalcTotal;
  var
    NewValue: Double;
  begin
    NewValue := StrToFloat(FInputValue);
    case FOperation of
      opNull: FCurrentTotal := NewValue;
      opAdd: FCurrentTotal := TCalculator.Add(FCurrentTotal, NewValue);
      opSubtract: FCurrentTotal := TCalculator.Subtract(FCurrentTotal, NewValue);
      opMultiply: FCurrentTotal := TCalculator.Multiply(FCurrentTotal, NewValue);
      opDivide: FCurrentTotal := TCalculator.Divide(FCurrentTotal, NewValue);
    end;

    // reset status
    FOperation := opNull;
    FDisplayTotal := True;
    FInputValue := '';
  end;

  procedure TCalcStatus.NewOperation(Oper: TOperatorEnum);
  begin
    CalcTotal;
    FOperation := Oper;
  end;

  function TCalcStatus.DisplayValue: string;
  begin
    if FDisplayTotal then
      Result := FloatToStr(FCurrentTotal)
    else
      Result := FInputValue;
  end;

  {TCalculator}

  class function TCalculator.Add(a, b: Double): Double;
  begin
    Result := a + b;
  end;

  class function TCalculator.Subtract(a, b: Double): Double;
  begin
    Result := a - b;
  end;

  class function TCalculator.Multiply(a, b: Double): Double;
  begin
    Result := a * b;
  end;

  class function TCalculator.Divide(a, b: Double): Double;
  begin
    Result := a / b;
  end;

end.
