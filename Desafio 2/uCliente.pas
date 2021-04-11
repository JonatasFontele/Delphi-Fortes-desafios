unit uCliente;

interface

   Type

   TCliente = class

   private

      FCodigo: String;

      FSexo: String;

      FNome: String;

      procedure SetCodigo(const Value: String);

      procedure SetNome(const Value: String);

      procedure SetSexo(const Value: String);

    { private declarations }

   protected

   { protected declarations }

   public

   { public declarations }

      property Codigo: String read FCodigo write SetCodigo;

      property Nome: String read FNome write SetNome;

      property Sexo: String read FSexo write SetSexo;

   published

   { published declarations }

end;



implementation



{ TCliente }



procedure TCliente.SetCodigo(const Value: String);

begin

   FCodigo := Value;

end;



procedure TCliente.SetNome(const Value: String);

begin

   FNome := Value;

end;



procedure TCliente.SetSexo(const Value: String);

begin

   FSexo := Value;

end;



end.
