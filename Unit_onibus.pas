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
    edt_trajeto1: TEdit;
    cb_motorista: TComboBox;
    cb_empresa: TComboBox;
    btn_inserir: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    adoquery_aux: TADOQuery;
    X: TLabel;
    edt_trajeto2: TEdit;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_motoristaChange(Sender: TObject);
    procedure cb_empresaChange(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_onibus: Tform_onibus;
  num_motorista, cod_empresa : integer;

implementation

uses Unit_menu;

{$R *.dfm}

procedure Tform_onibus.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure Tform_onibus.FormShow(Sender: TObject);
begin
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
  if (trim(edt_num.Text)='') or (trim(edt_trajeto1.Text)='') or (trim(edt_trajeto2.Text)='') or
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
                            IntToStr(num_motorista) + ',' + QuotedStr(edt_trajeto1.Text+' x '+edt_trajeto2.Text) + ')';
    //Executa comando SQL
    adoquery_aux.ExecSQL;
    //Encerra a transa��o confirmando a altera��o
    Form_menu.ConexaoBD.CommitTrans;
    //Abre e fecha o adoquery_onibus para atualizar os registros
    adoquery_onibus.Close;
    adoquery_onibus.Open;
    //Exibe mensagem e limpa os campos
    ShowMessage('Opera��o executada com sucesso !');
    edt_num.Clear;
    edt_trajeto1.Clear;
    edt_trajeto2.Clear;
    cb_motorista.ItemIndex:= -1; //Colocamos -1 na propriedade Itemindex do combobox
    cb_empresa.ItemIndex:= -1;    //para n�o precisa limpar os nomes cadastrados
   end;

end;

end.
