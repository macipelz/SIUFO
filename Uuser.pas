unit Uuser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls;

type
  Tuser = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    Button5: TButton;
    Label6: TLabel;
    Edit5: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  user: Tuser;

implementation

uses menu, dm;

{$R *.dfm}

procedure Tuser.FormShow(Sender: TObject);
begin
  TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=False;
end;

procedure Tuser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  home.Enabled:=True;
end;

procedure kosongkan;
begin
  user.Edit1.Clear;
  user.Edit2.Clear;
  user.ComboBox1.Text:='';
end;

procedure Tuser.TabSheet1Show(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZData.SQL.Clear;
    ZData.SQL.Text:='select * from tb_user';
    ZData.Active:=True;
    ZData.Open;
    Source1.DataSet:=ZData;
  end;
end;

procedure Tuser.DBGrid1CellClick(Column: TColumn);
begin
if dm1.ZData.RecordCount = 0 then
  MessageDlg('Data masih kosong',mtError,[mbOK],0)
else
  begin
    with dm1 do
    begin
      Edit1.Text:=ZData['user'];
      Edit2.Text:=ZData['password'];
      ComboBox1.Text:=ZData['level'];
    end;
    Button2.Caption:='BATAL';
    Button3.Enabled:=True;
    Button4.Enabled:=True;
  end
end;

procedure Tuser.Button2Click(Sender: TObject);
begin
  if Button2.Caption='SIMPAN' then
  begin
  if (Edit1.Text = '') or (Edit2.Text='') or (ComboBox1.Text='') then
  MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else
  with dm1 do
    begin
    ZData.Append;
    ZData.FieldByName('user').Value:=Edit1.Text;
    ZData.FieldByName('password').Value:=Edit2.Text;
    ZData.FieldByName('level').Value:=ComboBox1.Text;
    ZData.Post;
    MessageDlg('Simpan Data Berhasil',mtInformation,[mbOK],0);
    kosongkan;
    end;
  end
  else
    begin
      Button2.Caption:='SIMPAN';
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      kosongkan;
    end
end;

procedure Tuser.Button3Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text='') or (ComboBox1.Text='') then
  MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else
  with dm1 do
  begin
    ZData.Edit;
    ZData.FieldByName('user').Value:=Edit1.Text;
    ZData.FieldByName('password').Value:=Edit2.Text;
    ZData.FieldByName('level').Value:=ComboBox1.Text;
    ZData.Post;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
    kosongkan;
    Button2.Click;
  end;
end;

procedure Tuser.Button4Click(Sender: TObject);
var
q : String;
begin
  with dm1 do
  begin
    q := ZData.FieldList[0].AsString;
    if MessageDlg('Yakin hapus User '+q+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
    ZData.Delete;
    kosongkan;
    Button2.Click;
  end;
end;

procedure Tuser.TabSheet2Show(Sender: TObject);
begin
Edit4.Clear;
Edit5.Clear;
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZLogin.SQL.Clear;
      ZLogin.SQL.Text:='select * from tb_user where';
      ZLogin.SQL.Add('user like'+QuotedStr(home.Label1.Caption));
      ZLogin.Active:=True;
      ZLogin.Open;
      Edit3.Text:=ZLogin.FieldList[0].AsString;
    end
end;

procedure Tuser.Button1Click(Sender: TObject);
begin
  if (Edit4.Text='') or (Edit5.Text='') then
    MessageDlg('Password Tidak Boleh Kosong !',mtInformation,[mbOK],0)
  else
  if Edit4.Text = Edit5.Text then
    begin
      dm1.ZLogin.Edit;
      dm1.ZLogin.FieldList[0].AsString:=Edit3.Text;
      dm1.ZLogin.FieldList[1].AsString:=Edit4.Text;
      dm1.ZLogin.Post;
      MessageDlg('Password Login sudah diubah...'+#13+'Ingat Username dan Password Anda',mtWarning,[mbOK],0);
      Button5.Click;
    end
  else
    MessageDlg('Pengulangan Password salah...'+#13+'masukkan kembali Password Anda',mtInformation,[mbOK],0);
    Edit4.Clear;
    Edit5.Clear;
    Edit4.SetFocus;
end;

procedure Tuser.Button5Click(Sender: TObject);
begin
  Edit4.Clear;
  Edit5.Clear;
  Close;
end;


procedure Tuser.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
 Key := #0;
 PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tuser.FormCreate(Sender: TObject);
begin
keyPreview := True;
end;

end.
