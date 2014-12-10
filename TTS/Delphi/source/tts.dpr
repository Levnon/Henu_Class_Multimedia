program tts;

uses
  Forms,
  mian in 'mian.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TTS';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
