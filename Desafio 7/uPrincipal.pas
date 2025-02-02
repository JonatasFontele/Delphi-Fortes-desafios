unit uPrincipal;

{
  A padaria XYZ vende uma certa quantidade de p�es franceses e uma quantidade de
  broas a cada dia.
  Cada p�ozinho custa R$ 0,75 e a broa custa R$ 4,50.
  Ao final do dia, o dono quer saber quanto arrecadou com a venda dos p�es e broas
  (juntos), e quanto deve guardar numa conta de poupan�a (10% do total arrecadado).
  Voc� foi contratado a desenvolver uma aplica��o que acumule as vendas do dia e ao
  fechar o caixa calcule as quantidades de p�es e de broas e os dados solicitados.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus,
  StrUtils, Contnrs, Generics.Defaults, Generics.Collections, uProduto;

type
  TFrmPrincipal = class(TForm)
    LblProduto: TLabel;
    LblPreco: TLabel;
    BtnAdicionar: TButton;
    RichEdt: TRichEdit;
    EdtProduto: TEdit;
    EdtPreco: TEdit;
    MainMenu1: TMainMenu;
    Abrirtxt1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Editar1: TMenuItem;
    Deletar1: TMenuItem;
    Fechar1: TMenuItem;
    procedure BtnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
  private
    { Private declarations }
    vDict: TObjectDictionary<Integer, TProduto>;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Produto: TProduto;
  I: Integer = 1;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnAdicionarClick(Sender: TObject);
begin
  try
    vDict.Add(I, TProduto.Create(EdtProduto.Text, StrToCurr(EdtPreco.Text)));
    if (vDict.Count > 0) and vDict.ContainsKey(I) then
    begin
      RichEdt.Lines.Add('Venda ' + IntToStr(I) + ' -- ' + DateTimeToStr(Now));
      RichEdt.Lines.Add('Nome: ' + vDict.Items[I].Nome);
      RichEdt.Lines.Add('Pre�o: ' + CurrToStrF(vDict.Items[I].Preco, ffCurrency, 2));
      RichEdt.Lines.Add('');
    end;
    I := I + 1;
  finally
    //vDict.Free;
  end;
end;

procedure TFrmPrincipal.Fechar1Click(Sender: TObject);
var
  Paezinhos, Broas: Integer;
  ValorTotal: Currency;
begin
  Paezinhos := 0;
  Broas := 0;
  ValorTotal := 0;
  for Produto in vDict.Values do
  begin
    ValorTotal := ValorTotal + Produto.Preco;
    if Produto.Nome = 'P�ozinho' then
      Inc(Paezinhos)
    else if Produto.Nome = 'Broa' then
      Inc(Broas);
  end;
  ShowMessage('P�ezinhos: ' + IntToStr(Paezinhos) + #13 +
              'Broas: ' + IntToStr(Broas) + #13 +
              'Total arrecadado: ' + CurrToStrF(ValorTotal, ffCurrency, 2) + #13 +
              'Guardar na poupan�a: ' + CurrToStrF(ValorTotal * 0.1, ffCurrency, 2));
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  vDict := TObjectDictionary<Integer, TProduto>.Create([doOwnsValues]);
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  vDict.Free;
end;

end.
