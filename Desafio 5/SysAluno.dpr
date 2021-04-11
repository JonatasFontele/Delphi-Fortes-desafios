program SysAluno;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {FrmPrincipal},
  uAluno in 'uAluno.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
