object Form_empresas: TForm_empresas
  Left = 353
  Top = 225
  Width = 769
  Height = 427
  Caption = 'Empresas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 368
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 160
    Top = 24
    Width = 36
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object btn_fechar: TBitBtn
    Left = 360
    Top = 288
    Width = 145
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btn_fecharClick
  end
  object dbgrid_empresas: TDBGrid
    Left = 160
    Top = 112
    Width = 505
    Height = 169
    DataSource = ds_empresas
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_cod: TEdit
    Left = 368
    Top = 40
    Width = 297
    Height = 21
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 160
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object adoquery_empresas: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM EMPRESAS ORDER BY NOME')
    Left = 160
    Top = 288
  end
  object ds_empresas: TDataSource
    DataSet = adoquery_empresas
    Left = 200
    Top = 288
  end
  object adoquery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 160
    Top = 320
  end
end
