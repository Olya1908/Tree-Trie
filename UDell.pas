unit UDell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAdd, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm2)
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
    uses UMain, UNode;
{$R *.dfm}

procedure TForm3.btnOkClick(Sender: TObject);
  begin
    if not tree.delete(edtInputWrd.Text) then
      ShowMessage('Заданное слово не найдено')

    else
      begin
        Form1.Enabled:=true;
        tree.View(Form1.treeMemo.Lines);
        tree.ViewInTV(Form1.treeview,treenode);
        edtInputWrd.Text:='';
        close();
      end;
  end;

end.
