program OrdemServico;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Controls,
  uPrincipal in 'uPrincipal.pas' {FormPrincipal},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  uLogin in 'uLogin.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormLogin, FormLogin);
  if true then
  begin
    if FormLogin.ShowModal = mrOk then
    begin
      Application.Run;
    end
    else
    begin
      if FormLogin.ModalResult = mrAbort then
        ShowMessage('Login falhou.');
      Application.Terminate;
    end;
  end;

end.

