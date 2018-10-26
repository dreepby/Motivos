unit uMotivosInterfaceModel;

interface

uses
  Data.DB, System.Generics.Collections, uMotivosDto;

type
  IModelMotivosInterface = interface
  function BuscarID: Integer;
    function Alterar(var AMotivos: TMotivosDto): Boolean;
    function Inserir(var AMotivos: TMotivosDto): Boolean;
    function ListarMotivos(var DsMotivos: TDataSource): Boolean;
    function Deletar(const AIDMotivos: Integer): Boolean;
    function CompararRegistro(const sMotivo: String): Boolean;
  end;

implementation

end.
