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
    btn_voltar: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
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
btn_salvar.Enabled:=false;
end;

procedure TForm_empresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
adoquery_empresas.Close;
end;

procedure TForm_empresas.btn_inserirClick(Sender: TObject);
begin
// Se algum campo estiver vazio Ent�o
//    exibe a mensagem
// Sen�o
//    executa o Insert

if(trim(edt_cod.Text)='')or(trim(edt_nome.Text)='')then
  begin
    Showmessage('Preencha todos os campos!');
  end
else
  begin
    //Inicia uma transa��o
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
        //Se for erro de PK ent�o
        //  exibe mensagem
        //Sen�o
        //  Exibe a mensagem sem tratamento
        if Form_menu.ErroBD(E.Message, 'PK_Empresas') = 'Sim' then
          showmessage('C�digo j� cadastrado!')
        else
          showmessage('Ocorreu o seguinte erro: ' + E.Message);
        end;
      end;
    if deu_erro = false then
      begin
        //Encerra a transa��o confirmando a altera��o
        Form_menu.ConexaoBD.CommitTrans;
        //Abre e fecha o adoquery_empresas para atualizar os registros
        adoquery_empresas.Close;
        adoquery_empresas.Open;
        //Exibe mensagem e limpa os campos
        ShowMessage('Opera��o executada com sucesso!');
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
btn_salvar.Enabled:=true;
btn_voltar.Enabled:=true;
btn_excluir.Enabled:=false;
btn_inserir.Enabled:=false;
   cod_empresa:=adoquery_empresas.fieldbyname('cod_empresa').AsString;
   edt_cod.Text:=cod_empresa;
   edt_nome.Text:=adoquery_empresas.fieldbyname('nome').AsString;
end;

procedure TForm_empresas.btn_salvarClick(Sender: TObject);
begin
//Inicia transa��o
Form_menu.ConexaoBD.BeginTrans;
//Monta instru��o UPDATE
adoquery_aux.SQL.Text:='UPDATE EMPRESAS SET ' +
                        ' COD_EMPRESA = ' + edt_cod.Text + ',' +
                        ' NOME = ' + QuotedStr(edt_nome.Text) +
                        ' WHERE COD_EMPRESA = ' + cod_empresa;
try
  //Execute a instru��o UPDATE
  adoquery_aux.ExecSQL;
  deu_erro:=false;
except
    on E : Exception do
    begin
      deu_erro:=true;
      if Form_menu.ErroBD(E.Message,'FK_Onibus_Empresas') = 'Sim' then
        ShowMessage('Impossivel atualizar o c�digo pois existem �nibus ligados a esta empresa!')
      else if Form_menu.ErroBD(E.Message, 'PK_Empresas') = 'Sim' then
        ShowMessage('C�digo j� cadastrado!')
      else
        ShowMessage('Ocorreu o seguinte erro:' + E.Message);
        end;
end;

if deu_erro = false then
  begin
    //Encerra a transa��o confirmando as altera��es
    Form_menu.ConexaoBD.CommitTrans;
    //Atualiza o adoquery_empresas
    adoquery_empresas.Close;
    adoquery_empresas.Open;
    //Exibe mensagem e limpa as caixas de texto
    showmessage('Informa��es atualizadas com sucesso!');
    edt_cod.Clear;
    edt_nome.Clear;
    btn_salvar.Enabled:=false;
    btn_voltar.Enabled:=false;
    btn_excluir.Enabled:=true;
    btn_inserir.Enabled:=true;
  end
else
  begin
    Form_menu.ConexaoBD.RollbackTrans;
  end;  

end;

procedure TForm_empresas.btn_excluirClick(Sender: TObject);
begin
//Obt�m o codigo da empresa selecionada
cod_empresa:=adoquery_empresas.fieldbyname('cod_empresa').AsString;
//Inicia transa��o
Form_menu.ConexaoBD.BeginTrans;
//Monsta instru��o DELETE
adoquery_aux.SQL.Text:=' DELETE FROM EMPRESAS ' +
                        'WHERE COD_EMPRESA = ' + cod_empresa;
try
  //Execute a instru��o DELETE
  adoquery_aux.ExecSQL;
  deu_erro:=false;
except
  on E: Exception do
  begin
    deu_erro:=true;
    if Form_menu.ErroBD(E.Message, 'FK_Onibus_Empresas') = 'Sim' then
      ShowMessage('Imposs�vel excluir pois existem onibus ligados a esta empresa!')
    else
      ShowMessage('Ocorreu o seguinte erro: ' + E.Message)
  end;
end;

if deu_erro = true then
  Form_menu.ConexaoBD.RollbackTrans
else
  begin
    //Encerra a transa��o confirmando as altera��es
    Form_menu.ConexaoBD.CommitTrans;
    //Atualiza o adoquery_empresas
    adoquery_empresas.Close;
    adoquery_empresas.Open;
    //Exibe mensagem e limpa as caixas de texto
    showmessage('Empresa exclu�da com sucesso!');
    edt_cod.Clear;
    edt_nome.Clear;
  end;
end;

procedure TForm_empresas.btn_voltarClick(Sender: TObject);
begin
edt_cod.Clear;
edt_nome.Clear;
btn_salvar.Enabled:=false;
btn_voltar.Enabled:=false;
btn_excluir.Enabled:=true;
btn_inserir.Enabled:=true;
end;

end.
