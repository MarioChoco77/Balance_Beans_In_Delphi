object Formulario_Juego: TFormulario_Juego
  Left = 192
  Top = 135
  Width = 890
  Height = 665
  Caption = 'Formulario_Juego'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = Boton_MatrizClick
  PixelsPerInch = 96
  TextHeight = 13
  object Bean: TShape
    Left = 216
    Top = 56
    Width = 73
    Height = 73
    Brush.Color = clRed
    Shape = stCircle
  end
  object Sop: TLabel
    Left = 776
    Top = 304
    Width = 29
    Height = 20
    Caption = 'Sop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Molde: TPanel
    Left = 69
    Top = 44
    Width = 89
    Height = 89
    TabOrder = 0
    OnClick = MoldeClick
  end
  object Boton_Matriz: TButton
    Left = 8
    Top = 592
    Width = 25
    Height = 25
    TabOrder = 1
    Visible = False
    OnClick = Boton_MatrizClick
  end
  object Boton_Reinciar: TBitBtn
    Left = 720
    Top = 95
    Width = 136
    Height = 41
    Caption = '&Reiniciar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Boton_MatrizClick
    Kind = bkRetry
  end
  object P_Intentos: TPanel
    Left = 720
    Top = 52
    Width = 136
    Height = 41
    Caption = 'Intentos: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object One_Bean: TPanel
    Left = 104
    Top = 480
    Width = 215
    Height = 105
    TabOrder = 4
    OnClick = One_BeanClick
    object Orange_Bean: TShape
      Left = 72
      Top = 8
      Width = 73
      Height = 65
      Brush.Color = 33023
      Shape = stCircle
    end
    object Num_Rest1: TLabel
      Left = 24
      Top = 80
      Width = 67
      Height = 16
      Caption = 'Restantes: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = One_BeanClick
    end
  end
  object Two_Beans: TPanel
    Left = 336
    Top = 480
    Width = 215
    Height = 105
    TabOrder = 5
    OnClick = One_BeanClick
    object Yellow_Bean: TShape
      Left = 43
      Top = 8
      Width = 73
      Height = 65
      Brush.Color = clYellow
      Shape = stCircle
    end
    object Num_Rest2: TLabel
      Left = 24
      Top = 80
      Width = 67
      Height = 16
      Caption = 'Restantes: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = One_BeanClick
    end
    object Yellow_Bean2: TShape
      Left = 107
      Top = 8
      Width = 73
      Height = 65
      Brush.Color = clYellow
      Shape = stCircle
    end
  end
  object Three_beans: TPanel
    Left = 568
    Top = 480
    Width = 215
    Height = 105
    TabOrder = 6
    OnClick = One_BeanClick
    object Blue_Bean: TShape
      Left = 8
      Top = 8
      Width = 73
      Height = 65
      Brush.Color = clSkyBlue
      Shape = stCircle
    end
    object Num_Rest3: TLabel
      Left = 24
      Top = 80
      Width = 67
      Height = 16
      Caption = 'Restantes: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = One_BeanClick
    end
    object Blue_Bean1: TShape
      Left = 72
      Top = 8
      Width = 73
      Height = 65
      Brush.Color = clSkyBlue
      Shape = stCircle
    end
    object Blue_Bean2: TShape
      Left = 136
      Top = 8
      Width = 73
      Height = 65
      Brush.Color = clSkyBlue
      Shape = stCircle
    end
  end
  object Boton_Girar: TBitBtn
    Left = 720
    Top = 138
    Width = 136
    Height = 41
    Caption = 'Horizontal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Boton_GirarClick
    Kind = bkRetry
  end
end
