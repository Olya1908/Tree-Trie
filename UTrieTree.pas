unit UTrieTree;

interface
  uses Windows, Messages, SysUtils, Math, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, UNode;

type
  TTrie = class
    private
      FRoot: TNode;
    public
      constructor Create;
      destructor Destroy; override;

      function Add(wrd: string):boolean; virtual;
      function Find(wrd:string):boolean;
      function Delete(wrd: string): boolean;
      function IsEmpty():boolean;
      procedure ViewInTV(treeview:TTreeView; treeNode:TTReeNode);
      procedure View(str:Tstrings);
      function LoadFromFile(FileName:string):boolean;
      procedure Clear;
      procedure Task(litter:string);
  end;
var
    f:textFile;
implementation

constructor TTrie.Create;
  begin
     inherited Create;
     FRoot:=nil;
  end;

destructor TTRie.Destroy;
  begin
    Clear;
    inherited Destroy;
  end;

function TTrie.IsEmpty():boolean;
  begin
    result:=FRoot=nil;
  end;

function TTrie.Add(wrd: string):boolean;
  begin
    if TNode.CheckWord(wrd) then
      begin
        if FRoot=nil then
          FRoot:=TNode.Create;

        result:=FRoot.Add(wrd);
      end

    else
      result:=false;
  end;

function TTrie.Find(wrd:string):boolean;
  begin
    result:=(FRoot<>nil) and (TNode.CheckWord(wrd)) and (FRoot.Find(wrd));
  end;

function TTrie.Delete(wrd: string): boolean;
  begin
    result:=(FRoot<>nil) and (TNode.CheckWord(wrd)) and FRoot.Delete(wrd);
  end;

procedure TTrie.View(str:Tstrings);
  begin
    str.clear;
    if FRoot<>nil then
      FRoot.View(str,'');
  end;

procedure TTrie.ViewInTV(treeview:TTreeView; treeNode:TTReeNode);
  begin
    treeView.Items.Clear;
    if FRoot<>nil then
      FRoot.ViewInTV(treeview,treeNode);
  end;

function tTrie.LoadFromFile(FileName:string):boolean;
var
    str: string;
  begin
    AssignFile(f,FileName);
    reset(f);
    Clear;
    result:=true;
    while not eof(f) and result do
    begin
      readln(f,str);
      str:=Trim(str);

      if str<>'' then
        if tNode.CheckWord(str) then
          Add(str)

        else
          result:=false;
    end;

    if not result then
      begin
        clear;
        showmessage('В файле обнаружены недопустимые символы');
      end;
      closeFile(f);
  end;

procedure TTrie.Clear;
  begin
    FreeandNil(FRoot);
  end;

procedure TTrie.Task(litter:string);
var found:boolean;
  begin
    found:=false;
    FRoot.Task('',litter, found)
  end;

end.
