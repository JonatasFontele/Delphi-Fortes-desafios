unit uFormPrincipal;

{
  Desenvolver uma aplica��o para disponibilizar as modalidades de empr�stimo
  as quais o cliente tem acesso de acordo com algumas vari�veis.
  Modalidades ativas no banco:
  1 - Empr�stimo pessoal - Taxa de juros: 4%
  2 - Empr�stimo com garantia - Taxa de juros: 3%
  3 - Consignado - Taxa de juros: 2%

  Regra                      Emp. pessoal     Emp. c/ Garantia       Consignado
  Sal�rio <= 3000                Sim              Sim***                 N�o
  Sal�rio > 3000 e <= 5000       Sim              Sim**                  N�o
  Sal�rio => 5000                Sim              Sim*                   Sim

  *** Clientes com menos de 30 anos que residem no CE
  ** Clientes que residem no CE
  * Clientes com menos de 30 anos

  Exemplo de entrada:
  Nome: Maria
  Idade: 29
  Estado: CE
  Salario: 3000

  Exemplo de sa�da:
  Modalidade (s): 1,2
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Grids;

type
  TFrmPrincipal = class(TForm)
    GrdClientes: TStringGrid;
    BtnCadastrar: TButton;
    BtnRemover: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
  private
    { Private declarations }
    procedure Cadastrar(const Nome, Estado: string; const Idade: Integer;
  const Salario: Currency);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uCliente;

{$R *.dfm}

procedure TFrmPrincipal.BtnCadastrarClick(Sender: TObject);
begin
  FrmCliente := nil;
  try
    FrmCliente := TFrmCliente.Create(Self);
    FrmCliente.ShowModal;
    if FrmCliente.EdtNome.Text <> '' then
      Cadastrar(FrmCliente.EdtNome.Text, FrmCliente.CmbBoxEstados.Text,
      StrToInt(FrmCliente.SpnEdtIdade.Text), StrToCurr(FrmCliente.EdtSalario.Text));
  finally
    FrmCliente.Free;
  end;
end;

procedure TFrmPrincipal.Cadastrar(const Nome, Estado: string; const Idade: Integer;
  const Salario: Currency);
var
  Modalidade: string;
  NovaLinha: Integer;
begin
  NovaLinha := GrdClientes.RowCount +1;
  GrdClientes.RowCount := NovaLinha;
  GrdClientes.Cells[0,NovaLinha -1] := Nome;
  GrdClientes.Cells[1,NovaLinha -1] := IntToStr(Idade);
  GrdClientes.Cells[2,NovaLinha -1] := Estado;
  GrdClientes.Cells[3,NovaLinha -1] := CurrToStrF(Salario, ffCurrency, 2);
  if (Salario <= 3000) and (Idade < 30) and (Estado = 'CE') then
    Modalidade := '1, 2'
  else if (Salario > 3000) and (Salario <= 5000) and (Estado = 'CE') then
    Modalidade := '1, 2'
  else if (Salario >= 5000) and (Idade < 30) then
    Modalidade := '1, 2, 3'
  else
    Modalidade := 'Nenhuma';
  GrdClientes.Cells[4,NovaLinha -1] := Modalidade;
end;

procedure TFrmPrincipal.BtnRemoverClick(Sender: TObject);
var
  I, Linha: Integer;
begin
  if GrdClientes.Row > 0 then
  begin
     Linha := GrdClientes.Row;
     for I := Linha to GrdClientes.RowCount -1 do
     begin
       GrdClientes.Cells[0,I] := GrdClientes.Cells[0,I+1];
       GrdClientes.Cells[1,I] := GrdClientes.Cells[1,I+1];
       GrdClientes.Cells[2,I] := GrdClientes.Cells[2,I+1];
       GrdClientes.Cells[2,I] := GrdClientes.Cells[3,I+1];
       GrdClientes.Cells[2,I] := GrdClientes.Cells[4,I+1];
     end;
     GrdClientes.RowCount := GrdClientes.RowCount -1;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  GrdClientes.ColCount := 5;
  GrdClientes.RowCount := 1;
  GrdClientes.Cells[0,0] := 'Nome';
  GrdClientes.Cells[1,0] := 'Idade';
  GrdClientes.Cells[2,0] := 'Estado';
  GrdClientes.Cells[3,0] := 'Sal�rio';
  GrdClientes.Cells[4,0] := 'Modalidade';
end;

end.
