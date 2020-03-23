object Form_menu: TForm_menu
  Left = -1178
  Top = 276
  Width = 521
  Height = 468
  Caption = 'Menu Rodovi'#225'ria'
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
  object btn_empresas: TBitBtn
    Left = 248
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Empresas'
    TabOrder = 0
    OnClick = btn_empresasClick
  end
  object btn_onibus: TBitBtn
    Left = 248
    Top = 168
    Width = 75
    Height = 25
    Caption = #212'nibus'
    TabOrder = 1
    OnClick = btn_onibusClick
  end
  object btn_fechar: TBitBtn
    Left = 248
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object btn_motoristas: TBitBtn
    Left = 248
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Motoristas'
    TabOrder = 3
    OnClick = btn_motoristasClick
  end
  object ConexaoBD: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=Rodovi'#225'ria;Data Source=DESKTOP-HR2SECH\SQ' +
      'LEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 96
    Top = 32
  end
end
