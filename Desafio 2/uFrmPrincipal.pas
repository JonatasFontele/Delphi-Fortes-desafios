unit uFrmPrincipal;

{
  Dado um array de record contendo os dados: nome, sal�rio, n�mero de filhos.
  Criar uma rotina para calcular e exibir:
  - M�dia do n�mero de filhos
  - Percentual de sal�rios menores que 1000,00
  - M�dia de sal�rio
  - Maior sal�rio
  - Menor sal�rio
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FuncRecord, Vcl.ToolWin,
  Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    LblNome: TLabel;
    LblSal�rio: TLabel;
    LblNumeroFilhos: TLabel;
    EdtNome: TEdit;
    EdtSalario: TEdit;
    EdtNumFilhos: TEdit;
    BtnAdicionar: TButton;
    MemoDisplay: TMemo;
    procedure BtnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  LFuncionarios: array[0..4] of RFuncionario; //Vetor de Records
  MediaFilhos: Integer = 0;
  PercentualSalario: Double;
  MediaSalario: Currency = 0;
  MaiorSalario: Currency;
  MenorSalario: Currency;
  I: Integer = 0;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnAdicionarClick(Sender: TObject);
var
  J: Integer;
begin
  MemoDisplay.Clear;
  LFuncionarios[I].Nome := EdtNome.Text;
  LFuncionarios[I].Salario := StrToFloat(EdtSalario.Text);
  LFuncionarios[I].NumeroFilhos := StrToInt(EdtNumFilhos.Text);

  if I = 0 then
  begin
    MaiorSalario := LFuncionarios[0].Salario;
    MenorSalario := LFuncionarios[0].Salario;
  end;

  I := I + 1;
  //Inc(I);

  //Vou separar em procedimentos depois
  for J := 0 to Length(LFuncionarios) -1 do
  begin
    MediaFilhos := Round((MediaFilhos + LFuncionarios[J].NumeroFilhos)/2);
    MediaSalario := (MediaSalario + LFuncionarios[J].Salario)/2;
    if LFuncionarios[J].Salario > MaiorSalario then
    begin
      MaiorSalario := LFuncionarios[J].Salario;
    end;
    if LFuncionarios[J].Salario < MenorSalario then
    begin
      MenorSalario := LFuncionarios[J].Salario;
    end;
  end;

  MemoDisplay.Lines.Add('M�dia do n�mero de filhos: '+ FloatToStr(MediaFilhos));
  //MemoDisplay.Lines.Add('Percentual de sal�rios menores que 1000,00: '+ FloatToStr(PercentualSalario));
  MemoDisplay.Lines.Add('M�dia de sal�rio: '+ FloatToStr(MediaSalario));
  MemoDisplay.Lines.Add('Maior sal�rio: '+ FloatToStr(MaiorSalario));
  MemoDisplay.Lines.Add('Menor sal�rio: '+ FloatToStr(MenorSalario));
end;

end.
