program APedidos;

uses
  Vcl.Forms,
  uAcesso in '..\forms\uAcesso.pas' {FormLogin},
  uDados in '..\forms\uDados.pas' {Dm: TDataModule},
  ulib in '..\class\ulib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'APedidos';
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.
