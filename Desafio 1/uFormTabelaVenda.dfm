object FrmTabelaVenda: TFrmTabelaVenda
  Left = 0
  Top = 0
  Caption = 'Tabela de Venda'
  ClientHeight = 424
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GrdProdutos: TStringGrid
    Left = 0
    Top = 0
    Width = 356
    Height = 424
    Margins.Top = 20
    Margins.Bottom = 20
    Align = alLeft
    FixedCols = 0
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object BtnAdicionar: TButton
    Left = 362
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 1
  end
  object BtnEditar: TButton
    Left = 362
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 2
  end
  object BtnRemover: TButton
    Left = 362
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Remover'
    TabOrder = 3
  end
end
