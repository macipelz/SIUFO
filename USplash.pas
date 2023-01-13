unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, jpeg;

type
  TFSplash = class(TForm)
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

uses menu, Ulogin, dm;



{$R *.dfm}

procedure TFSplash.Timer1Timer(Sender: TObject);
begin
if progressbar1.Position = 100 then
  begin
    timer1.Enabled :=False;
    Fsplash.Hide;
    home.Show;
    home.Enabled:=False;
    login.Show;
  end
else
  begin
    progressbar1.Position := progressbar1.Position + 10;
    if (ProgressBar1.Position > 0) and (ProgressBar1.Position < 11)then
        Label1.Caption:='Sistem';
    if (ProgressBar1.Position > 11) and (ProgressBar1.Position < 21)then
        Label1.Caption:='Informasi';
    if (ProgressBar1.Position > 21) and (ProgressBar1.Position < 31)then
        Label1.Caption:='Pengelolaan';
    if (ProgressBar1.Position > 31) and (ProgressBar1.Position < 41)then
        Label1.Caption:='Data';
    if (ProgressBar1.Position > 41) and (ProgressBar1.Position < 51)then
        Label1.Caption:='Layanan';
    if (ProgressBar1.Position > 51) and (ProgressBar1.Position < 61)then
        Label1.Caption:='Perbaikan';
    if (ProgressBar1.Position > 61) and (ProgressBar1.Position < 71)then
        Label1.Caption:='pada';
    if (ProgressBar1.Position > 71) and (ProgressBar1.Position < 81)then
        Label1.Caption:='UFO Elektronik';
    if (ProgressBar1.Position > 81) and (ProgressBar1.Position < 100)then
        Label1.Caption:='Oleh Hairullah';
  end;
end;

end.
