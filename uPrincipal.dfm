object FormPrincipal: tFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de ordem de servi'#231'o'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Menu = Menu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    ActivePage = tsAcessoRapido
    Align = alClient
    TabOrder = 0
    OnMouseDown = PageControl1MouseDown
    object tsAcessoRapido: TTabSheet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object Label1: TLabel
        Left = 24
        Top = 48
        Width = 94
        Height = 20
        Caption = 'Acesso r'#225'pido'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = 20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object Menu: TMainMenu
    Left = 576
    Top = 40
    object Menu1: TMenuItem
      Caption = '&Cadastros'
      object AbrirNovaAba: TMenuItem
        Caption = 'Abrir form 2'
        OnClick = AbrirNovaAbaClick
      end
      object Abrirform21: TMenuItem
        Caption = 'Abrir form 3'
        OnClick = Abrirform21Click
      end
    end
    object Manuteno1: TMenuItem
      Caption = '&Manuten'#231#227'o'
    end
    object Relatorios1: TMenuItem
      Caption = '&Relatorios'
    end
    object Configuraes1: TMenuItem
      Caption = 'Conf&igura'#231#245'es'
    end
    object Sair2: TMenuItem
      Caption = '&Sair'
      OnClick = Sair2Click
    end
  end
end
