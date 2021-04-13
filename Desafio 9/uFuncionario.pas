unit uFuncionario;

interface

type
  TFuncionario = class
  private
    FCodigo: Integer;
    FNome: string;
    FSalario: Currency;
    FData:  TDateTime;

    procedure SetSalario(const Value: Currency);
    function AumentarSalario: Currency;
  public
    constructor Create(PCodigo: Integer; PSalario: Currency);
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Salario: Currency read FSalario write SetSalario;
    property Data: TDateTime read FData write FData;
    property AumentoSalario: Currency read AumentarSalario;

  end;

implementation

uses
  SysUtils;

{ TFuncionario }

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
