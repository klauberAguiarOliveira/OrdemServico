unit uCustonTabSheet;

interface

uses
  Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, ComCtrls, Classes, Vcl.Graphics, Winapi.Windows;

type
  TCustomTabControl = class(TPageControl)
  private
    procedure DrawCloseButton(TabIndex: Integer);
    procedure CloseTabOnClick(Sender: TObject);
  protected
    procedure DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Vcl.Forms;

constructor TCustomTabControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style := tsButtons;
end;

procedure TCustomTabControl.DrawCloseButton(TabIndex: Integer);
var
  CloseRect: TRect;
  CloseSize: Integer;
  X, Y: Integer;
begin
  if TabIndex >= 0 then
  begin
    CloseSize := 15;
    CloseRect := TabRect(TabIndex);

    X := CloseRect.Right - CloseSize;
    Y := CloseRect.Top + (CloseRect.Height - CloseSize) div 2;

    Canvas.Pen.Color := clBlack;
    Canvas.Brush.Style := bsSolid;
    Canvas.Brush.Color := clRed;

    Canvas.Rectangle(X, Y, X + CloseSize, Y + CloseSize);
    Canvas.Pen.Color := clWhite;
    Canvas.MoveTo(X + 3, Y + 3);
    Canvas.LineTo(X + CloseSize - 3, Y + CloseSize - 3);
    Canvas.MoveTo(X + 3, Y + CloseSize - 3);
    Canvas.LineTo(X + CloseSize - 3, Y + 3);
  end;
end;

procedure TCustomTabControl.DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  inherited DrawTab(TabIndex, Rect, Active);
  DrawCloseButton(TabIndex);
end;

procedure TCustomTabControl.CloseTabOnClick(Sender: TObject);
var
  I: Integer;
begin
  // Verifique se o Sender é uma instância de TTabSheet
  if Sender is TTabSheet then
  begin
    // Percorra todas as abas
    for I := 0 to PageCount - 1 do
    begin
      // Verifique se a aba atual corresponde ao Sender
      if Pages[I] = TTabSheet(Sender) then
      begin
        // Libere a aba correspondente
        Pages[I].Free;
        // Saia do loop, pois encontramos a aba
        Break;
      end;
    end;
  end;
end;


end.

