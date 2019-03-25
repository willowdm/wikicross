unit wikicross;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.WebBrowser;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TargetStr: string;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm1.Button1Click(Sender: TObject);
begin
   Timer1.Enabled:= False;
   WebBrowser1.Navigate('https://ru.wikipedia.org/wiki/���������:���������_��������/');
   Button1.Enabled:=False;
   ProgressBar1.Max:= 30;
   ProgressBar1.Value:= 30;
   Button1.Text:= '��������� ������';
   Timer1.Enabled:= True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Value := ProgressBar1.Value - 1;

  if ((ProgressBar1.Value = 0) and (Button1.Text = '��������� ������')) then
  begin
    TargetStr:= WebBrowser1.URL;
    Button1.Enabled:=False;
    Button1.Text:= '������� ������';
    ProgressBar1.Max:= 500;
    ProgressBar1.Value:= 500;
    WebBrowser1.Navigate('https://ru.wikipedia.org/wiki/���������:���������_��������/');
    Timer2.Enabled:= True;
  end;

  if ((ProgressBar1.Value = 0) and (Button1.Text = '������� ������')) then
  begin
    Timer1.Enabled:= False;
    Button1.Enabled:= True;
    Button1.Text:= '�������';
    ProgressBar1.Max:= 30;
    ProgressBar1.Value:= 30;
    ShowMessage('����� �������');
    Timer2.Enabled:= False;
  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if (WebBrowser1.URL = TargetStr) then
  begin
    Timer1.Enabled:= False;
    Timer2.Enabled:= False;
    Button1.Enabled:= True;
    Button1.Text:= '�������';
    ShowMessage('�����');
  end;
end;

end.
