program PedidosCalc;

uses
  Vcl.Forms,
  uFormEditCardapio in 'uFormEditCardapio.pas' {FrmEditCardapio} ,
  uFormPrincipal in 'uFormPrincipal.pas' {FrmPrincipal} ,
  uProduto in 'uProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;

end.
