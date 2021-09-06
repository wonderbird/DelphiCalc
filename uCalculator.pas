unit uCalculator;

interface

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
  begin
  end;

  procedure TCalcStatus.NewOperation(Oper: TOperatorEnum);
  begin
    CalcTotal;
    FOperation := Oper;
  end;

  function TCalcStatus.DisplayValue: string;
  begin
    Result := '';
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
