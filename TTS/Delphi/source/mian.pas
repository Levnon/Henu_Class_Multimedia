unit mian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ShellAPI, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure mainpro;
var i,n,aim:longint;
    s:ansistring;
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
    ShellExecute(0, 'open', 'voice.vbs', '', '', SW_SHOWNORMAL);
    {强行退出}
    halt;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
    Label1.Caption :='这是一个TTS软件，用于自动随机播放一句话。'+chr(13)+'如果您看到了这些文字，请……'+chr(13)+'在“WORD.txt”文件中输入要朗读的文字，每行一条。'+chr(13)+'本程序会每次随机朗读一行。'+chr(13)+'程序设计：小金鱼儿 '+chr(13)+'jinyu121@126.com  '+chr(13)+'http://www.jinyu121.tk'  ;
    mainpro;
end;

end.
