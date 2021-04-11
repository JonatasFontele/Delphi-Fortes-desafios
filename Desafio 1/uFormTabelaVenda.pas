unit uFormTabelaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, uFormPrincipal;

type
  TFrmTabelaVenda = class(TForm)
    GrdProdutos: TStringGrid;
    BtnAdicionar: TButton;
    BtnEditar: TButton;
    BtnRemover: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FrmPrincipal: TFrmPrincipal;
  public
    { Public declarations }
  end;

//var
  //FrmTabelaVenda: TFrmTabelaVenda;

implementation

{$R *.dfm}

procedure TFrmTabelaVenda.FormCreate(Sender: TObject);
var
  I, TamanhoLista: Integer;
begin
  TamanhoLista := FrmPrincipal.GetTamanhoLista; // Quantidade de itens

  //Prepara cabeçalho
  GrdProdutos.ColCount := 3;
  GrdProdutos.RowCount := TamanhoLista + 1;
  GrdProdutos.ColWidths[0] := 150;
  GrdProdutos.ColWidths[1] := 100;
  GrdProdutos.ColWidths[2] := 100;
  GrdProdutos.Cells[0,0] := 'Produto';
  GrdProdutos.Cells[1,0] := 'Quantidade';
  GrdProdutos.Cells[2,0] := 'Preço';
  for I := 0 to TamanhoLista - 1  do
  begin
    GrdProdutos.Cells[0,I + 1] := FrmPrincipal.GetProduto(I);
    GrdProdutos.Cells[1,I + 1] := IntToStr(FrmPrincipal.GetQuantidade(I));
    GrdProdutos.Cells[2,I + 1] := CurrToStrF(FrmPrincipal.GetPreco(I), ffCurrency, 2);
  end;
end;

end.
