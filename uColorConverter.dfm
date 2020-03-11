object fcolorconverter: Tfcolorconverter
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conversor de Cores'
  ClientHeight = 216
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    472
    216)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 18
    Width = 7
    Height = 13
    Caption = 'R'
  end
  object Label2: TLabel
    Left = 208
    Top = 46
    Width = 7
    Height = 13
    Caption = 'G'
  end
  object Label3: TLabel
    Left = 209
    Top = 75
    Width = 6
    Height = 13
    Caption = 'B'
  end
  object Label4: TLabel
    Left = 280
    Top = 18
    Width = 7
    Height = 13
    Caption = 'H'
  end
  object Label5: TLabel
    Left = 280
    Top = 46
    Width = 6
    Height = 13
    Caption = 'S'
  end
  object Label6: TLabel
    Left = 281
    Top = 74
    Width = 6
    Height = 13
    Caption = 'V'
  end
  object Label7: TLabel
    Left = 344
    Top = 18
    Width = 5
    Height = 13
    Caption = #186
  end
  object Label8: TLabel
    Left = 344
    Top = 46
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label9: TLabel
    Left = 344
    Top = 74
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 376
    Top = 18
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label11: TLabel
    Left = 377
    Top = 46
    Width = 8
    Height = 13
    Caption = 'M'
  end
  object Label12: TLabel
    Left = 440
    Top = 18
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label13: TLabel
    Left = 440
    Top = 46
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label14: TLabel
    Left = 376
    Top = 74
    Width = 6
    Height = 13
    Caption = 'Y'
  end
  object Label15: TLabel
    Left = 377
    Top = 102
    Width = 6
    Height = 13
    Caption = 'K'
  end
  object Label16: TLabel
    Left = 440
    Top = 74
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label17: TLabel
    Left = 440
    Top = 102
    Width = 11
    Height = 13
    Caption = '%'
  end
  object sColors: TShape
    Left = 8
    Top = 8
    Width = 185
    Height = 90
  end
  object sGreyscale: TShape
    Left = 8
    Top = 118
    Width = 185
    Height = 90
    Anchors = [akLeft, akBottom]
    ExplicitTop = 113
  end
  object Label18: TLabel
    Left = 8
    Top = 102
    Width = 78
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Escala de Cinza:'
    ExplicitTop = 107
  end
  object btn_normalizar: TButton
    Left = 218
    Top = 165
    Width = 120
    Height = 43
    Anchors = [akRight, akBottom]
    Caption = 'Normalizar RGB'
    TabOrder = 11
    OnClick = btn_normalizarClick
  end
  object btn_limpar: TButton
    Left = 344
    Top = 165
    Width = 120
    Height = 43
    Anchors = [akRight, akBottom]
    Caption = 'Limpar'
    TabOrder = 10
    OnClick = btn_limparClick
  end
  object R: TSpinEdit
    Left = 221
    Top = 15
    Width = 47
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 0
    Value = 0
    OnExit = RExit
  end
  object G: TSpinEdit
    Left = 221
    Top = 43
    Width = 47
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnExit = GExit
  end
  object B: TSpinEdit
    Left = 221
    Top = 72
    Width = 47
    Height = 22
    MaxValue = 255
    MinValue = 0
    TabOrder = 2
    Value = 0
    OnExit = BExit
  end
  object H: TSpinEdit
    Left = 293
    Top = 15
    Width = 47
    Height = 22
    MaxValue = 360
    MinValue = 0
    TabOrder = 3
    Value = 0
    OnExit = HExit
  end
  object S: TSpinEdit
    Left = 293
    Top = 43
    Width = 47
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 4
    Value = 0
    OnExit = SExit
  end
  object V: TSpinEdit
    Left = 293
    Top = 71
    Width = 47
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 5
    Value = 0
    OnExit = VExit
  end
  object C: TSpinEdit
    Left = 389
    Top = 15
    Width = 47
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 6
    Value = 0
    OnExit = CExit
  end
  object M: TSpinEdit
    Left = 389
    Top = 43
    Width = 47
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 7
    Value = 0
    OnExit = MExit
  end
  object Y: TSpinEdit
    Left = 389
    Top = 71
    Width = 47
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 8
    Value = 0
    OnExit = YExit
  end
  object K: TSpinEdit
    Left = 389
    Top = 99
    Width = 47
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 9
    Value = 0
    OnExit = KExit
  end
end
