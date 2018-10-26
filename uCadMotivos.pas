unit uCadMotivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadMotivos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSalvar: TBitBtn;
    BtnCancelar: TBitBtn;
    edtMotivo: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
