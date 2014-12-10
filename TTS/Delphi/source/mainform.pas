unit mainform; {$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Process;
type
  { TForm1 }
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 
var
  Form1: TForm1;
implementation
{$R *.lfm}
{ TForm1 }
procedure main;
var i,n,aim:longint;
    s:ansistring;
    AProcess: TProcess;
    path:ansistring;
begin
    {读入文本文档并统计行数}
assign(input,'word.txt');
assign(output,'voice.vbs');
reset(input);
    n:=0;
    while not eof do
        begin
            readln(input,s);
            inc(n);
        end;
close(input);
    {随机朗读一行}
reset(input);
rewrite(output);
    randomize;
    if (n<>0) then
        begin
            aim:=0;
            while (aim=0) do
                aim:=random(n+1);
            for i:=1 to aim do
                readln(input,s);
            write('CreateObject("SAPI.SpVoice").speak "');
            for i:=1 to length(s) do
                if s[i]='"' then write(output,' ')
            else
                write(output,s[i]);
            writeln(output,'"');
        end;
close(input);
close(output);
    {开始朗读}
    ExtractFilePath(path);
    path:='cmd.exe /c '+path+'voice.vbs';
    AProcess := TProcess.Create(nil);
    AProcess.CommandLine := path;
    AProcess.Execute;
    AProcess.Free;
    {强行退出}
    halt;
end;

procedure TForm1.FormCreate(Sender: TObject);
    begin
        main;
        halt;
    end;
end.
