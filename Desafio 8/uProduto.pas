unit uProduto;

interface

uses
  System.SysUtils;

type
  TProduto = class
  private
    FCodigo: Integer;
    FNome: string;
    FQuantidade: Integer;
    FPreco: Currency;
    FValorFinal: Currency;

    procedure SetValorFinal(const Value: Currency);

  public
    constructor Create(PNome: string; PPreco: Currency); Overload;
    constructor Create(PCodigo: Integer; PNome: string); Overload;

    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property Preco: Currency read FPreco write FPreco;

    // Preco * Quantidade
    function CalculaValorTotalItem: Currency;
    // Valor do total vendido por cada produto
    property ValorFinal: Currency read FValorFinal write SetValorFinal;
  end;

implementation

{ TVenda }

function TProduto.CalculaValorTotalItem: Currency;
begin
  Result := Preco * Quantidade;
end;

procedure TProduto.SetValorFinal(const Value: Currency);
begin
  FValorFinal := FValorFinal + Value;
end;

// Construtor para o dicionário
constructor TProduto.Create(PNome: string; PPreco: Currency);
begin
  FNome := PNome;
  FPreco := PPreco;
end;

// Construtor para o array
constructor TProduto.Create(PCodigo: Integer; PNome: string);
begin
  FCodigo := PCodigo;
  FNome := PNome;
end;

end.
