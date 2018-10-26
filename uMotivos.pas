unit uMotivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, System.UITypes, uMotivosControler;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    pnBotoes: TPanel;
    btnMotivos: TBitBtn;
    btnListar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnMotivosClick(Sender: TObject);
  private
    { Private declarations }
    procedure WMClose(var Message: TWMClose); message WM_Close;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oMotivosControler: TMotivosControler;

implementation

{$R *.dfm}

procedure TfrmPrincipal.WMClose(var Message: TWMClose);
begin
  if MessageDlg('Deseja realmente sair do programa?', mtinformation,
    [mbyes, mbno], 0) = mryes then
    Application.Terminate;
end;

procedure TfrmPrincipal.btnMotivosClick(Sender: TObject);
begin
   if not(Assigned(oMotivosControler)) then
    oMotivosControler := TMotivosControler.Create;
  oMotivosControler.abrirForm;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := False;
end;

end.
