unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TFrmCliente = class(TForm)
    LblNome: TLabel;
    LblIdade: TLabel;
    LblEstado: TLabel;
    LblSalario: TLabel;
    EdtNome: TEdit;
    SpnEdtIdade: TSpinEdit;
    CmbBoxEstados: TComboBox;
    EdtSalario: TEdit;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

end.
