unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, DialogsX, ActnList, StdCtrls, ImgList,
  ComCtrls, ToolWin,UNode,UTrieTree,UAdd, UDell, UFind,UTask;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    mainMenu: TMainMenu;
    nfile: TMenuItem;
    Edit: TMenuItem;
    Find: TMenuItem;
    Task: TMenuItem;
    Create: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    SaveAs: TMenuItem;
    Ending: TMenuItem;
    Exit: TMenuItem;
    AddWord: TMenuItem;
    DeleteWord: TMenuItem;
    Clear: TMenuItem;
    dlgOpen: TOpenDialog;
    actlst: TActionList;
    tlb1: TToolBar;
    btnCreate: TToolButton;
    actCreate: TAction;
    btnOpen: TToolButton;
    actOpen: TAction;
    dlgSave: TSaveDialog;
    btnSave: TToolButton;
    actSave: TAction;
    btnSeparator1: TToolButton;
    btnAdd: TToolButton;
    actAdd: TAction;
    btnFind: TToolButton;
    actFind: TAction;
    btnDel: TToolButton;
    actDel: TAction;
    ImageLiist: TImageList;
    btnSeparator2: TToolButton;
    btnTask: TToolButton;
    actTask: TAction;
    btnSeparator3: TToolButton;
    btnClose: TToolButton;
    actClose: TAction;
    btnExit: TToolButton;
    actExit: TAction;
    treeMemo: TMemo;
    treeView: TTreeView;
    pnl2: TPanel;
    spl1: TSplitter;

    procedure Active();
    procedure AddWordClick(Sender: TObject);
    procedure DeleteWordClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure CreateClick(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure TaskClick(Sender: TObject);
    procedure EndingClick(Sender: TObject);
    procedure SaveAsClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FileName: string;
  Tree:TTrie;
  treenode : TTreeNode;
  FileIsCreate, FileSave, FileClose: boolean;

implementation

{$R *.dfm}

procedure TForm1.Active();
  begin
    Clear.enabled:=Treememo.Lines.count>0;
    DeleteWord.enabled:=Clear.enabled;
    Save.Enabled:=Clear.enabled;
    SaveAs.enabled:=Clear.enabled;
    Ending.Enabled:=Clear.enabled;
    Task.Enabled:=Clear.enabled;
    Find.Enabled:=Clear.enabled;
    btnSave.Enabled:=Clear.enabled;
    btnAdd.Enabled:=Clear.enabled;
    btnDel.Enabled:=Clear.enabled;
    btnFind.Enabled:=Clear.enabled;
    btnClose.Enabled:=Clear.enabled;
    btnTask.Enabled:=Clear.enabled;
  end;

procedure TForm1.AddWordClick(Sender: TObject);
  begin
    Form1.Enabled:=false;
    Form2.Show();
  end;

procedure TForm1.DeleteWordClick(Sender: TObject);
  begin
    Form1.Enabled:=false;
    Form3.Show();
  end;

procedure TForm1.OpenClick(Sender: TObject);
  begin
    if ((filename<>'') or FileIsCreate) and not FileSave
        and (MessageDlg('Сохранить изменения?',mtCustom,[mbYes,mbNo,mbCancel], 0)= mrYes)
    then
        SaveClick(Sender);

    tree.Clear;
    treeMemo.Clear;
    treeView.Items.Clear;
    dlgOpen.FileName:=FileName;

    if dlgOpen.Execute then
      begin
        FileName:=dlgOpen.FileName;
        treememo.Visible:=true;
        treeView.Visible:=true;

          if tree.LoadFromFile(filename) then
            begin
              tree.ViewInTV(treeview,treenode);
              tree.View(Form1.treeMemo.Lines);
            end;
      end;
    Active();
    Edit.Enabled:=true;
    AddWord.Enabled:=true;
    FileSave:=false;
    FileClose:=false;
  end;

procedure TForm1.ExitClick(Sender: TObject);
  begin
      close();
  end;

procedure TForm1.SaveClick(Sender: TObject);
  begin
     if FileName<>'' then
        begin
          Treememo.Lines.SaveToFile(filename);
          FileSave:=true;
        end
     else
        SaveAsClick(Sender);
  end;

procedure TForm1.CreateClick(Sender: TObject);
  begin

    if ((FileName<>'') or FileIsCreate) and not FileSave and
        (MessageDlg('Сохранить изменения?',mtCustom,[mbYes,mbNo,mbCancel], 0)= mrYes)
    then
          SaveClick(Sender);

    FileIsCreate:=true;
    treeMemo.Clear;
    treeView.Items.Clear;
    TRee.Clear;
    dlgSave.FileName:='';
    Filename:='';
    treememo.Visible:=true;
    treeView.Visible:=true;
    FileSave:=False;
    AddWordClick(Sender);
    Active();
    Edit.Enabled:=true;
    AddWord.Enabled:=true;
    FileClose:=false;
  end;

procedure TForm1.FindClick(Sender: TObject);
  begin
    Form1.Enabled:=false;
    Form4.Show();
  end;

procedure TForm1.TaskClick(Sender: TObject);
  begin
    Form1.Enabled:=false;
    Form5.Show();
  end;

procedure TForm1.EndingClick(Sender: TObject);
  begin
     if ((FileName<>'') or FileIsCreate) and not FileSave and
        (MessageDlg('Сохранить изменения?',mtCustom,[mbYes,mbNo,mbCancel], 0)= mrYes)
     then
          SaveClick(Sender);

    Tree.Clear();
    treeMemo.Clear;
    TreeView.Items.Clear;
    Active();
    Edit.Enabled:=false;
    FileClose:=true;
  end;

procedure TForm1.SaveAsClick(Sender: TObject);
  begin
    if dlgSave.Execute then
      if FileExists(dlgSave.FileName) then
        begin
           if MessageDlg('Файл с таким именем уже существует! Перезаписать?',
              mtConfirmation,[mbYes,mbNo,mbCancel],0)=mrYes
           then
             begin
                Treememo.Lines.SaveToFile(dlgSave.FileName);
                FileSave:=true;
             end;
        end
        
      else
        begin
          Treememo.Lines.SaveToFile(dlgSave.FileName);
          FileSave:=true;
        end;
  end;

procedure TForm1.ClearClick(Sender: TObject);
  begin
    tree.Clear();
    treememo.Clear();
    treeview.Items.Clear;
    Active();
  end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if (not FileClose and treememo.Visible) then
      if (MessageDlg('Сохранить изменения?',mtCustom,[mbYes,mbNo,mbCancel], 0)= mrYes)
      then
         begin
           saveClick(sender);
           Action:=caFree
         end;
  end;

initialization
  Tree := TTrie.Create;

finalization
  Tree.Free;
end.
