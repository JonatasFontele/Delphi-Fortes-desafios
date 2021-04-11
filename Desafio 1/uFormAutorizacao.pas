unit uFormAutorizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.UITypes, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, uFormTabelaVenda;

type
  TFrmAutorizacao = class(TForm)
    ImgPassword: TImage;
    ImgUser: TImage;
    EdtAdmin: TEdit;
    EdtSenha: TEdit;
    BtnAutorizar: TButton;
    procedure BtnAutorizarClick(Sender: TObject);
    procedure ApagaCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtAdminKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FrmTabelaVenda: TFrmTabelaVenda;
  public
    { Public declarations }
  end;

var
  FrmAutorizacao: TFrmAutorizacao;

implementation

{$R *.dfm}

procedure TFrmAutorizacao.BtnAutorizarClick(Sender: TObject);
begin
  if (AnsiUpperCase(EdtAdmin.Text) = 'ADMIN') and (AnsiUpperCase(EdtSenha.Text) = 'ADMIN') then
  begin
    if FrmTabelaVenda = nil then
      FrmTabelaVenda := TFrmTabelaVenda.Create(Self);
    FrmTabelaVenda.Show;
    ApagaCampos;
    FrmAutorizacao.Close;
  end
  else if AnsiUpperCase(EdtAdmin.Text) <> 'ADMIN' then
  begin
    Messagedlg('Login incorreto', mtError, [mbOK], 0);
    ApagaCampos;
  end
  else
  begin
    Messagedlg('Senha incorreta', mtError, [mbOK], 0);
    EdtSenha.Clear;
  end;
end;

{
  Obs.: Não precisa criar um método KeyPress como abaixo:

  // Se pressionar a tecla 'Enter' dispara o Autorizar
  if Key = #13 then // Seria if Key = VK_RETURN then no KeyDown
  begin
    Key := #0;
    BtnAutorizarClick(nil);
  end;

  Basta colocar a propriedade Default do botão Autorizar em 'True'
}

procedure TFrmAutorizacao.EdtAdminKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DOWN then
    perform(wm_nextdlgctl,0,0); // EdtSenha.SetFocus;
end;

procedure TFrmAutorizacao.EdtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    perform(wm_nextdlgctl,1,0); // EdtAdmin.SetFocus;
end;

procedure TFrmAutorizacao.ApagaCampos;
begin
  EdtAdmin.Clear;
  EdtSenha.Clear;
end;

procedure TFrmAutorizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmTabelaVenda := nil;
end;

end.
