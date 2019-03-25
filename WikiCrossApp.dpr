program WikiCrossApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  wikicross in 'wikicross.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
