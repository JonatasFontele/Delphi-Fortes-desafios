object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Empresa ABC'
  ClientHeight = 412
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LblCodigo: TLabel
    Left = 28
    Top = 27
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object LblSalario: TLabel
    Left = 28
    Top = 67
    Width = 36
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object LblData: TLabel
    Left = 28
    Top = 139
    Width = 27
    Height = 13
    Caption = 'Data:'
  end
  object LblHoraExtra: TLabel
    Left = 28
    Top = 104
    Width = 66
    Height = 13
    Caption = 'Horas Extras:'
  end
  object LblFeriado: TLabel
    Left = 28
    Top = 174
    Width = 40
    Height = 13
    Caption = 'Feriado:'
  end
  object Memo: TMemo
    AlignWithMargins = True
    Left = 20
    Top = 207
    Width = 394
    Height = 185
    Margins.Left = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitLeft = 15
    ExplicitTop = 198
  end
  object EdtCodigo: TEdit
    Left = 103
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object EdtSalario: TEdit
    Left = 103
    Top = 64
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object BtnAdd: TButton
    Left = 328
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = BtnAddClick
  end
  object BtnFinalizar: TButton
    Left = 328
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Finalizar'
    TabOrder = 4
    OnClick = BtnFinalizarClick
  end
  object DateTimePicker: TDateTimePicker
    Left = 103
    Top = 136
    Width = 169
    Height = 21
    Date = 44252.000000000000000000
    Time = 0.746381145836494400
    TabOrder = 5
  end
  object EdtHoraExtra: TEdit
    Left = 103
    Top = 101
    Width = 169
    Height = 21
    TabOrder = 6
  end
  object CmbBoxFeriado: TComboBox
    Left = 103
    Top = 171
    Width = 145
    Height = 21
    TabOrder = 7
    Text = 'N'#227'o'
    Items.Strings = (
      'N'#227'o'
      'Sim')
  end
end
