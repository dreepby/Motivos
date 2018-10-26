unit uMotivosDto;

interface

uses
System.SysUtils;

type
  TMotivosDto = class
  private
    FidMotivo: Integer;
    FMotivo: String;
    procedure SetIdMotivo(const Value: Integer);
    procedure SetMotivo(const Value: String);

  public
    property idMotivos: Integer read FidMotivo write SetIdMotivo;
    property Motivo: String read FMotivo write SetMotivo;
  end;
implementation

{ TMotivosDto }

procedure TMotivosDto.SetIdMotivo(const Value: Integer);
begin
  FidMotivo := Value;
end;

procedure TMotivosDto.SetMotivo(const Value: String);
begin
  FMotivo := Value;
end;

end.
