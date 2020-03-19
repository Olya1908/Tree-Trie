unit UAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    pnlAdd: TPanel;
    lableWord: TLabel;
    edtInputWrd: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure edtInputWrdChange(Sender: TObject);
    procedure edtInputWrdKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
 uses UMain;
{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Form1.Enabled:=true;
    edtInputWrd.Text:='';
  end;

procedure TForm2.btnOkClick(Sender: TObject);
  begin
    tree.Add(edtInputWrd.Text);
    Form1.Enabled:=true;
    tree.View(Form1.treeMemo.Lines);
    tree.ViewInTV(Form1.treeview,treenode);
    edtInputWrd.Text:='';
    Form1.Active();
    close();
  end;

procedure TForm2.edtInputWrdChange(Sender: TObject);
  begin
      btnOk.Enabled:=true;
  end;

procedure TForm2.edtInputWrdKeyPress(Sender: TObject; var Key: Char);
  begin
    if not (key in ['a'..'z',#8]) then
      Key:=#0
  end;

procedure TForm2.btnCancelClick(Sender: TObject);
  begin
    edtInputWrd.Text:='';
    Form1.Enabled:=true;
    close();
  end;

end.
