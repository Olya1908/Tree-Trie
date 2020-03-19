unit UTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAdd, StdCtrls, ExtCtrls,UNode,UTrieTree;

type
  TForm5 = class(TForm2)
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
   uses UMain;
{$R *.dfm}

procedure TForm5.btnOkClick(Sender: TObject);
  begin
    tree.Task(edtInputWrd.Text);
    tree.View(Form1.treememo.Lines);
    tree.ViewInTV(Form1.treeview,treenode);
    Form1.Active();
    close();
  end;

end.
