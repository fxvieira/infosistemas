program prjInfoSistemas;

uses
  Vcl.Forms,
  untCadastroCliente in 'untCadastroCliente.pas' {FrmCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCadastroCliente, FrmCadastroCliente);
  Application.Run;
end.
