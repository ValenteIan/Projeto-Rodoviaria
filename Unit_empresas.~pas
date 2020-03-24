unit Unit_empresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm_empresas = class(TForm)
    btn_fechar: TBitBtn;
    adoquery_empresas: TADOQuery;
    dbgrid_empresas: TDBGrid;
    ds_empresas: TDataSource;
    edt_cod: TEdit;
    edt_nome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    adoquery_aux: TADOQuery;
    BitBtn1: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_empresas: TForm_empresas;

implementation

uses Unit_menu;

{$R *.dfm}

procedure TForm_empresas.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm_empresas.FormShow(Sender: TObject);
begin
adoquery_empresas.Open;
end;

procedure TForm_empresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
adoquery_empresas.Close;
end;

procedure TForm_empresas.BitBtn1Click(Sender: TObject);
begin
// Se algum campo estiver vazio Então
//    exibe a mensagem
// Senão
//    executa o Insert

if(trim(edt_cod.Text)='')or(trim(edt_nome.Text)='')then
  begin
    Showmessage('Preencha todos os campos!');
  end
else
  begin
    //Inicia uma transação
    Form_menu.ConexaoBD.BeginTrans;
    //Monta o comando Insert
    adoquery_aux.SQL.Text:=' INSERT INTO EMPRESAS VALUES (' +edt_cod.Text + ',' + QuotedStr(edt_nome.Text) + ')';
    //Executa o comando SQL
    adoquery_aux.ExecSQL;
    //Encerra a transação confirmando a alteração
    Form_menu.ConexaoBD.CommitTrans;
    //Abre e fecha o adoquery_empresas para atualizar os registros
    adoquery_empresas.Close;
    adoquery_empresas.Open;
    //Exibe mensagem e limpa os campos
    ShowMessage('Operação executada com sucesso!');
    edt_cod.Clear;
    edt_nome.Clear;
  end;
end;

end.
