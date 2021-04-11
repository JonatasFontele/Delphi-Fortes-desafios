unit uAluno;

interface

type
  TAluno = class
  private
    FLNotas: array of Double;
    FNome: String;
    FMatricula: Integer;
    procedure SetLNotas(const Value: array of Double);
    procedure SetMatricula(const Value: Integer);
    procedure SetNome(const Value: String);

  public
    property Matricula: Integer read FMatricula write SetMatricula;
    property Nome: String read FNome write SetNome;
    property LNotas: array[0..4] of Double read FLNotas write SetLNotas;
    function CalculaMedia(Nota1, Nota2, Nota3, ME: Double): Double;
  end;

implementation

{ TAluno }

function TAluno.CalculaMedia(Nota1, Nota2, Nota3, ME: Double): Double;
var
  I: Integer;
begin
  Result := (FLNotas[0] + (FLNotas[1] * 2) + (FLNotas[2] * 3) + FLNotas[3]) / 7;
end;

procedure TAluno.SetLNotas(const Value: array of Double);
begin
  FLNotas := Value;
end;

procedure TAluno.SetMatricula(const Value: Integer);
begin
  FMatricula := Value;
end;

procedure TAluno.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
