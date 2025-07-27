object Menu_Principal: TMenu_Principal
  Left = 191
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Balance Beans!'
  ClientHeight = 473
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Background: TImage
    Left = 424
    Top = 40
    Width = 465
    Height = 449
    Proportional = True
    Transparent = True
  end
  object Logo: TImage
    Left = 112
    Top = 8
    Width = 209
    Height = 121
    Center = True
    Stretch = True
    Transparent = True
  end
  object Music_Menu: TMediaPlayer
    Left = 112
    Top = 424
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 0
  end
  object Boton_Empezar: TPanel
    Left = 112
    Top = 152
    Width = 209
    Height = 41
    Caption = 'Empezar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Felix Titling'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Boton_EmpezarClick
  end
  object Boton_Creditos: TPanel
    Left = 112
    Top = 203
    Width = 209
    Height = 41
    Caption = 'Creditos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Felix Titling'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Boton_Salir: TPanel
    Left = 112
    Top = 254
    Width = 209
    Height = 41
    Caption = 'Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Felix Titling'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Boton_SalirClick
  end
  object Selec_Dificultad: TComboBox
    Left = 336
    Top = 152
    Width = 193
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Footlight MT Light'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 4
    Text = 'Seleccione una dificultad'
    Items.Strings = (
      'Facil'
      'Medio'
      'Dificil'
      'Muy dificil')
  end
  object Timer_Carga1: TTimer
    Interval = 5
    OnTimer = Timer_Carga1Timer
    Left = 8
    Top = 424
  end
  object Timer_MusicaMenu: TTimer
    Interval = 5
    OnTimer = Timer_MusicaMenuTimer
    Left = 40
    Top = 424
  end
end
