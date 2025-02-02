unit uFormPrincipal;

{
  Levando em considera��o o card�pio:
  Produto            C�digo     Pre�o
  Cachorro quente    100        9,50
  Bauru simples      101        10,50
  Bauru com ovo      102        12,50
  Hamb�rger          103        9,50
  Cheeseburguer      104        10,50
  Refrigerante       105        5,00


  Desenvolva uma aplica��o que receba o c�digo do produto e a quantidade comprada.
  Ao fechar o caixa o gerente precisa do total vendido por cada produto.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Vcl.FileCtrl, Vcl.Buttons, Vcl.ExtCtrls,
  StrUtils, Contnrs, Generics.Defaults, Generics.Collections, Vcl.Grids;

type
  TFrmPrincipal = class(TForm)
    EdtCodigo: TEdit;
    LblProduto: TLabel;
    LblCodigo: TLabel;
    EdtQuantidade: TEdit;
    LblQuantidade: TLabel;
    BtnFinalizar: TButton;
    MemResultado: TMemo;
    FilterComboBoxProduto: TFilterComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnInserir: TBitBtn;
    BitBtnRemover: TBitBtn;
    GrdProdutos: TStringGrid;
    procedure BtnFinalizarClick(Sender: TObject);
    procedure FilterComboBoxProdutoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FilterComboBoxProdutoEnter(Sender: TObject);
    procedure BitBtnInserirClick(Sender: TObject);
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

Uses
  uProduto;

procedure TFrmPrincipal.BitBtnInserirClick(Sender: TObject);
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
          Resultado := ResultadoPedido(Quantidade, 9.50);
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

procedure TFrmPrincipal.BtnFinalizarClick(Sender: TObject);
var

begin
  //
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  GrdProdutos.ColCount := 3;
  GrdProdutos.RowCount := 4;
  GrdProdutos.Cells[0,0] := 'C�digo';
  GrdProdutos.Cells[1,0] := 'Nome';
  GrdProdutos.Cells[2,0] := 'Pre�o';

  GrdProdutos.Cells[0,1] := '100';
  GrdProdutos.Cells[1,1] := 'Cachorro quente';
  GrdProdutos.Cells[2,1] := '9,50';

  GrdProdutos.Cells[0,2] := '101';
  GrdProdutos.Cells[1,2] := 'Bauru simples';
  GrdProdutos.Cells[2,2] := '10,50';

  GrdProdutos.Cells[0,3] := '102';
  GrdProdutos.Cells[1,3] := 'Bauru com ovo';
  GrdProdutos.Cells[2,3] := '12,50';

  GrdProdutos.Cells[0,3] := '103';
  GrdProdutos.Cells[1,3] := 'Hamb�rger';
  GrdProdutos.Cells[2,3] := '9,50';

  GrdProdutos.Cells[0,3] := '104';
  GrdProdutos.Cells[1,3] := 'Cheeseburguer';
  GrdProdutos.Cells[2,3] := '10,50';

  GrdProdutos.Cells[0,3] := '105';
  GrdProdutos.Cells[1,3] := 'Refrigerante';
  GrdProdutos.Cells[2,3] := '5,00';
end;

function TFrmPrincipal.ResultadoPedido(Quantidade: Integer; Valor: Currency)
  : Currency;
begin
  Result := Quantidade * Valor;
end;

end.
