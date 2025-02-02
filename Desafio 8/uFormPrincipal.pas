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
  System.Classes, Vcl.Graphics, System.UITypes, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components, Vcl.FileCtrl,
  Vcl.Buttons, Vcl.ExtCtrls, StrUtils, Contnrs, Generics.Defaults,
  Generics.Collections, Vcl.Grids, Vcl.Menus, Vcl.Samples.Spin,
  Vcl.Imaging.pngimage, uProduto, uFormEditCardapio;

type
  TFrmPrincipal = class(TForm)
    LblProduto: TLabel;
    LblCodigo: TLabel;
    LblQuantidade: TLabel;
    EdtCodigo: TEdit;
    EdtProduto: TEdit;
    SpnEdtQuantidade: TSpinEdit;
    BitBtnInserir: TBitBtn;
    BitBtnRemover: TBitBtn;
    BtnFinalizar: TButton;
    MemResultado: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GrdProdutos: TStringGrid;
    ImgClick: TImage;
    BtnEditarCardapio: TButton;
    MainMenu1: TMainMenu;
    FecharCaixa: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure BitBtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FecharCaixaClick(Sender: TObject);
    procedure GrdProdutosClick(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure ApagaCampos;
    procedure EdtCodigoChange(Sender: TObject);
    procedure BitBtnRemoverClick(Sender: TObject);
    procedure BtnEditarCardapioClick(Sender: TObject);

    procedure GetvDict;
  private
    { Private declarations }
    vDict: TObjectDictionary<Integer, TProduto>; // Dicion�rio do card�pio
    LItensVenda: array of TProduto; // Vetor de produtos de uma venda
    Item: TProduto; // Objeto

  public
    { Public declarations }
    ValorTotalDia: Currency;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  n: Integer = 0; // Tamanho do vetor
  Finalizado: Boolean = False; // Se verdadeiro, pode fechar caixa

implementation

{$R *.dfm}

procedure TFrmPrincipal.BitBtnInserirClick(Sender: TObject);
var
  vKey: Integer;
begin
  try
    vKey := StrToInt(EdtCodigo.Text);
    // Se houver o c�digo no card�pio
    if vDict.ContainsKey(vKey) then
    begin
      Finalizado := False;
      // Cria um objeto com par�metros c�digo e nome
      Item := TProduto.Create(ABS(StrToInt(EdtCodigo.Text)),
        Trim(EdtProduto.Text));
      Item.Quantidade := ABS(StrToInt(SpnEdtQuantidade.Text));
      Item.Preco := vDict.Items[vKey].Preco;
      // vDict.AddOrSetValue(vKey, Item);

      // Redimensiona o vetor "LItensVenda" aumentando uma posi��o
      n := n + 1;
      // Para adicionar um novo item de venda no final do conjunto
      SetLength(LItensVenda, n);
      LItensVenda[n - 1] := Item;

      if n > 1 then
      begin
        MemResultado.Lines.Add(FormatFloat('#000', n) + ' ' +
          IntToStr(Item.Codigo) + ' ' + Item.Nome + ' ' +
          IntToStr(Item.Quantidade) + ' UN X ' + CurrToStrF(Item.Preco,
          ffCurrency, 2) + ' ' + CurrToStrF(Item.CalculaValorTotalItem,
          ffCurrency, 2));
      end
      else
      begin
        MemResultado.Clear;
        MemResultado.Lines.Add
          ('#   COD   DESC    QTD   VL.UNIT.                        VALOR TOTAL');
        MemResultado.Lines.Add
          ('----------------------------------------------------' +
          '-----------------------');
        MemResultado.Lines.Add(FormatFloat('#000', n) + ' ' +
          IntToStr(Item.Codigo) + ' ' + Item.Nome + ' ' +
          IntToStr(Item.Quantidade) + ' UN X ' + CurrToStrF(Item.Preco,
          ffCurrency, 2) + ' ' + CurrToStrF(Item.CalculaValorTotalItem,
          ffCurrency, 2));
      end;
    end
    else
    begin
      Messagedlg('C�digo n�o encontrado no card�pio.', mtWarning, [mbOK], 0);
      EdtCodigo.SetFocus;
    end;
  except
    on E: Exception do
      Messagedlg('Entrada incorreta.', mtError, [mbOK], 0);
  end;
end;

procedure TFrmPrincipal.BitBtnRemoverClick(Sender: TObject);
var
  I: Integer;
  Deletar: Boolean;
begin
  Deletar := False;
  try
    if Length(LItensVenda) > 0 then
    begin
      for I := Low(LItensVenda) to High(LItensVenda) do
      begin
        if LItensVenda[I].Codigo = StrToInt(EdtCodigo.Text) then
          Deletar := True;
        if (Deletar) and (I < (n - 1)) then
          // Copia o �ltimo elemento sobre o elemento "exclu�do"
          LItensVenda[I] := LItensVenda[I + 1];
      end;
      if Deletar then
      begin
        // Corta o �ltimo elemento
        SetLength(LItensVenda, Length(LItensVenda) - 1);
        n := n - 1; // Diminui o vetor para o bot�o Inserir
        MemResultado.Clear;
        MemResultado.Lines.Add
          ('#   COD   DESC    QTD   VL.UNIT.                        VALOR TOTAL');
        MemResultado.Lines.Add
          ('----------------------------------------------------' +
          '-----------------------');
        MemResultado.Lines.Add('Produto deletado');
        for I := 0 to Length(LItensVenda) - 1 do
        begin
          Item := LItensVenda[I]; // Recebe os valores do Array na posi��o I
          MemResultado.Lines.Add(FormatFloat('#000', I) + ' ' +
            IntToStr(Item.Codigo) + ' ' + Item.Nome + ' ' +
            IntToStr(Item.Quantidade) + ' UN X ' + CurrToStrF(Item.Preco,
            ffCurrency, 2) + ' ' + CurrToStrF(Item.CalculaValorTotalItem,
            ffCurrency, 2));
        end;
        ApagaCampos;
      end
      else
        Messagedlg('C�digo n�o encontrado no pedido.', mtWarning, [mbOK], 0);
    end
    else
    begin
      Messagedlg('N�o foi poss�vel deletar o produto.', mtError, [mbOK], 0);
      EdtCodigo.SetFocus;
    end;
  except
    Messagedlg('Entrada incorreta.', mtError, [mbOK], 0);
  end;
end;

procedure TFrmPrincipal.BtnFinalizarClick(Sender: TObject);
var
  I: Integer;
  ValorTotalVenda: Currency;
begin
  if Length(LItensVenda) > 0 then
  begin
    Finalizado := True;
    ValorTotalVenda := 0;
    for I := Low(LItensVenda) to High(LItensVenda) do
    begin
      Item := LItensVenda[I];
      // Recebe os valores do objeto na posi��o I do array
      if vDict.ContainsKey(Item.Codigo) then
        vDict.Items[Item.Codigo].ValorFinal := Item.CalculaValorTotalItem;
      ValorTotalVenda := ValorTotalVenda + Item.CalculaValorTotalItem;
    end;
    MemResultado.Lines.Add
      ('----------------------------------------------------' +
      '-----------------------');
    MemResultado.Lines.Add('Total: ' + CurrToStrF(ValorTotalVenda,
      ffCurrency, 2));
    ApagaCampos;
    SetLength(LItensVenda, 0);
    n := 0;
  end
  else
  begin
    Messagedlg('Nenhum produto foi registrado.', mtWarning, [mbOK], 0);
    EdtCodigo.SetFocus;
  end;
end;

procedure TFrmPrincipal.FecharCaixaClick(Sender: TObject);
var
  vKey: Integer;
  S: string;
begin
  if Finalizado then
  begin
    S := '';
    for vKey in vDict.Keys do
    begin
      if vDict.Items[vKey].ValorFinal <> 0 then
        S := S + vDict.Items[vKey].Nome + ': ' +
          CurrToStrF(vDict.Items[vKey].ValorFinal, ffCurrency, 2) + #13;
    end;
    ShowMessage(S);
    ApagaCampos;
  end
  else
  begin
    Messagedlg('Nenhuma venda foi finalizada.', mtWarning, [mbOK], 0);
    EdtCodigo.SetFocus;
  end;
end;

procedure TFrmPrincipal.EdtCodigoChange(Sender: TObject);
var
  vKey: Integer;
begin
  try
    vKey := StrToInt(EdtCodigo.Text);
    // Preenche o nome do produto na tela
    if vDict.ContainsKey(vKey) then
      EdtProduto.Text := vDict.Items[vKey].Nome
    else
      EdtProduto.Text := '';
  except
    on E: Exception do
  end;
end;

procedure TFrmPrincipal.ApagaCampos;
begin
  EdtCodigo.Clear;
  EdtProduto.Clear;
  SpnEdtQuantidade.Value := 1;
  EdtCodigo.SetFocus;
end;

procedure TFrmPrincipal.BtnEditarCardapioClick(Sender: TObject);
begin
  FrmEditCardapio := nil;
  try
    FrmEditCardapio := TFrmEditCardapio.Create(Self);
    FrmEditCardapio.ShowModal;

    { if FrmEditCardapio.EdtCodigo.Text <> '' then
      Cadastrar(FrmEditCardapio.EdtCodigo.Text, FrmEditCardapio.EdtNome.Text,
      FrmEditCardapio.EdtPreco.Text); }
  finally
    FrmEditCardapio.Free;
  end;
  { TODO : Editor do dicion�rio }
  { Remove the "Iasi" key from dictionary. }
  // Dictionary.Remove('Iasi');

  { Make sure the dictionary's capacity is set to the number of entries. }
  // Dictionary.TrimExcess;
end;

procedure TFrmPrincipal.GetvDict;
begin
  //
end;

procedure TFrmPrincipal.GrdProdutosClick(Sender: TObject);
// Seleciona uma linha da tabela para copiar automaticamente para os campos edit
begin
  GrdProdutos.Selection := TGridRect(Rect(0, GrdProdutos.Row, 2,
    GrdProdutos.Row));
  EdtCodigo.Text := GrdProdutos.Cells[0, GrdProdutos.Row];
  EdtProduto.Text := GrdProdutos.Cells[1, GrdProdutos.Row];
  // Para form de edi��o
  FrmEditCardapio.EdtCodigoEdit.Text := GrdProdutos.Cells[0, GrdProdutos.Row];
  FrmEditCardapio.EdtNomeEdit.Text := GrdProdutos.Cells[1, GrdProdutos.Row];
  FrmEditCardapio.EdtPrecoEdit.Text := GrdProdutos.Cells[2, GrdProdutos.Row];
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  vKey: Integer;
begin
  vDict := TObjectDictionary<Integer, TProduto>.Create([doOwnsValues]);
  try
    // Adiciona os pares c�digo e objeto(nome e pre�o) ao dicion�rio(card�pio)
    vDict.Add(100, TProduto.Create('Cachorro quente', 9.50));
    vDict.AddOrSetValue(101, TProduto.Create('Bauru simples', 10.50));
    vDict.AddOrSetValue(102, TProduto.Create('Bauru com ovo', 12.50));
    vDict.AddOrSetValue(103, TProduto.Create('Hamb�rguer', 9.50));
    vDict.AddOrSetValue(104, TProduto.Create('Cheeseburguer', 10.50));
    vDict.AddOrSetValue(105, TProduto.Create('Refrigerante', 5.00));
    // Prepara cabe�alho
    GrdProdutos.ColWidths[0] := 42;
    GrdProdutos.ColWidths[1] := 163;
    GrdProdutos.ColWidths[2] := 102;
    GrdProdutos.ColCount := 3;
    GrdProdutos.RowCount := vDict.Count + 1; // N�mero de pares no dicion�rio
    GrdProdutos.Cells[0, 0] := 'C�digo';
    GrdProdutos.Cells[1, 0] := 'Produto';
    GrdProdutos.Cells[2, 0] := 'Pre�o';
    // Atribui informa��es
    for vKey in vDict.Keys do
    begin
      GrdProdutos.Cells[0, vKey - 99] := IntToStr(vKey);
      GrdProdutos.Cells[1, vKey - 99] := vDict.Items[vKey].Nome;
      GrdProdutos.Cells[2, vKey - 99] := CurrToStrF(vDict.Items[vKey].Preco,
        ffCurrency, 2);
    end;
  except
    on Exception do
      Messagedlg
        ('N�o foi poss�vel adicionar entrada. Duplicatas n�o s�o aceitas.',
        mtError, [mbOK], 0);
  end;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vDict.Free;
end;

end.
