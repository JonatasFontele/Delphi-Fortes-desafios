unit uFormPrincipal;

{
  Dado um array de record contendo os itens de uma venda: produto,
  quantidade e preço unitário.
  Calcular o valor de cada item (quantidade * preço unitário - desconto)
  de acordo com as regras:
  - Se quantidade <= 3 o desconto será de 0%
  - Se quantidade > 3 e quantidade <= 10 o desconto será de 5%
  - Se quantidade > 10 o desconto será de 10%
  Exibir cada item com desconto e ao final o valor total da venda.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, RichEdit, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uVenda, Vcl.ComCtrls,
  Vcl.Menus, uLogica;

type
  TFrmPrincipal = class(TForm)
    LblProduto: TLabel;
    LblQuantidade: TLabel;
    LblPreco: TLabel;
    EdtProduto: TEdit;
    EdtQuantidade: TEdit;
    EdtPreco: TEdit;
    BtnAdicionarProduto: TButton;
    MemoDisplay: TMemo;
    BtnNovaOperacao: TButton;
    MMAdmin: TMainMenu;
    BtnAdmin: TMenuItem;
    BtnEditarVenda: TMenuItem;
    procedure BtnAdicionarProdutoClick(Sender: TObject);
    procedure BtnNovaOperacaoClick(Sender: TObject);
    procedure BtnEditarVendaClick(Sender: TObject);

    procedure EdtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure Verificacao;
    procedure MostrarInfo(const Msg: string);
    procedure ApagaCampos;
    function GetTamanhoLista: Integer;
    function GetProduto(I: Integer): string;
    function GetQuantidade(I: Integer): Integer;
    function GetPreco(I: Integer): Currency;
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    //procedure Mensagem;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  uFormAutorizacao, Math;

var
  LItensVenda: array of RItensVenda; // Array de Record
  n: Integer = 0; // Tamanho do vetor
  Item: RItensVenda; // Record

  { TODO 1 : Fazer alinhamento monetário a direita ou inserir tabela }
procedure TFrmPrincipal.BtnAdicionarProdutoClick(Sender: TObject);
var
  I: Integer;
  ValorTotalProduto, ValorComDesconto, ValorTotalVenda: Currency;
begin
  try
    if ((Trim(EdtProduto.Text) = '')
      and (EdtQuantidade.Text <> '') and (EdtPreco.Text <> ''))  then
      raise EConvertError.Create('Informe o produto');
    Item.Produto := AnsiUpperCase(Trim(EdtProduto.Text));
    Item.Quantidade :=  ABS(StrToInt(EdtQuantidade.Text)) ;
    Item.Preco := ifThen(StrToCurr(EdtPreco.Text) = 0, 0, ABS(StrToCurr(EdtPreco.Text)));
    MemoDisplay.Clear;
    // Redimensiona o vetor "LItensVenda" aumentando uma posição
    n := n + 1;
    // Para adicionar um novo item de venda no final do conjunto
    SetLength(LItensVenda, n);
    LItensVenda[n - 1] := Item;

    ValorTotalVenda := 0;
    MemoDisplay.Lines.Add('COD   DESC    QTD   VL.UNIT.                                 VALOR TOTAL');
        MemoDisplay.Lines.Add('----------------------------------------------------'
          + '------------------------------');
    for I := 0 to n - 1 do
    begin
      Item := LItensVenda[I]; // Recebe os valores do Record na posição I do array
      ValorTotalProduto := CalculaValor(Item.Quantidade, Item.Preco);
      // Quantidade * Preco
      ValorComDesconto := AplicaDesconto(Item.Quantidade, ValorTotalProduto);

      MemoDisplay.Lines.Add(FormatFloat('#000', I + 1) + '	 ' + Item.Produto +
        '	 De:' + CurrToStrF(ValorTotalProduto, ffCurrency, 2) + ' Por:' +
        CurrToStrF(ValorComDesconto, ffCurrency, 2));

      MemoDisplay.Lines.Add('	 Economia:' + CalculaEconomia(ValorTotalProduto,
        ValorComDesconto));


      MemoDisplay.Lines.Add('	 ' + FormatFloat('#0000', Item.Quantidade) +
        ' UN X ' + CurrToStrF(Item.Preco, ffCurrency, 2) + '	 	 	 ' +
        CurrToStrF(ValorTotalProduto, ffCurrency, 2));

      MemoDisplay.Lines.Add('	 desconto sobre item' + '	 	 ' + '-' +
        CurrToStrF((ValorTotalProduto - ValorComDesconto), ffCurrency, 2));

      MemoDisplay.Lines.Add('');
      ValorTotalVenda := ValorTotalVenda + ValorComDesconto;
    end;
    MemoDisplay.Lines.Add('Valor total: ' + CurrToStrF(ValorTotalVenda,
      ffCurrency, 2));
    if (EdtProduto.Text <> '') and (EdtQuantidade.Text <> '') and (EdtPreco.Text <> '') then
    begin
      ApagaCampos;
      EdtProduto.SetFocus;
    end;
  except
    on E: EConvertError do
      Verificacao;
    on E: EInvalidOp do
      Verificacao;
    on E: Exception do
      MostrarInfo('Um erro não tratado foi gerado.' + #13 + 'Erro: ' + E.Message
        + #13 + 'Classe: ' + E.ClassName + #13 + 'Contacte o suporte.');
  end;
end;

procedure TFrmPrincipal.BtnNovaOperacaoClick(Sender: TObject);
begin
  if MessageDlg('Deseja mesmo realizar nova operação?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    ApagaCampos;
    MemoDisplay.Clear;
    SetLength(LItensVenda, 0);
    n := 0;
    EdtProduto.SetFocus;
  end
end;

procedure TFrmPrincipal.EdtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DOWN then
    perform(wm_nextdlgctl,0,0); // EdtQuantidade.SetFocus;
end;

procedure TFrmPrincipal.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  // Se pressionar a tecla 'Enter' dispara o Adicionar Produto
  if Key = #13 then
  begin
    Key := #0;
    BtnAdicionarProdutoClick(nil)
  end;
end;

procedure TFrmPrincipal.EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DOWN then
    perform(wm_nextdlgctl,0,0) // EdtPreco.SetFocus;
  else if Key = VK_UP then
    perform(wm_nextdlgctl,1,0); // EdtProduto.SetFocus;
end;

procedure TFrmPrincipal.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BtnAdicionarProdutoClick(nil)
  end;
end;

procedure TFrmPrincipal.EdtPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    perform(wm_nextdlgctl,1,0); // EdtQuantidade.SetFocus;
end;

procedure TFrmPrincipal.EdtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BtnAdicionarProdutoClick(nil)
  end;
end;

procedure TFrmPrincipal.BtnEditarVendaClick(Sender: TObject);
var
  I: word; // Auxiliador de loop
begin
  //Fechar todas as janelas filhas que estão abertas
  if MDIChildCount > 0 then
  begin
    for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Close;
  end;
  if FrmAutorizacao = nil then
    FrmAutorizacao := TFrmAutorizacao.Create(Self);
  FrmAutorizacao.Show;
end;

procedure TFrmPrincipal.Verificacao;
var
  ValorInt: Integer;
  ValorCurr: Currency;
begin
  // Verifica se o campo está vazio
  if(Trim(EdtProduto.Text) = '') or ((Trim(EdtProduto.Text) = '')
    and (EdtQuantidade.Text <> '') and (EdtPreco.Text <> ''))  then
  begin
    MostrarInfo('Informe o produto');
    EdtProduto.SetFocus;
    exit
  end;

  if(EdtQuantidade.Text = '') then
  begin
    MostrarInfo('Informe a quantidade');
    EdtQuantidade.SetFocus;
    exit
  end
  else if not TryStrToInt(EdtQuantidade.Text, ValorInt) or (StrToInt(EdtQuantidade.Text) = 0) then
  begin
    MostrarInfo('A quantidade precisa ser um número inteiro');
    EdtQuantidade.SetFocus;
    exit;
  end;

  if(EdtPreco.Text = '') then
  begin
    MostrarInfo('Informe o preço');
    EdtPreco.SetFocus;
    exit
  end
  else if not TryStrToCurr(EdtPreco.Text, ValorCurr) then
  begin
    MostrarInfo('O valor não pode ser convertido');
    EdtPreco.SetFocus;
    exit;
  end;
end;

procedure TFrmPrincipal.MostrarInfo(const Msg: string);
// Exibe uma informação para o usuário
begin
  Application.MessageBox(PWideChar(Msg), PWideChar(Application.Title), MB_ICONINFORMATION + MB_OK);
end;

procedure TFrmPrincipal.ApagaCampos;
begin
  EdtProduto.Clear;
  EdtQuantidade.Clear;
  EdtPreco.Clear;
end;

function TFrmPrincipal.GetTamanhoLista: Integer;
begin
  Result := n;
end;

function TFrmPrincipal.GetProduto(I: Integer): string;
begin
  Item := LItensVenda[I];
  Result := Item.Produto;
end;

function TFrmPrincipal.GetQuantidade(I: Integer): Integer;
begin
  Item := LItensVenda[I];
  Result := Item.Quantidade;
end;

function TFrmPrincipal.GetPreco(I: Integer): Currency;
begin
  Item := LItensVenda[I];
  Result := Item.Preco;
end;

end.
