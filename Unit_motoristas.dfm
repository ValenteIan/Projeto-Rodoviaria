object form_motoristas: Tform_motoristas
  Left = -1387
  Top = 246
  Width = 1088
  Height = 563
  Caption = 'Motoristas'
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
  object dbgrid_motoristas: TDBGrid
    Left = 296
    Top = 128
    Width = 320
    Height = 120
    DataSource = ds_motoristas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btn_fechar: TBitBtn
    Left = 408
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btn_fecharClick
  end
  object ds_motoristas: TDataSource
    DataSet = adoquery_motoristas
    Left = 336
    Top = 256
  end
  object adoquery_motoristas: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM MOTORISTAS ORDER BY NOME')
    Left = 304
    Top = 256
  end
end
