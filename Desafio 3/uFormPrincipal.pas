unit uFormPrincipal;

{
  Desenvolver uma aplica��o para calcular juros compostos.
  Exemplo:
  Um capital de R$1400 foi aplicado a juros compostos em um fundo de investimento
  que rende 7% a.a. Qual ser� o juros acumulado ap�s 24 meses?
  Note que o tempo e a taxa est�o em unidades diferentes, mas sabemos que 24 meses
  � igual a 2 anos, logo, t = 2 anos, e que a taxa precisa ser escrita na forma
  decimal, i = 0,07.

  M = C (1 + i)^t
  M = 1400 (1 + 0,07)�
  M = 1400 (1,07)�
  M = 1400 * 1,1449
  M = 1602,86

  #Adicionei um comparador.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls, Vcl.Grids, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components, uCalculadora;

type
  TFrmPrincipal = class(TForm)
    LblValorCapital: TLabel;
    LblTempo: TLabel;
    LblTaxaJuros: TLabel;

    EdtValorCapital: TEdit;
    SpnEdtTempo: TSpinEdit;
    EdtTaxaJuros: TEdit;
    CmbBoxJuros: TComboBox;

    ChckBoxComparar: TCheckBox;
    BndngList: TBindingsList;
    LinkControlToPropertyEnabled: TLinkControlToProperty;
    LinkControlToPropertyEnabled2: TLinkControlToProperty;
    EdtTaxaJuros2: TEdit;
    CmbBoxJuros2: TComboBox;

    BtnCalcular: TButton;

    PgCntrlMemo: TPageControl;
    TabSheetMontante: TTabSheet;
    MemResultado: TMemo;
    TabSheetParcelas: TTabSheet;
    StrGridParcelas: TStringGrid;

    procedure BtnCalcularClick(Sender: TObject);
    procedure Mensagem(Montante: Currency);
    // procedure ComparaSegundoValor;

  private
    { Private declarations }
  public
    { Public declarations }
    procedure TabSheetParcelasEnter(Sender: TObject; ValorCapital: Currency;
      TaxaJuros: Double; Tempo: Integer); overload;
    procedure TabSheetParcelasEnter(Sender: TObject; ValorCapital: Currency;
      TaxaJuros, TaxaJuros2: Double; Tempo: Integer); overload;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnCalcularClick(Sender: TObject);
var
  Calculadora: TCalculadora;
  JurosSimples, MontanteSimples, MontanteComposto: Currency;
begin
  try
    MemResultado.Clear;
    // Cria objeto para usar as fun��es
    Calculadora := TCalculadora.Create;
    Calculadora.ValorCapital := StrToCurr(EdtValorCapital.Text);
    Calculadora.TaxaJuros := (StrToFloat(EdtTaxaJuros.Text)) / 100;
    Calculadora.Tempo := StrToInt(SpnEdtTempo.Text);

    MontanteSimples := Calculadora.CalculaMontanteSimples;
    MontanteComposto := Calculadora.CalculaMontanteComposto;

    if CmbBoxJuros.Text = 'composto' then
      Mensagem(MontanteComposto)
    else
      Mensagem(MontanteSimples);

    if ChckBoxComparar.Checked then
    begin
      { Calculadora := TCalculadora.Create; para implementar com valor e tempo diferentes }
      Calculadora.TaxaJuros := (StrToFloat(EdtTaxaJuros2.Text)) / 100;

      MontanteSimples := Calculadora.CalculaMontanteSimples;
      MontanteComposto := Calculadora.CalculaMontanteComposto;

      if CmbBoxJuros2.Text = 'simples' then
        Mensagem(MontanteSimples)
      else
        Mensagem(MontanteComposto);
      TabSheetParcelasEnter(Sender, Calculadora.ValorCapital,
        Calculadora.TaxaJuros, Calculadora.TaxaJuros, Calculadora.Tempo);
    end
    else
    begin
      TabSheetParcelasEnter(Sender, Calculadora.ValorCapital,
        Calculadora.TaxaJuros, Calculadora.Tempo);
    end;
  except
    on E: EConvertError do
      Messagedlg('Entrada incorreta.', mtError, [mbOK], 0);
    on E: EInvalidOp do
      Messagedlg('Entrada incorreta.', mtError, [mbOK], 0);
    on E: Exception do
      ShowMessage('Um erro n�o tratado foi gerado.' + #13 + 'Erro: ' + E.Message
        + #13 + 'Classe: ' + E.ClassName + #13 + 'Contacte o suporte.');
  end;
end;

procedure TFrmPrincipal.Mensagem(Montante: Currency);
begin
  MemResultado.Lines.Add('Montante: ' + CurrToStrF(Montante, ffCurrency, 2));
end;

procedure TFrmPrincipal.TabSheetParcelasEnter(Sender: TObject;
  ValorCapital: Currency; TaxaJuros: Double; Tempo: Integer);
var
  ParcelaSimples, ParcelaComposta, CapitalInicial: Currency;
  I: Integer;
begin
  ParcelaSimples := ValorCapital;
  ParcelaComposta := ValorCapital;
  CapitalInicial := ValorCapital;

  // Prepara cabe�alho
  StrGridParcelas.ColCount := 3;
  StrGridParcelas.RowCount := Tempo + 1;
  StrGridParcelas.ColWidths[0] := 60;
  StrGridParcelas.Cells[0, 0] := 'Parcela';
  StrGridParcelas.ColWidths[1] := 100;
  StrGridParcelas.Cells[1, 0] := 'Juros Composto';
  StrGridParcelas.ColWidths[2] := 100;
  StrGridParcelas.Cells[2, 0] := 'Juros Simples';
  // Atribui informa��es
  for I := 1 to Tempo do
  begin
    // Incrementa parcela de juros composto para tabela
    ParcelaComposta := ParcelaComposta + (ParcelaComposta * TaxaJuros);
    // Incrementa parcela de juros simples para tabela
    ParcelaSimples := ParcelaSimples + (CapitalInicial * TaxaJuros);

    StrGridParcelas.Cells[0, I] := IntToStr(I);
    StrGridParcelas.Cells[1, I] := CurrToStrF(ParcelaComposta, ffCurrency, 2);
    StrGridParcelas.Cells[2, I] := CurrToStrF(ParcelaSimples, ffCurrency, 2);
    // .Position := ProgressBar1.Position +1;
    Application.ProcessMessages;
    // Sleep(100);
  end;
end;

procedure TFrmPrincipal.TabSheetParcelasEnter(Sender: TObject;
  ValorCapital: Currency; TaxaJuros, TaxaJuros2: Double; Tempo: Integer);
var
  ParcelaSimples, ParcelaComposta, CapitalInicial: Currency;
  I: Integer;
begin
  ParcelaSimples := ValorCapital;
  ParcelaComposta := ValorCapital;
  CapitalInicial := ValorCapital;

  // Prepara cabe�alho
  StrGridParcelas.ColCount := 3;
  StrGridParcelas.RowCount := Tempo + 1;
  StrGridParcelas.ColWidths[0] := 60;
  StrGridParcelas.Cells[0, 0] := 'Parcela';
  StrGridParcelas.ColWidths[1] := 100;
  StrGridParcelas.ColWidths[2] := 100;
  if CmbBoxJuros.Text = 'composto' then
    StrGridParcelas.Cells[1, 0] := 'Juros Composto'
  else
    StrGridParcelas.Cells[1, 0] := 'Juros Simples';
  if CmbBoxJuros2.Text = 'simples' then
    StrGridParcelas.Cells[2, 0] := 'Juros Simples'
  else
    StrGridParcelas.Cells[2, 0] := 'Juros Composto';

  // Atribui informa��es
  for I := 1 to Tempo do
  begin
    // Incrementa parcela de juros composto para tabela
    ParcelaComposta := ParcelaComposta + (ParcelaComposta * TaxaJuros);
    // Incrementa parcela de juros simples para tabela
    ParcelaSimples := ParcelaSimples + (CapitalInicial * TaxaJuros);

    StrGridParcelas.Cells[0, I] := IntToStr(I);
    StrGridParcelas.Cells[1, I] := CurrToStrF(ParcelaComposta, ffCurrency, 2);
    StrGridParcelas.Cells[2, I] := CurrToStrF(ParcelaSimples, ffCurrency, 2);
    // .Position := ProgressBar1.Position +1;
    Application.ProcessMessages;
    // Sleep(100);
  end;
end;

end.
