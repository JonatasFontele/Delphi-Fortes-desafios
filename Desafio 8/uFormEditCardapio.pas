unit uFormEditCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmEditCardapio = class(TForm)
    LblCodigo: TLabel;
    LblNome: TLabel;
    LblPreco: TLabel;
    EdtCodigoEdit: TEdit;
    EdtNomeEdit: TEdit;
    EdtPrecoEdit: TEdit;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure EdtCodigoEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditCardapio: TFrmEditCardapio;

implementation

{$R *.dfm}

uses
  uFormPrincipal;

procedure TFrmEditCardapio.EdtCodigoEditChange(Sender: TObject);
var
  vKey: Integer;
begin
  try
    vKey := StrToInt(EdtCodigoEdit.Text);
    // Preenche o nome do produto na tela
    if TFrmPrincipal vDict.ContainsKey(vKey) then
      EdtProduto.Text := vDict.Items[vKey].Nome
    else
      EdtProduto.Text := '';
  except
    on E: Exception do
  end;
end;

end.
