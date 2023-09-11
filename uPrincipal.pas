unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Menus,
  System.ImageList, Vcl.ImgList, CommCtrl, StrUtils;

type
  TFormPrincipal = class(TForm)
    PageControl1: TPageControl;
    Menu: TMainMenu;
    AbrirNovaAba: TMenuItem;
    Abrirform21: TMenuItem;
    Menu1: TMenuItem;
    Manuteno1: TMenuItem;
    Relatorios1: TMenuItem;
    Configuraes1: TMenuItem;
    Sair2: TMenuItem;
    tsAcessoRapido: TTabSheet;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AbrirNovaAbaClick(Sender: TObject);
    procedure Abrirform21Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sair2Click(Sender: TObject);
  private


    procedure CriarNovaAba(const NomeAba: string; FormClass: TFormClass);
    function FormularioJaAberto(FormClass: TFormClass): Boolean;

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses
  Unit2, Unit3;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  PageControl1.Align := alClient;
  PageControl1.Pages[0].TabVisible := false;
  PageControl1.Pages[0].Visible := true;

end;

procedure TFormPrincipal.Sair2Click(Sender: TObject);
begin
   Close;
end;

procedure TFormPrincipal.Abrirform21Click(Sender: TObject);
begin
  if not FormularioJaAberto(TForm3) then
    CriarNovaAba('Formulario 3', TForm3);
end;

procedure TFormPrincipal.AbrirNovaAbaClick(Sender: TObject);
begin
  if not FormularioJaAberto(TForm2) then
    CriarNovaAba('Formulario 2', TForm2);
end;

function TFormPrincipal.FormularioJaAberto(FormClass: TFormClass): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to PageControl1.PageCount - 1 do
  begin
    try
      if (PageControl1.ActivePage <> tsAcessoRapido) and (PageControl1.Pages[i].ComponentCount > 0) and (PageControl1.Pages[i].Components[0] is FormClass) then
      begin
        PageControl1.ActivePage := PageControl1.Pages[i];
        Result := True;
        Break;
      end;
    except
    end;
  end;
end;

procedure TFormPrincipal.CriarNovaAba(const NomeAba: string; FormClass: TFormClass);
var
  TabSheet: TTabSheet;
  TelaForm: TForm;
begin
  TabSheet := TTabSheet.Create(PageControl1);
  TabSheet.PageControl := PageControl1;
  TabSheet.Caption := NomeAba + '  x';

  TelaForm := FormClass.Create(TabSheet);
  TelaForm.Parent := TabSheet;
  TelaForm.Align := alClient;
  TelaForm.BorderStyle := bsNone;
  TelaForm.Visible := True;

  PageControl1.ActivePage := TabSheet;

  if PageControl1.Pages[0].TabVisible = false then
  begin
    PageControl1.Pages[0].TabVisible := true;
    PageControl1.Pages[0].Visible := true;
  end;

end;

procedure TFormPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if (PageControl1.ActivePage <> tsAcessoRapido) and (PageControl1.ActivePage <> nil) then
    begin
      PageControl1.ActivePage.Free;
      if PageControl1.PageCount = 1 then
      begin
        PageControl1.Pages[0].TabVisible := false;
        PageControl1.Pages[0].Visible := true;
      end;
    end;
  end;
end;

procedure TFormPrincipal.PageControl1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TabIndex: Integer;
  CloseRect: TRect;
begin

  if (Button = mbLeft) and (PageControl1.ActivePage <> tsAcessoRapido) then
  begin
    TabIndex := PageControl1.IndexOfTabAt(X, Y);
    if TabIndex >= 0 then
    begin
      CloseRect := PageControl1.TabRect(TabIndex);

      CloseRect.Left := CloseRect.Right - 16;
      CloseRect.Right := CloseRect.Right + 2;
      CloseRect.Top := CloseRect.Top + 2;
      CloseRect.Bottom := CloseRect.Bottom - 2;

      if PtInRect(CloseRect, Point(X, Y)) then
      begin
        PageControl1.Pages[TabIndex].Free;

        if PageControl1.PageCount = 1 then
        begin
          PageControl1.Pages[0].TabVisible := false;
          PageControl1.Pages[0].Visible := true;
        end;
      end;
    end;
  end;
end;

end.

