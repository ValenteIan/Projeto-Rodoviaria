object Form_empresas: TForm_empresas
  Left = 372
  Top = 252
  Width = 769
  Height = 405
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
    Width = 577
    Height = 169
    DataSource = ds_empresas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_cod: TEdit
    Left = 160
    Top = 40
    Width = 113
    Height = 21
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 368
    Top = 40
    Width = 361
    Height = 21
    TabOrder = 3
  end
  object btn_inserir: TBitBtn
    Left = 160
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btn_inserirClick
  end
  object btn_alterar: TBitBtn
    Left = 368
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = btn_alterarClick
  end
  object btn_salvar: TBitBtn
    Left = 456
    Top = 72
    Width = 97
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 6
    OnClick = btn_salvarClick
  end
  object btn_excluir: TBitBtn
    Left = 656
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btn_excluirClick
  end
  object btn_voltar: TBitBtn
    Left = 568
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 8
    OnClick = btn_voltarClick
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
    Left = 232
    Top = 288
  end
end
