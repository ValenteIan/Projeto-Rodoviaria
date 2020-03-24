unit Unit_motoristas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  Tform_motoristas = class(TForm)
    dbgrid_motoristas: TDBGrid;
    ds_motoristas: TDataSource;
    btn_fechar: TBitBtn;
    adoquery_motoristas: TADOQuery;
    edt_num: TEdit;
    edt_nome: TEdit;
    edt_idade: TEdit;
    edt_salario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    adoquery_aux: TADOQuery;
    rb_feminino: TRadioButton;
    rb_masculino: TRadioButton;
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
  form_motoristas: Tform_motoristas;
  sexo: string;

implementation

uses Unit_menu;

{$R *.dfm}

procedure Tform_motoristas.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure Tform_motoristas.FormShow(Sender: TObject);
begin
adoquery_motoristas.Open;
end;

procedure Tform_motoristas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
adoquery_motoristas.Close;
end;

procedure Tform_motoristas.BitBtn1Click(Sender: TObject);
begin
  if  (trim(edt_num.Text)='') or (trim(edt_nome.Text)='') or
      (trim(edt_idade.Text)='') or (not rb_feminino.Checked and not rb_masculino.Checked) or
      (trim(edt_salario.Text)='') then
    begin
    ShowMessage('Preencha todos os campos!');
    end
  else
    begin
      Form_menu.ConexaoBD.BeginTrans;

      if rb_feminino.Checked then
        begin
         sexo:= 'F';
        end
      else
        begin
          sexo:= 'M';
        end;
      adoquery_aux.SQL.Text:=' INSERT INTO MOTORISTAS VALUES (' +
                              edt_num.Text + ',' + QuotedStr(edt_nome.Text) + ',' +
                             edt_idade.Text + ',' + QuotedStr(sexo) + ',' +
                             edt_salario.Text + ')';
      adoquery_aux.ExecSQL;
      Form_menu.ConexaoBD.CommitTrans;
      adoquery_motoristas.Close;
      adoquery_motoristas.Open;
      ShowMessage('Operação executada com sucesso!');
      edt_num.Clear;
      edt_nome.Clear;
      edt_idade.Clear;
      edt_sexo.Clear;
      edt_salario.Clear;
    end;
end;

end.
