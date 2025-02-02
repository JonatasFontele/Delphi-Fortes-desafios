unit Backup;

{
  Levando em considera��o o card�pio:
  Produto            C�digo     Pre�o
  Cachorro quente    100        9,50
  Bauru simples      101        10,50
  Bauru com ovo      102        12,50
  Hamb�rger          103        9,50
  Cheeseburguer      104        10,50
  Refrigerante       105        5,00



  Escreva uma aplica��o que receba o c�digo do item, a quantidade, calcule
  o valor total do item e ao fechar o pedido exibir o valor a ser pago.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Vcl.FileCtrl, Vcl.Buttons, Vcl.ExtCtrls,
  StrUtils, Contnrs, Generics.Defaults, Generics.Collections, uProduto,
  Vcl.Grids;

type
  TFrmPrincipal = class(TForm)
    EdtCodigo: TEdit;
    LblProduto: TLabel;
    LblCodigo: TLabel;
    EdtQuantidade: TEdit;
    LblQuantidade: TLabel;
    BtnFinalizar: TButton;
    MemResultado: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnInserir: TBitBtn;
    BitBtnRemover: TBitBtn;
    GrdProdutos: TStringGrid;
    EdtProduto: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure BitBtnInserirClick(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
  private
    function ResultadoPedido(Quantidade: Integer; Valor: Currency): Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

{ TODO 1 : Fazer com objetos }
procedure TFrmPrincipal.BitBtnInserirClick(Sender: TObject);
var
  Produto: TProduto;
begin
  // Cria um primeiro objeto e armazena na posi��o 1,1
  Produto := TProduto.Create;
  Produto.Codigo := '1';
  Produto.Nome := 'Wesley Y';
  Produto.Valor := 'M';

  StringGrid1.Objects[1, 1] := Produto;
  StringGrid1.Cells[1, 1] := Produto.Nome;

  // Cria um segundo objeto e armazena na posi��o 1,2 }
  Produto := TProduto.Create;
  Produto.Codigo := '2';
  Produto.Nome := 'Waleska';
  Produto.Valor := 'F';

  StringGrid1.Objects[1, 2] := Produto;
  StringGrid1.Cells[1, 2] := Produto.Nome;
end;

procedure TFrmPrincipal.BtnFinalizarClick(Sender: TObject);
var
  vDict: TDictionary<Integer, string>;
  I: Integer; // C�digo
  Quantidade: Integer;
  Resultado: Currency;
begin
  MemResultado.Clear;
  vDict := TDictionary<Integer, string>.Create();
  try
    vDict.Add(100, 'Cachorro quente');
    vDict.AddOrSetValue(101, 'Bauru simples');
    vDict.AddOrSetValue(102, 'Bauru com ovo');
    vDict.AddOrSetValue(103, 'Hamb�rger');
    vDict.AddOrSetValue(104, 'Cheeseburguer');
    vDict.AddOrSetValue(105, 'Refrigerante');

    I := StrToInt(EdtCodigo.Text);
    Quantidade := StrToInt(EdtQuantidade.Text);

    if vDict.ContainsKey(I) then
    begin
      MemResultado.Lines.Add('Produto: ' + vDict.Items[I]);
      MemResultado.Lines.Add('Quantidade: ' + IntToStr(Quantidade));
      case I of
        100:
          begin
            Resultado := ResultadoPedido(Quantidade, 9.50);
            // CmbBoxProduto.Text := vDict.Items[I];
          end;

        101:
          Resultado := ResultadoPedido(Quantidade, 10.50);
        102:
          Resultado := ResultadoPedido(Quantidade, 12.50);
        103:
          Resultado := ResultadoPedido(Quantidade, 9.50);
        104:
          Resultado := ResultadoPedido(Quantidade, 10.50);
        105:
          Resultado := ResultadoPedido(Quantidade, 5.00);
      end;
      MemResultado.Lines.Add('Valor Final: ' + CurrToStrF(Resultado,
        ffCurrency, 2));
      // FloatToSTrf(r,ffCurrency,18,2)
    end
    else
      ShowMessage('C�digo n�o encontrado.');

  finally
    vDict.Free;
  end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  GrdProdutos.ColCount := 3;
  GrdProdutos.RowCount := 7;
  GrdProdutos.Cells[0,0] := 'Produto';
  GrdProdutos.Cells[1,0] := 'C�digo';
  GrdProdutos.Cells[2,0] := 'Pre�o';

  GrdProdutos.Cells[0,1] := 'Cachorro quente';
  GrdProdutos.Cells[1,1] := '100';
  GrdProdutos.Cells[2,1] := '9,50';

  GrdProdutos.Cells[0,2] := 'Bauru simples';
  GrdProdutos.Cells[1,2] := '101';
  GrdProdutos.Cells[2,2] := '10,50';

  GrdProdutos.Cells[0,3] := 'Bauru com ovo';
  GrdProdutos.Cells[1,3] := '102';
  GrdProdutos.Cells[2,3] := '12,50';

  GrdProdutos.Cells[0,3] := 'Hamb�rger';
  GrdProdutos.Cells[1,3] := '103';
  GrdProdutos.Cells[2,3] := '9,50';

  GrdProdutos.Cells[0,3] := 'Cheeseburguer';
  GrdProdutos.Cells[1,3] := '104';
  GrdProdutos.Cells[2,3] := '10,50';

  GrdProdutos.Cells[0,3] := 'Refrigerante';
  GrdProdutos.Cells[1,3] := '105';
  GrdProdutos.Cells[2,3] := '5,00';
end;

function TFrmPrincipal.ResultadoPedido(Quantidade: Integer; Valor: Currency)
  : Currency;
begin
  Result := Quantidade * Valor;
end;

end.
