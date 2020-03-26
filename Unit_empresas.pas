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
    btn_inserir: TBitBtn;
    btn_alterar: TBitBtn;
    btn_salvar: TBitBtn;
    btn_excluir: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_empresas: TForm_empresas;
  cod_empresa : string;
  deu_erro: boolean;

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
btn_salvar.Visible:=false;
end;

procedure TForm_empresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
adoquery_empresas.Close;
end;

procedure TForm_empresas.btn_inserirClick(Sender: TObject);
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
    adoquery_aux.SQL.Text:=' INSERT INTO EMPRESAS VALUES (' +
                            edt_cod.Text + ',' + QuotedStr(edt_nome.Text) + ')';
    try
      //Executa o comando SQL
      adoquery_aux.ExecSQL;
      deu_erro:=false;
    except
      on E : Exception do
      begin
        deu_erro := true;
        //Se for erro de PK então
        //  exibe mensagem
        //Senão
        //  Exibe a mensagem sem tratamento
        if Form_menu.ErroBD(E.Message, 'PK_Empresas') = 'Sim' then
          showmessage('Código já cadastrado!')
        else
          showmessage('Ocorreu o seguinte erro: ' + E.Message);
        end;
      end;
    if deu_erro = false then
      begin
        //Encerra a transação confirmando a alteração
        Form_menu.ConexaoBD.CommitTrans;
        //Abre e fecha o adoquery_empresas para atualizar os registros
        adoquery_empresas.Close;
        adoquery_empresas.Open;
        //Exibe mensagem e limpa os campos
        ShowMessage('Operação executada com sucesso!');
        edt_cod.Clear;
        edt_nome.Clear;
      end
    else
      begin
      Form_menu.ConexaoBD.RollbackTrans;
      end;
    end;  
  end;

procedure TForm_empresas.btn_alterarClick(Sender: TObject);
begin
btn_salvar.Visible:=true;
btn_excluir.Visible:=false;
btn_inserir.Visible:=false;
   cod_empresa:=adoquery_empresas.fieldbyname('cod_empresa').AsString;
   edt_cod.Text:=cod_empresa;
   edt_nome.Text:=adoquery_empresas.fieldbyname('nome').AsString;
end;

procedure TForm_empresas.btn_salvarClick(Sender: TObject);
begin
//Inicia transação
Form_menu.ConexaoBD.BeginTrans;
//Monta instrução UPDATE
adoquery_aux.SQL.Text:='UPDATE EMPRESAS SET ' +
                        ' COD_EMPRESA = ' + edt_cod.Text + ',' +
                        ' NOME = ' + QuotedStr(edt_nome.Text) +
                        ' WHERE COD_EMPRESA = ' + cod_empresa;
try
  //Execute a instrução UPDATE
  adoquery_aux.ExecSQL;
  deu_erro:=false;
except
    on E : Exception do
    begin
      deu_erro:=true;
      if Form_menu.ErroBD(E.Message,'FK_Onibus_Empresas') = 'Sim' then
        ShowMessage('Impossivel atualizar o código pois existem ônibus ligados a esta empresa!')
      else if Form_menu.ErroBD(E.Message, 'PK_Empresas') = 'Sim' then
        ShowMessage('Código já cadastrado!')
      else
        ShowMessage('Ocorreu o seguinte erro:' + E.Message);
        end;
end;

if deu_erro = false then
  begin
    //Encerra a transação confirmando as alterações
    Form_menu.ConexaoBD.CommitTrans;
    //Atualiza o adoquery_empresas
    adoquery_empresas.Close;
    adoquery_empresas.Open;
    //Exibe mensagem e limpa as caixas de texto
    showmessage('Informações atualizadas com sucesso!');
    edt_cod.Clear;
    edt_nome.Clear;
    btn_salvar.Visible:=false;
    btn_excluir.Visible:=true;
    btn_inserir.Visible:=true;
  end
else
  begin
    Form_menu.ConexaoBD.RollbackTrans;
  end;  

end;

procedure TForm_empresas.btn_excluirClick(Sender: TObject);
begin
//Obtém o codigo da empresa selecionada
cod_empresa:=adoquery_empresas.fieldbyname('cod_empresa').AsString;
//Inicia transação
Form_menu.ConexaoBD.BeginTrans;
//Monsta instrução DELETE
adoquery_aux.SQL.Text:=' DELETE FROM EMPRESAS ' +
                        'WHERE COD_EMPRESA = ' + cod_empresa;
//Execute a instrução DELETE
adoquery_aux.ExecSQL;
//Encerra a transação confirmando as alterações
Form_menu.ConexaoBD.CommitTrans;
//Atualiza o adoquery_empresas
adoquery_empresas.Close;
adoquery_empresas.Open;
//Exibe mensagem e limpa as caixas de texto
showmessage('Empresa excluída com sucesso!');
edt_cod.Clear;
edt_nome.Clear;
end;

end.
