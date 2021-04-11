object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 400
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMAdmin
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LblProduto: TLabel
    Left = 38
    Top = 32
    Width = 42
    Height = 13
    Caption = 'Produto:'
  end
  object LblQuantidade: TLabel
    Left = 37
    Top = 59
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object LblPreco: TLabel
    Left = 38
    Top = 86
    Width = 59
    Height = 13
    Caption = 'Pre'#231'o Unid.:'
  end
  object EdtProduto: TEdit
    Left = 112
    Top = 29
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Nome'
    OnKeyDown = EdtProdutoKeyDown
    OnKeyPress = EdtProdutoKeyPress
  end
  object EdtQuantidade: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = '0'
    OnKeyDown = EdtQuantidadeKeyDown
    OnKeyPress = EdtQuantidadeKeyPress
  end
  object EdtPreco: TEdit
    Left = 112
    Top = 83
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = '0,00'
    OnKeyDown = EdtPrecoKeyDown
    OnKeyPress = EdtPrecoKeyPress
  end
  object BtnAdicionarProduto: TButton
    Left = 264
    Top = 55
    Width = 105
    Height = 24
    Caption = 'Adicionar Produto'
    TabOrder = 3
    OnClick = BtnAdicionarProdutoClick
  end
  object MemoDisplay: TMemo
    AlignWithMargins = True
    Left = 20
    Top = 129
    Width = 360
    Height = 251
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alBottom
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object BtnNovaOperacao: TButton
    Left = 264
    Top = 82
    Width = 105
    Height = 24
    Caption = 'Nova Opera'#231#227'o'
    TabOrder = 5
    OnClick = BtnNovaOperacaoClick
  end
  object MMAdmin: TMainMenu
    Left = 65528
    object BtnAdmin: TMenuItem
      Caption = 'Admin'
      object BtnEditarVenda: TMenuItem
        Caption = 'Editar Venda'
        OnClick = BtnEditarVendaClick
      end
    end
  end
end
