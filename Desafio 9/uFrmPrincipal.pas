unit uFrmPrincipal;

{
  A empresa Abc precisa de um programa para calcular as horas extras dos seus
  funcion�rios. Desenvolva uma aplica��o que registre o c�digo do funcion�rio,
  o dia/m�s (25/02), se o dia � feriado ou domingo e o total de horas extras no
  dia. Se o dia � feriado ou domingo o valor da hora de trabalho deve ser
  acrescida em 100%, caso contr�rio � acrescido em 50%. A aplica��o deve
  imprimir o c�digo do funcion�rio, o total e o valor das horas extras 50%,
  o total e o valor das horas extras 100% e o valor total a ser pago. O Valor da
  hora de trabalho � de 20.00 para todos os funcion�rios.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  StrUtils, Contnrs, Generics.Defaults, Generics.Collections, uFuncionario,
  Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    Memo: TMemo;
    EdtCodigo: TEdit;
    LblCodigo: TLabel;
    EdtSalario: TEdit;
    LblSalario: TLabel;
    BtnAdd: TButton;
    BtnFinalizar: TButton;
    DateTimePicker: TDateTimePicker;
    LblData: TLabel;
    LblHoraExtra: TLabel;
    EdtHoraExtra: TEdit;
    LblFeriado: TLabel;
    CmbBoxFeriado: TComboBox;

    procedure BtnAddClick(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    vDict: TObjectDictionary<Integer, TFuncionario>;
  public
    { Public declarations }
    const HoraDeTrabalho: Currency = 20.00;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Funcionario: TFuncionario;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnAddClick(Sender: TObject);
var
  vKey, HorasExtra: Integer;
  ValorTotal: Currency;
begin
  try
    vKey := StrToInt(EdtCodigo.Text);
    vDict.Add(vKey, TFuncionario.Create(StrToInt(EdtCodigo.Text),
      StrToCurr(EdtSalario.Text)));
    vDict.Items[vKey].Data := DateTimePicker.DateTime;
    HorasExtra := StrToInt(EdtHoraExtra.Text);
    if ((dayofweek(vDict.Items[vKey].Data)) = 1) or (CmbBoxFeriado.Text = 'Sim') then
      ValorTotal := (HoraDeTrabalho * 2) * HorasExtra
    else
      ValorTotal := (HoraDeTrabalho + (HoraDeTrabalho * 0.5)) * HorasExtra;

  for Funcionario in vDict.Values do
  begin
    Memo.Clear;
    Memo.Lines.Add('C�digo: ' + IntToStr(Funcionario.Codigo) + ', ' +
      'novo sal�rio: ' + CurrToStrF(Funcionario.AumentoSalario, ffCurrency, 2));
    Memo.Lines.Add('Total de horas extras: ' + EdtHoraExtra.Text);
    Memo.Lines.Add('Total a ser pago: ' + CurrToStrF(ValorTotal, ffCurrency, 2));

  end;
  finally
    //vDict.Free;
  end;

end;

procedure TFrmPrincipal.BtnFinalizarClick(Sender: TObject);
var
  AumentoTotal, SalarioTotal: Currency;
begin
  SalarioTotal := 0;
  AumentoTotal := 0;
  for Funcionario in vDict.Values do
  begin
    Memo.Lines.Add('C�digo: ' + IntToStr(Funcionario.Codigo) + ', ' +
      'Novo Sal�rio: ' + CurrToStrF(Funcionario.AumentoSalario, ffCurrency, 2));
    SalarioTotal := SalarioTotal + Funcionario.Salario;
    AumentoTotal := AumentoTotal + Funcionario.AumentoSalario;
  end;

   Memo.Lines.Add('Aumento na folha de pagamento: ' +
      CurrToStrF((AumentoTotal - SalarioTotal), ffCurrency, 2));
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  vDict := TObjectDictionary<Integer, TFuncionario>.Create([doOwnsValues]);
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  vDict.Free;
end;

end.
