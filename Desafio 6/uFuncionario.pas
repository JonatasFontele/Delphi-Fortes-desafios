unit uFuncionario;

interface

type
  TFuncionario = class
  private
    FCodigo: Integer;
    FSalario: Currency;
    FNome: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: Currency);
    function AumentarSalario: Currency;
  public
    constructor Create(PCodigo: Integer; PSalario: Currency);
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Salario: Currency read FSalario write SetSalario;
    property AumentoSalario: Currency read AumentarSalario;

  end;

implementation

uses
  SysUtils;

{ TFuncionario }

procedure TFuncionario.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
  //if StrToInt(Value) then
  {FCodigo := StrToInt(Value);
  if Length(Value) = 0 then // Value = '' se fosse string
    raise Exception.Create('N�o � poss�vel adicionar um campo vazio.')
  else
    raise Exception.Create('O valor precisa ser um n�mero inteiro.');}
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: Currency);
begin
  FSalario := Value;
end;

function TFuncionario.AumentarSalario: Currency;
begin
  Result := FSalario + FSalario * 0.05;
end;

constructor TFuncionario.Create(PCodigo: Integer; PSalario: Currency);
begin
  FCodigo := PCodigo;
  FSalario := PSalario;
end;

end.
