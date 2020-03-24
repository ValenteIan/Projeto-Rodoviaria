object form_motoristas: Tform_motoristas
  Left = 206
  Top = 169
  Width = 1040
  Height = 580
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
  object Label1: TLabel
    Left = 280
    Top = 80
    Width = 40
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object Label2: TLabel
    Left = 360
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 632
    Top = 80
    Width = 30
    Height = 13
    Caption = 'Idade:'
  end
  object Label4: TLabel
    Left = 688
    Top = 80
    Width = 27
    Height = 13
    Caption = 'Sexo:'
  end
  object Label5: TLabel
    Left = 736
    Top = 80
    Width = 35
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object dbgrid_motoristas: TDBGrid
    Left = 280
    Top = 152
    Width = 537
    Height = 249
    DataSource = ds_motoristas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btn_fechar: TBitBtn
    Left = 512
    Top = 408
    Width = 145
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btn_fecharClick
  end
  object edt_num: TEdit
    Left = 280
    Top = 96
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 360
    Top = 96
    Width = 249
    Height = 21
    TabOrder = 3
  end
  object edt_idade: TEdit
    Left = 632
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 4
  end
  object edt_sexo: TEdit
    Left = 688
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 5
  end
  object edt_salario: TEdit
    Left = 736
    Top = 96
    Width = 81
    Height = 21
    TabOrder = 6
  end
  object BitBtn1: TBitBtn
    Left = 736
    Top = 120
    Width = 81
    Height = 25
    Caption = 'Inserir'
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object ds_motoristas: TDataSource
    DataSet = adoquery_motoristas
    Left = 328
    Top = 408
  end
  object adoquery_motoristas: TADOQuery
    Connection = Form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM MOTORISTAS ORDER BY NOME')
    Left = 280
    Top = 408
  end
  object adoquery_aux: TADOQuery
    Connection = Form_menu.ConexaoBD
    Parameters = <>
    Left = 368
    Top = 408
  end
end
