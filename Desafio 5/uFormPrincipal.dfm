object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'SysAluno'
  ClientHeight = 323
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PHeader: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnCadastrarAluno: TBitBtn
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 0
    end
    object Btn: TBitBtn
      Left = 104
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Situa'#231#227'o'
      TabOrder = 1
    end
  end
  object PBody: TPanel
    Left = 0
    Top = 41
    Width = 447
    Height = 282
    Align = alClient
    TabOrder = 1
    object LblMatricula: TLabel
      Left = 58
      Top = 24
      Width = 43
      Height = 13
      Caption = 'Matricula'
    end
    object LblNota1: TLabel
      Left = 119
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Nota 1'
    end
    object LblNota2: TLabel
      Left = 180
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Nota 2'
    end
    object LblNota3: TLabel
      Left = 241
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Nota 3'
    end
    object LblME: TLabel
      Left = 302
      Top = 24
      Width = 14
      Height = 13
      Caption = 'ME'
    end
    object StringGridAlunos: TStringGrid
      Left = 58
      Top = 142
      Width = 324
      Height = 120
      TabOrder = 0
    end
    object EdtMatricula: TEdit
      Left = 58
      Top = 43
      Width = 55
      Height = 21
      TabOrder = 1
    end
    object EdtNota1: TEdit
      Left = 119
      Top = 43
      Width = 55
      Height = 21
      TabOrder = 2
    end
    object EdtNota2: TEdit
      Left = 180
      Top = 43
      Width = 55
      Height = 21
      TabOrder = 3
    end
    object EdtNota3: TEdit
      Left = 241
      Top = 43
      Width = 55
      Height = 21
      TabOrder = 4
    end
    object EdtME: TEdit
      Left = 302
      Top = 43
      Width = 55
      Height = 21
      TabOrder = 5
    end
    object BtnCalcular: TButton
      Left = 307
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 6
      OnClick = BtnCalcularClick
    end
  end
end
