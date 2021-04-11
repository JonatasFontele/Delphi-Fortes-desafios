unit uCalculadora;

interface

type
  TCalculadora = class
  private
    FValorCapital, FJurosSimples, FMontanteSimples, FMontanteComposto: Currency;
    FTaxaJuros: Double;
    FTempo: Integer;

    procedure CalculaParcelas;

  public
    function CalculaJurosSimples: Currency;
    function CalculaMontanteSimples: Currency;
    function CalculaMontanteComposto: Currency;

    property ValorCapital: Currency read FValorCapital write FValorCapital;
    property TaxaJuros: Double read FTaxaJuros write FTaxaJuros;
    property Tempo: Integer read FTempo write FTempo;

  end;

implementation

{ TCalculadora }
uses
  Math;

procedure TCalculadora.CalculaParcelas;
var
  ParcelaSimples, ParcelaComposta, CapitalInicial: Currency;
  I: Integer;
begin

end;

function TCalculadora.CalculaJurosSimples: Currency;
begin
  Result := ValorCapital * TaxaJuros * Tempo; // J = C.i.t
end;

function TCalculadora.CalculaMontanteSimples: Currency;
begin
  Result := ValorCapital + CalculaJurosSimples; // M = C + J
end;

function TCalculadora.CalculaMontanteComposto: Currency;
begin
  Result := ValorCapital * (Power((1 + TaxaJuros), Tempo)); // M = C (1 + i)^t
end;

end.
