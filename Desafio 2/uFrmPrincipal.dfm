﻿object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rios'
  ClientHeight = 400
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblNome: TLabel
    Left = 30
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object LblSalário: TLabel
    Left = 30
    Top = 59
    Width = 36
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object LblNumeroFilhos: TLabel
    Left = 30
    Top = 86
    Width = 72
    Height = 13
    Caption = 'N'#250'm. de filhos:'
  end
  object EdtNome: TEdit
    Left = 112
    Top = 29
    Width = 137
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Nome e Sobrenome'
  end
  object EdtSalario: TEdit
    Left = 112
    Top = 56
    Width = 137
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = '0.00'
  end
  object EdtNumFilhos: TEdit
    Left = 112
    Top = 83
    Width = 137
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = '0'
  end
  object BtnAdicionar: TButton
    Left = 286
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = BtnAdicionarClick
  end
  object MemoDisplay: TMemo
    AlignWithMargins = True
    Left = 29
    Top = 128
    Width = 332
    Height = 241
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MemDisplay')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
end
