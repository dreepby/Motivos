unit uMotivosControler;

interface

uses
  System.SysUtils, Data.DB, System.Generics.Collections, uMotivosDto,
  Dialogs, System.UITypes, System.Classes, Winapi.Windows,
  uMotivosInterfaceModel, uMotivos;

type TMotivosControler = class
  private
    oMotivosDto: TMotivosDto;
    frmMotivos: TfrmPrincipal;

  public
    procedure AbrirForm;

end;

implementation

end.
