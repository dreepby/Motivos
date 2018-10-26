unit uMotivosControler;

interface

uses
  System.SysUtils, Data.DB, System.Generics.Collections, uMotivosDto,
  Dialogs, System.UITypes, System.Classes, Winapi.Windows,
  uMotivosInterfaceModel, uCadMotivos, uMotivosRegras, uMotivosModel;

type TMotivosControler = class
  private
    oMotivosDto: TMotivosDto;
    frmMotivos: TfrmCadMotivos;
    oMotivosRegras: TMotivosRegra;
    oMotivosModel: IModelMotivosInterface;

    procedure Salvar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure OnKeyPressEdt(Sender: TObject; var Key: Char);
    procedure FecharForm;

    public

    procedure AbrirForm;
    function AlterarRegistro(const id: Integer): Boolean;

     constructor Create;
    destructor Destroy; override;
end;

implementation

{ TMotivosControler }

procedure TMotivosControler.AbrirForm;
begin
 if (not(Assigned(frmMotivos))) then
  begin
    frmMotivos := TfrmCadMotivos.Create(nil);
    frmMotivos.edtMotivo.OnKeyPress := OnKeyPressEdt;
    frmMotivos.BtnSalvar.Enabled := False;
    frmMotivos.BtnSalvar.OnClick := Salvar;
    frmMotivos.BtnCancelar.OnClick := Cancelar;
    frmMotivos.Show;
  end
  else
    frmMotivos.Show;

end;

function TMotivosControler.AlterarRegistro(const id: Integer): Boolean;
begin

end;

procedure TMotivosControler.Cancelar(Sender: TObject);
begin
  FecharForm;
end;

constructor TMotivosControler.Create;
begin
  oMotivosModel := TMotivosModel.Create;
  oMotivosRegras := TMotivosRegra.Create;
  oMotivosDto := TMotivosDto.Create;
end;

destructor TMotivosControler.Destroy;
begin

  if Assigned(oMotivosRegras) then
    FreeAndNil(oMotivosRegras);

  if Assigned(oMotivosDto) then
    FreeAndNil(oMotivosDto);

  if Assigned(frmMotivos) then
  begin
    frmMotivos.Close;
    FreeAndNil(frmMotivos);
  end;
  inherited;
end;

procedure TMotivosControler.FecharForm;
begin
  if (not(Assigned(frmMotivos))) then
    exit;

  oMotivosRegras.Limpar(oMotivosDto);
  frmMotivos.Close;
  FreeAndNil(frmMotivos);
end;

procedure TMotivosControler.OnKeyPressEdt(Sender: TObject; var Key: Char);
begin

  if (Length(frmMotivos.edtMotivo.Text) > 0) then
  begin
    frmMotivos.BtnSalvar.Enabled := True;

    if Key = #13 then
    frmMotivos.BtnSalvar.Click;
  end
  else
    frmMotivos.BtnSalvar.Enabled := False;
end;

procedure TMotivosControler.Salvar(Sender: TObject);
begin
  oMotivosDto.Motivo := frmMotivos.edtMotivo.Text;
  ShowMessage(oMotivosRegras.Salvar(oMotivosModel,oMotivosDto));
  frmMotivos.edtMotivo.Text := '';
end;

end.
