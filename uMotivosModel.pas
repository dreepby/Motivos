unit uMotivosModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.DApt, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet,System.Generics.Collections , uClassSingletonConexao,
  uMotivosDto, uMotivosInterfaceModel;

type
  TMotivosModel = class(TInterfacedObject, IModelMotivosInterface)
    private
    oQueryListarMotivos: TFDQuery;
  public
    function BuscarID: Integer;
    function Alterar(var AMotivos: TMotivosDto): Boolean;
    function Inserir(var AMotivos: TMotivosDto): Boolean;
    function ListarMotivos(var DsMotivos: TDataSource): Boolean;
    function Deletar(const AIDMotivos: Integer): Boolean;
    function CompararRegistro(const sMotivo: String): Boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMotivosModel }

function TMotivosModel.Alterar(var AMotivos: TMotivosDto): Boolean;
begin

end;

function TMotivosModel.BuscarID: Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TSingletonConexao.GetInstancia;
    oQuery.Open('select id' + '  from motivos');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.FieldByName('id').AsInteger + 1;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

function TMotivosModel.CompararRegistro(const sMotivo: String): Boolean;
var
  oQuery: TFDQuery;
begin

  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := TSingletonConexao.GetInstancia;
    oQuery.Open('select motivo' + '  from motivos where motivo =' + QuotedStr(sMotivo));
    if (not(oQuery.IsEmpty)) then
      Result := False
    else
      Result := True;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;

constructor TMotivosModel.Create;
begin
  oQueryListarMotivos := TFDQuery.Create(nil);
end;

function TMotivosModel.Deletar(const AIDMotivos: Integer): Boolean;
begin

end;

destructor TMotivosModel.Destroy;
begin
  oQueryListarMotivos.Close;

  if Assigned(oQueryListarMotivos) then
    FreeAndNil(oQueryListarMotivos);;
  inherited;
end;

function TMotivosModel.Inserir(var AMotivos: TMotivosDto): Boolean;
var
  sSql: String;
begin
  sSql := 'insert into motivos (id, motivo) values (' +
    IntToStr(AMotivos.idMotivos) + ', ' + QuotedStr(AMotivos.Motivo) + ')';

  Result := TSingletonConexao.GetInstancia.ExecSQL(sSql) > 0;
end;

function TMotivosModel.ListarMotivos(var DsMotivos: TDataSource): Boolean;
begin

end;

end.
