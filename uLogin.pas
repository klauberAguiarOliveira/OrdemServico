unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uPrincipal,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Edit1: TEdit;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel4: TPanel;
    Image2: TImage;
    Edit2: TEdit;
    Label8: TLabel;
    pnlEntrar: TPanel;
    Image3: TImage;
    Image4: TImage;
    procedure pnlEntrarClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    FLoginSuccessful: Boolean;

  public
    property LoginSuccessful: Boolean read FLoginSuccessful write FLoginSuccessful;
  end;

var
  FormLogin: TFormLogin;
  LoginSuccessful: Boolean = False;
implementation

{$R *.dfm}

procedure TFormLogin.Image4Click(Sender: TObject);
begin
  close
end;

procedure TFormLogin.pnlEntrarClick(Sender: TObject);
begin
  if true then
  begin
    LoginSuccessful := True;
    ModalResult := mrOk;
  end
  else
  begin
    ShowMessage('Login inválido. Tente novamente.');
  end;
end;

end.
