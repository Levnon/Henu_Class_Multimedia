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
    {�����ı��ĵ���ͳ������}
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
    {����ʶ�һ��}
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
    {��ʼ�ʶ�}
    ShellExecute(0, 'open', 'voice.vbs', '', '', SW_SHOWNORMAL);
    {ǿ���˳�}
    halt;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
    Label1.Caption :='����һ��TTS����������Զ��������һ�仰��'+chr(13)+'�������������Щ���֣��롭��'+chr(13)+'�ڡ�WORD.txt���ļ�������Ҫ�ʶ������֣�ÿ��һ����'+chr(13)+'�������ÿ������ʶ�һ�С�'+chr(13)+'������ƣ�С����� '+chr(13)+'jinyu121@126.com  '+chr(13)+'http://www.jinyu121.tk'  ;
    mainpro;
end;

end.
