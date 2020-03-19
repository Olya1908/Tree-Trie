unit UFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAdd, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm2)
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
    uses UMain;
{$R *.dfm}

procedure TForm4.btnOkClick(Sender: TObject);
  begin
    if Tree.Find(edtInputWrd.Text) then
      showmessage('¬веденое слово найдено')

    else
      showmessage('¬веденое слово не найдено');
    edtInputWrd.Text:='';
  end;

end.
