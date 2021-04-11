unit uProduto;

interface

type
  TProduto = class
  private
    FCodigo: Integer;
    FNome: string;
    FPreco: Currency;
    procedure SetNome(const Value: string);
  public
    constructor Create(PNome: string; PPreco: Currency);
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write SetNome;
    property Preco: Currency read FPreco write FPreco;
  end;

implementation

{ TProduto }

uses
  SysUtils;

procedure TProduto.SetNome(const Value: string);
begin
  if Value <> '' then
    FNome := Value
  else
    raise EConvertError.Create('Informe o nome');
end;

constructor TProduto.Create(PNome: string; PPreco: Currency);
begin
  FNome := PNome;
  FPreco := PPreco;
end;

end.
