object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Padaria XYZ'
  ClientHeight = 361
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LblProduto: TLabel
    Left = 40
    Top = 54
    Width = 42
    Height = 13
    Caption = 'Produto:'
  end
  object LblPreco: TLabel
    Left = 40
    Top = 94
    Width = 31
    Height = 13
    Caption = 'Pre'#231'o:'
  end
  object BtnAdicionar: TButton
    Left = 272
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 0
    OnClick = BtnAdicionarClick
  end
  object RichEdt: TRichEdit
    AlignWithMargins = True
    Left = 20
    Top = 141
    Width = 344
    Height = 200
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'P'#227'ozinho - R$ 0,75'
      'Broa        - R$ 4,50.'
      
        '----------------------------------------------------------------' +
        '--------------------')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Zoom = 100
    ExplicitLeft = 15
    ExplicitTop = 137
  end
  object EdtProduto: TEdit
    Left = 88
    Top = 51
    Width = 137
    Height = 21
    TabOrder = 2
    TextHint = 'Nome'
  end
  object EdtPreco: TEdit
    Left = 88
    Top = 91
    Width = 137
    Height = 21
    TabOrder = 3
    TextHint = '0,00'
  end
  object MainMenu1: TMainMenu
    object Abrirtxt1: TMenuItem
      Caption = '.txt'
      object Abrir1: TMenuItem
        Caption = 'Abrir'
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
      end
      object Editar1: TMenuItem
        Caption = 'Editar'
      end
      object Deletar1: TMenuItem
        Caption = 'Deletar'
      end
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar caixa'
      OnClick = Fechar1Click
    end
  end
end
