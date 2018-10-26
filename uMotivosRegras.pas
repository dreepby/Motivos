unit uMotivosRegras;

interface
uses
  uMotivosDto, System.SysUtils, uMotivosModel, uMotivosInterfaceModel;

type
  TMotivosRegra = class
  public
    procedure Limpar(AMunicipio: TMotivosDto);
    function Deletar(var AModel: IModelMotivosInterface; AId: Integer): Boolean;
    function Salvar(var AModel: IModelMotivosInterface; AMotivos: TMotivosDto): String;
  end;

implementation

{ TMotivosRegra }

function TMotivosRegra.Deletar(var AModel: IModelMotivosInterface;
  AId: Integer): Boolean;
begin

end;

procedure TMotivosRegra.Limpar(AMunicipio: TMotivosDto);
begin

end;

function TMotivosRegra.Salvar(var AModel: IModelMotivosInterface;
  AMotivos: TMotivosDto): String;
begin
  if (AModel.CompararRegistro(AMotivos.Motivo)) then
  begin
    if AModel.Inserir(AMotivos) then
    begin
      Result := 'Motivo cadastrado!';
    end
    else
      Result := 'Ocorreu algum erro, Tente novamente!';
  end
  else
    Result := 'Motivo já cadastrado!';
end;

end.
