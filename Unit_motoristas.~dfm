object form_motoristas: Tform_motoristas
  Left = 206
  Top = 168
  Width = 1040
  Height = 581
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
  object edt_salario: TEdit
    Left = 736
    Top = 96
    Width = 81
    Height = 21
    TabOrder = 5
  end
  object btn_inserir: TBitBtn
    Left = 736
    Top = 120
    Width = 81
    Height = 25
    Caption = 'Inserir'
    TabOrder = 6
    OnClick = btn_inserirClick
  end
  object rb_feminino: TRadioButton
    Left = 688
    Top = 96
    Width = 33
    Height = 17
    Caption = 'F'
    TabOrder = 7
  end
  object rb_masculino: TRadioButton
    Left = 688
    Top = 112
    Width = 41
    Height = 17
    Caption = 'M'
    TabOrder = 8
  end
  object btn_alterar: TBitBtn
    Left = 336
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 9
    OnClick = btn_alterarClick
  end
  object btn_salvar: TBitBtn
    Left = 416
    Top = 120
    Width = 89
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 10
    OnClick = btn_salvarClick
  end
  object btn_excluir: TBitBtn
    Left = 592
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 11
    OnClick = btn_excluirClick
  end
  object btn_cancelar: TBitBtn
    Left = 512
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 12
    OnClick = btn_cancelarClick
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
