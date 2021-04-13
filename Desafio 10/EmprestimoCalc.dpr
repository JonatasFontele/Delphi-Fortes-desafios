program EmprestimoCalc;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {FrmPrincipal},
  uCliente in 'uCliente.pas' {FrmCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
