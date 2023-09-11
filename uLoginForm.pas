unit uLoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TLoginForm = class(TForm)
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
  private
    FAuthenticationSuccessful: Boolean;
  public
    property AuthenticationSuccessful: Boolean read FAuthenticationSuccessful;
  end;

var
  LoginForm: TLoginForm;

implementation

uses
  uPrincipal; // Importe a unit do formulário principal

{$R *.dfm}

procedure TLoginForm.btnLoginClick(Sender: TObject);
begin

  if true then
  begin
    Close;
  end
  else
  begin
    ShowMessage('Falha na autenticação. Tente novamente.');
  end;
end;

end.

