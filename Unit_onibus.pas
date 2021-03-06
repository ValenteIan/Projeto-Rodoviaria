unit Unit_onibus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  Tform_onibus = class(TForm)
    btn_fechar: TBitBtn;
    ds_onibus: TDataSource;
    dbgrid_onibus: TDBGrid;
    adoquery_onibus: TADOQuery;
    edt_num: TEdit;
    edt_trajeto: TEdit;
    cb_motorista: TComboBox;
    cb_empresa: TComboBox;
    btn_inserir: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    adoquery_aux: TADOQuery;
    btn_alterar: TBitBtn;
    btn_salvar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_cancelar: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_motoristaChange(Sender: TObject);
    procedure cb_empresaChange(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_onibus: Tform_onibus;
  num_motorista, cod_empresa : integer;
  num_onibus : string;
  deu_erro: boolean;
implementation

uses Unit_menu;

{$R *.dfm}

procedure Tform_onibus.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure Tform_onibus.FormShow(Sender: TObject);
begin
btn_salvar.Enabled:=false;
btn_cancelar.Enabled:=false;
adoquery_onibus.Open;
//Limpa o combobox de motoristas
cb_motorista.Clear;
//Define o SELECT para obter o nome dos motoristas
adoquery_aux.SQL.Text:='SELECT NOME FROM MOTORISTAS ORDER BY NOME';
//Abre a query com o SELECT definido
adoquery_aux.Open;
//Enquanto n�o chegar ao final da query fa�a...
While Not adoquery_aux.Eof do
begin
    //Adiciona ao combobox o nome do motorista do registro corrente
    cb_motorista.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
    //Passa para o pr�ximo registro da query
    adoquery_aux.Next;
end;
//Fecha a query de motoristas
adoquery_aux.Close;


//Limpa o combobox de empresas
cb_empresa.Clear;
//Define o SELECT para obter o nome das empresas
adoquery_aux.SQL.Text:= 'SELECT NOME FROM EMPRESAS ORDER BY NOME';
//Abre a query com o SELECT definido
adoquery_aux.Open;
//Enquanto n�o chegar ao final da query fa�a...
While Not adoquery_aux.Eof do
begin
  //Adiciona ao combobox o nome da empresa do registro corrente
  cb_empresa.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
  //passa para o pr�ximo registro do query
  adoquery_aux.Next;
end;
//Fecha a query empresas
adoquery_aux.Close;
end;

procedure Tform_onibus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
adoquery_onibus.Close;
end;

procedure Tform_onibus.cb_motoristaChange(Sender: TObject);
begin
  //Monta o SELECT para pegar o n�mero do motorista atrav�s do nome
  adoquery_aux.SQL.Text:=' SELECT NUM_MOTORISTA FROM MOTORISTAS '+
                          'WHERE NOME = '+ QuotedStr(cb_motorista.Text);
  //Arbre a query
  adoquery_aux.Open;
  //Atribui o valor obtido � variavel
  num_motorista := adoquery_aux.fieldbyname('NUM_MOTORISTA').AsInteger;
  //Fecha a query
  adoquery_aux.Close;
end;

procedure Tform_onibus.cb_empresaChange(Sender: TObject);
begin
  //Monta o SELECT para pegar o c�digo da empresa atrav�s do nome
  adoquery_aux.SQL.Text:=' SELECT COD_EMPRESA FROM EMPRESAS '+
                          ' WHERE NOME = '+QuotedStr(cb_empresa.Text);
  //Abre a query
  adoquery_aux.Open;
  //Atribui o valor obtido � vari�vel
  cod_empresa := adoquery_aux.fieldbyname('COD_EMPRESA').AsInteger;
  //Fecha a query
  adoquery_aux.Close;                        
end;

procedure Tform_onibus.btn_inserirClick(Sender: TObject);
begin
  //SE algum dos campos estiver vazio Ent�o
  //   exibe mensagem
  //Sen�o
  //   executa o INSERT
  if (trim(edt_num.Text)='') or (trim(edt_trajeto.Text)='') or
      (trim(cb_motorista.Text)='') or (trim(cb_empresa.Text)='') then
    begin
      Showmessage('Preencha todos os campos!')
    end
  else
    begin
    //Inicia uma transa��o
    Form_menu.ConexaoBD.BeginTrans;
    //Monta o comando Insert
    adoquery_aux.SQL.Text:='INSERT INTO ONIBUS VALUES ('+
                            edt_num.Text + ',' + IntToStr(cod_empresa) + ',' +
                            IntToStr(num_motorista) + ',' + QuotedStr(edt_trajeto.Text) + ')';
     try
    //Executa comando SQL
    adoquery_aux.ExecSQL;
    deu_erro:=false;
    except
        on E : Exception do
        begin
          deu_erro := true;
          if Form_menu.ErroBD(E.Message, 'PK_Onibus') = 'Sim' then
            ShowMessage('C�digo ja cadastrado')
          else
            ShowMessage('Ocorreu o seguinte erro: ' + E.Message)
        end;
    end;

    if deu_erro = false then
      begin
        //Encerra a transa��o confirmando a altera��o
        Form_menu.ConexaoBD.CommitTrans;
        //Abre e fecha o adoquery_onibus para atualizar os registros
        adoquery_onibus.Close;
        adoquery_onibus.Open;
        //Exibe mensagem e limpa os campos
        ShowMessage('Opera��o executada com sucesso !');
        edt_num.Clear;
        edt_trajeto.Clear;
        cb_motorista.ItemIndex:= -1; //Colocamos -1 na propriedade Itemindex do combobox
        cb_empresa.ItemIndex:= -1;    //para n�o precisa limpar os nomes cadastrados
      end
    else
      begin
      Form_menu.ConexaoBD.RollbackTrans;
    end;      
   end;

end;

procedure Tform_onibus.btn_alterarClick(Sender: TObject);
begin
  btn_inserir.Enabled:=false;
  btn_excluir.Enabled:=false;
  btn_salvar.Enabled:=true;
  btn_cancelar.Enabled:=true;
  num_onibus:=adoquery_onibus.fieldbyname('onibus').AsString;
  edt_num.Text:=num_onibus;
  edt_trajeto.Text:=adoquery_onibus.fieldbyname('trajeto').AsString;
  cb_motorista.Text:=adoquery_onibus.fieldbyname('motorista').AsString;
  cb_motoristaChange(sender);//Executa o evento OnChange do objeto
  cb_empresa.Text:=adoquery_onibus.fieldbyname('empresa').AsString;
  cb_empresaChange(sender);//Executa o evento OnChange do objeto

end;

procedure Tform_onibus.btn_salvarClick(Sender: TObject);
begin
Form_menu.ConexaoBD.BeginTrans;
adoquery_aux.SQL.Text:='UPDATE ONIBUS SET ' +
                        ' NUM_ONIBUS = ' + edt_num.Text + ',' +
                        ' COD_EMPRESA = ' + inttostr(cod_empresa) + ',' +
                        ' NUM_MOTORISTA = ' + inttostr(num_motorista) + ',' +
                        ' TRAJETO = ' + QuotedStr(edt_trajeto.Text) +
                        ' WHERE NUM_ONIBUS = ' + num_onibus;
try
  adoquery_aux.ExecSQL;
  deu_erro:=false
except
    on E: exception do
    begin
      deu_erro:=true;
      if form_menu.ErroBD(E.Message, 'PK_Onibus') = 'Sim' then
        showmessage('C�digo j� cadastrado')
      else
        showmessage('Ocorreu o seguinte erro ' + E.Message)
    end;
end;
if deu_erro = false then
  begin
    Form_menu.ConexaoBD.CommitTrans;
    adoquery_onibus.Close;
    adoquery_onibus.Open;
    showmessage('Informa��es atualizadas com sucesso!');
    edt_num.Clear;
    edt_trajeto.Clear;
    cb_motorista.ItemIndex := -1;
    cb_empresa.ItemIndex := -1;
    btn_inserir.Enabled:=true;
    btn_excluir.Enabled:=true;
    btn_salvar.Enabled:=false;
    btn_cancelar.Enabled:=false;
  end
else
  begin
  form_menu.ConexaoBD.RollbackTrans;
  end;
        

end;

procedure Tform_onibus.btn_excluirClick(Sender: TObject);
begin
num_onibus:=adoquery_onibus.fieldbyname('onibus').AsString;
Form_menu.ConexaoBD.BeginTrans;
adoquery_aux.SQL.Text:=' DELETE FROM ONIBUS ' +
                        ' WHERE NUM_ONIBUS = ' + num_onibus;
adoquery_aux.ExecSQL;
form_menu.ConexaoBD.CommitTrans;
adoquery_onibus.Close;
adoquery_onibus.Open;
showmessage('Onibus excluido com sucesso');
end;

procedure Tform_onibus.btn_cancelarClick(Sender: TObject);
begin
  edt_num.Clear;
  edt_trajeto.Clear;
  cb_motorista.ItemIndex := -1;
  cb_empresa.ItemIndex := -1;
  btn_inserir.Enabled:=true;
  btn_excluir.Enabled:=true;
  btn_salvar.Enabled:=false;
  btn_cancelar.Enabled:=false;
end;

end.
