program Motivos;

uses
  Vcl.Forms,
  uMotivos in 'uMotivos.pas' {frmPrincipal},
  uCadMotivos in 'uCadMotivos.pas' {frmCadMotivos},
  uMotivosDto in 'uMotivosDto.pas',
  uMotivosControler in 'uMotivosControler.pas',
  uMotivosInterfaceModel in 'uMotivosInterfaceModel.pas',
  uMotivosRegras in 'uMotivosRegras.pas',
  uMotivosModel in 'uMotivosModel.pas',
  uClassConexaoBanco in 'uClassConexaoBanco.pas',
  uClassSingletonConexao in 'uClassSingletonConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
