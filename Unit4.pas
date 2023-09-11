unit unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uPrincipal; // Importe a unit principal

type
  TLoginForm = class(TForm)
    ButtonLogin: TButton;
    procedure ButtonLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.ButtonLoginClick(Sender: TObject);
begin
  // Crie e exiba a tela principal ao clicar no botão
  MainForm := TMainForm.Create(Application);
  MainForm.Show;
  // Feche o formulário de login
  Close;
end;

end.

