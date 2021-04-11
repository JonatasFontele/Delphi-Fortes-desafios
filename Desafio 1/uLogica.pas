unit uLogica;

interface

uses
  System.SysUtils;


function CalculaValor(Quantidade: Integer; Preco: Currency): Currency;
function AplicaDesconto(Quantidade: Integer; ValorTotalProduto: Currency): Currency;
function CalculaEconomia(ValorTotalProduto, ValorComDesconto: Currency): string;


implementation

function CalculaValor(Quantidade: Integer; Preco: Currency)
  : Currency;
begin
  Result := Quantidade * Preco;
end;

// Recebe a quantidade de itens e o preço já multiplicado pela quantidade
function AplicaDesconto(Quantidade: Integer; ValorTotalProduto: Currency): Currency;
begin
  if (Quantidade > 3) and (Quantidade <= 10) then
    Result := ValorTotalProduto - (ValorTotalProduto * 0.05)
  else if Quantidade > 10 then
    Result := ValorTotalProduto - (ValorTotalProduto * 0.1)
  else
    Result := ValorTotalProduto;
end;

function CalculaEconomia(ValorTotalProduto, ValorComDesconto: Currency): string;
var
  Porcentagem: Double;
  Desconto: Currency;
begin
  Desconto := ValorTotalProduto - ValorComDesconto;
  Porcentagem := (Desconto * 100) / ValorTotalProduto;
  Result := ' ' + FloatToStrF(Porcentagem, ffNumber, 5, 2) + '%';
end;

end.
