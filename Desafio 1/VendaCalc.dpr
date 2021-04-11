program VendaCalc;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {FrmPrincipal},
  uVenda in 'uVenda.pas',
  uFormAutorizacao in 'uFormAutorizacao.pas' {FrmAutorizacao},
  uFormTabelaVenda in 'uFormTabelaVenda.pas' {FrmTabelaVenda},
  uLogica in 'uLogica.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
