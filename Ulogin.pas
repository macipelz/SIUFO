unit Ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tlogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login: Tlogin;

implementation

uses menu, dm;

{$R *.dfm}

procedure Tlogin.FormShow(Sender: TObject);
begin
Button2.Click;
end;

procedure Tlogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure Tlogin.Button2Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit1.SetFocus;
end;

procedure Tlogin.Button1Click(Sender: TObject);
begin
try
with dm1 do
  begin
  ZCon1.Connected:=True;
  ZLogin.Active:=True;
  with ZLogin do
    begin
    SQL.Clear;
    SQL.Add('select * from tb_user where user ='+QuotedStr(edit1.Text)+'and password ='+QuotedStr(edit2.Text));
    Open;
    if ZLogin.RecordCount=0 then
      begin
      Application.MessageBox('Username atau Password salah !','Informasi',MB_OK or MB_ICONINFORMATION);
      Edit1.Clear;
      Edit2.Clear;
      Edit1.SetFocus;
      end
    else
      begin
      if ZLogin.FieldList[2].AsString = 'Admin' then
        begin
        login.Hide;
        with home do
          begin
          Show;
          Enabled:=True;
          Label1.Caption:=ZLogin.FieldList[0].AsString;
          StatusBar1.Panels[2].Text:='User : '+Zlogin.FieldList[0].AsString;
          StatusBar1.Panels[3].Text:='Level : '+Zlogin.FieldList[2].AsString;
          DataLogin1.Visible:=True;
          Logout1.Visible:=True;
          end
        end
      else if Zlogin.FieldList[2].AsString = 'Operator' then
        begin
        login.Hide;
        with home do
          begin
          Show;
          Enabled:=True;
          Label1.Caption:=Zlogin.FieldList[0].AsString;
          StatusBar1.Panels[2].Text:='User : '+ZLogin.FieldList[0].AsString;
          StatusBar1.Panels[3].Text:='Level : '+Zlogin.FieldList[2].AsString;
          Logout1.Visible:=True;
          end
        end
      else
      MessageDlg('level tidak dikenal',mtWarning,[mbOK],0)
      end
    end
  end
except
on salah :Exception do
MessageDlg('Koneksi ke Database Gagal ... Aktifkan MySQL Server !'+#13+salah.Message,mtError,[mbOK],0);
end;
end;

//fungsi tekan enter pindah kolom
procedure Tlogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
 Key := #0;
 PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tlogin.FormCreate(Sender: TObject);
begin
keyPreview := True;
end;
//akhir coding fungsi tekan enter pindah kolom


end.
