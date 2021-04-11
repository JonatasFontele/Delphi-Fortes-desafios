unit uFormPrincipal;

{
  Criar uma aplicação que receba o código do aluno, 3 notas e a média dos exercícios (ME).
  Calcular a média de aproveitamento (MA) usando a fórmula: MA = (N1 + N2 x 2 + N3 x 3 + ME) / 7
  Listar os alunos imprimindo código e conceito de acordo com a tabela:
  Média de Aproveitamento | Conceito
  9,0                 A
  7,5 e < 9,0         B
  6,0 e < 7,5         C
  4,0 e < 6,0         D
  < 4,0               E
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, StrUtils, Contnrs, Generics.Defaults, Generics.Collections, uAluno;

type
  TFrmPrincipal = class(TForm)
    PHeader: TPanel;
    BtnCadastrarAluno: TBitBtn;
    Btn: TBitBtn;
    PBody: TPanel;
    StringGridAlunos: TStringGrid;
    LblMatricula: TLabel;
    LblNota1: TLabel;
    LblNota2: TLabel;
    LblNota3: TLabel;
    LblME: TLabel;
    EdtMatricula: TEdit;
    EdtNota1: TEdit;
    EdtNota2: TEdit;
    EdtNota3: TEdit;
    EdtME: TEdit;
    BtnCalcular: TButton;
    procedure BtnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnCalcularClick(Sender: TObject);
var
  Aluno: TAluno;
  vDict: TDictionary<Integer,TAluno>;
  vKey: Integer;
  I: Integer;
begin
  try
    vDict.Add(1, Aluno := TAluno.Create);
    vDict.AddOrSetValue(2, 'Tadeu');
    vDict.AddOrSetValue(3, 'Chico');

    //Prepara cabeçalho
    StringGridAlunos.ColCount := 3;
    StringGridAlunos.RowCount := 3;
    StringGridAlunos.ColWidths[0] := 60;
    StringGridAlunos.Cells[0,0] := 'Nome';
    StringGridAlunos.ColWidths[1] := 100;
    StringGridAlunos.Cells[1,0] := 'Média de Aproveitamento';
    StringGridAlunos.ColWidths[2] := 100;
    StringGridAlunos.Cells[2,0] := 'Conceito';
    //Atribui informações

    for vKey in vDict.Keys do
      StringGridAlunos.Cells[0,vKey] := vDict.Items[vKey];
      //StringGridAlunos.Cells[1,vKey] := CurrToStrF(ParcelaComposta, ffCurrency, 2);
      //StringGridAlunos.Cells[2,vKey] := CurrToStrF(ParcelaSimples, ffCurrency, 2);



    //ContainsValue(Value);
    //TryGetValue(Key, out Value): Boolean;
    //Remove(Key);
  finally
    vDict.Free;
  end;

end;

end.
