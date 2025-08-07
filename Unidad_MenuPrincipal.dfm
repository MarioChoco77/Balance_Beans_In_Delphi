object Menu_Principal: TMenu_Principal
  Left = 179
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Balance Beans!'
  ClientHeight = 473
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
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
    OnClick = Boton_CreditosClick
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
  object Panel_Creditos: TPanel
    Left = 908
    Top = 160
    Width = 636
    Height = 377
    Align = alCustom
    Color = clScrollBar
    TabOrder = 5
    Visible = False
    object Label1: TLabel
      Left = 256
      Top = 16
      Width = 124
      Height = 31
      Caption = 'CREDITOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MV Boli'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Molde_Creditos: TLabel
      Left = 32
      Top = 344
      Width = 577
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Caption = 'Molde_Creditos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 600
      Top = 8
      Width = 25
      Height = 25
      Caption = ' '
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkAbort
    end
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
  object Timer_Creditos: TTimer
    Enabled = False
    Interval = 110000
    OnTimer = Timer_CreditosTimer
    Left = 8
    Top = 392
  end
  object Timer_Subida: TTimer
    Enabled = False
    Interval = 35
    OnTimer = Timer_SubidaTimer
    Left = 40
    Top = 392
  end
end
