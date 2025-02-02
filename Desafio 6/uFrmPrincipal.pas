unit uFrmPrincipal;

{
  O propriet�rio da empresa ABC precisa de um programa de computador para calcular
  o novo sal�rio que seus funcion�rios. Sabendo que o aumento de sal�rio para todos
  os funcion�rios ser� de 5%, fa�a um programa que recebe o c�digo do funcion�rio,
  o valor do sal�rio atual, imprima o c�digo e o sal�rio atualizado e ao final
  o valor que o aumento representou na folha de pagamento da empresa.
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
    procedure BtnAddClick(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    vDict: TObjectDictionary<Integer, TFuncionario>;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Funcionario: TFuncionario;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnAddClick(Sender: TObject);
begin
  try
    vDict.Add(StrToInt(EdtCodigo.Text),
      TFuncionario.Create(StrToInt(EdtCodigo.Text),
      StrToCurr(EdtSalario.Text)));
  for Funcionario in vDict.Values do
  begin
    Memo.Lines.Add('C�digo: ' + IntToStr(Funcionario.Codigo) + ', ' +
      'Novo Sal�rio: ' + CurrToStrF(Funcionario.AumentoSalario, ffCurrency, 2));
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
