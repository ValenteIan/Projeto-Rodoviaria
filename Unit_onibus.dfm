object form_onibus: Tform_onibus
  Left = 211
  Top = 198
  Width = 1088
  Height = 563
  Caption = #212'nibus'
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
    Left = 320
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Motorista:'
  end
  object Label2: TLabel
    Left = 472
    Top = 80
    Width = 44
    Height = 13
    Caption = 'Empresa:'
  end
  object Label3: TLabel
    Left = 320
    Top = 40
    Width = 40
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object Label4: TLabel
    Left = 528
    Top = 40
    Width = 46
    Height = 16
    Caption = 'Trajeto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object X: TLabel
    Left = 552
    Top = 64
    Width = 7
    Height = 13
    Caption = 'X'
  end
  object btn_fechar: TBitBtn
    Left = 568
    Top = 280
    Width = 145
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btn_fecharClick
  end
  object dbgrid_onibus: TDBGrid
    Left = 320
    Top = 128
    Width = 409
    Height = 145
    DataSource = ds_onibus
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_num: TEdit
    Left = 320
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edt_trajeto1: TEdit
    Left = 456
    Top = 56
    Width = 81
    Height = 21
    TabOrder = 3
  end
  object cb_motorista: TComboBox
    Left = 320
    Top = 96
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = cb_motoristaChange
  end
  object cb_empresa: TComboBox
    Left = 472
    Top = 96
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = cb_empresaChange
  end
  object btn_inserir: TBitBtn
    Left = 640
    Top = 96
    Width = 89
    Height = 25
    Caption = 'Inserir'
    TabOrder = 6
    OnClick = btn_inserirClick
  end
  object edt_trajeto2: TEdit
    Left = 568
    Top = 56
    Width = 89
    Height = 21
    TabOrder = 7
  end
  object ds_onibus: TDataSource
    DataSet = adoquery_onibus
    Left = 360
    Top = 280
  end
  object adoquery_onibus: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ONIBUS.NUM_ONIBUS AS ONIBUS,'
      '               EMPRESAS.NOME AS EMPRESA,'
      '               MOTORISTAS.NOME AS MOTORISTA,'
      '               ONIBUS.TRAJETO FROM ONIBUS'
      ' INNER JOIN EMPRESAS'
      '   ON EMPRESAS.COD_EMPRESA = ONIBUS.COD_EMPRESA'
      ' INNER JOIN MOTORISTAS'
      '   ON MOTORISTAS.NUM_MOTORISTA = ONIBUS.NUM_MOTORISTA')
    Left = 328
    Top = 280
  end
  object adoquery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 392
    Top = 280
  end
end
