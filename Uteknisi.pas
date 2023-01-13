unit Uteknisi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls;

type
  Tteknisi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  teknisi: Tteknisi;
  id, idjadi, mulai : String;

implementation

uses dm, StrUtils;

{$R *.dfm}

procedure nol;
begin
  with teknisi do
    begin
      Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
    end
end;

procedure aktif;
begin
  with teknisi do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      Edit4.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with teknisi do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      Edit4.Enabled:=False;
    end
end;


procedure Tteknisi.FormShow(Sender: TObject);
begin
  nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  Edit1.Clear;
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZData.SQL.Clear;
      ZData.SQL.Text:='select * from tb_teknisi';
      ZData.Active:=True;
      ZData.Open;
      Source1.DataSet:=ZData;
    end;
  Button1.Caption:='DAFTAR';
end;

procedure Tteknisi.DBGrid1DblClick(Sender: TObject);
begin
if dm1.ZData.RecordCount = 0 then
  MessageDlg('Data masih kosong',mtError,[mbOK],0)
else
  begin
    aktif;
    Edit2.SetFocus;
    Edit1.ReadOnly:=True;
    Button3.Enabled:=True;
    Button4.Enabled:=True;
    Button2.Enabled:=False;
    Button1.Caption:='BATAL';
    with dm1 do
    begin
      Edit1.Text:=ZData['id_teknisi'];
      Edit2.Text:=ZData['nama_teknisi'];
      Edit3.Text:=ZData['hp_teknisi'];
      Edit4.Text:=ZData['alamat'];
    end
  end
end;

procedure Tteknisi.Button1Click(Sender: TObject);
begin
  if Button1.Caption='DAFTAR' then
    begin
      Button1.Caption:='BATAL';
      aktif;
      Edit2.SetFocus;
      Button2.Enabled:=True;
      nol;
      mulai:='0000';
      dm1.ZCon1.Connected:=True;
      dm1.ZData.SQL.Clear;
      dm1.ZData.SQL.Text:='select * from tb_teknisi order by id_teknisi asc';
      dm1.ZData.Active:=True;
      dm1.ZData.Open;
      if dm1.ZData.RecordCount > 0 then
        begin
          dm1.ZData.Last;
          id:=dm1.ZData.FieldByname('id_teknisi').AsString;
          idjadi:=MidStr(id,4,4);
          id:=Inttostr(Strtoint(idjadi)+1);
          idjadi:='TK-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='TK-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='DAFTAR';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      nol;
      Edit1.Clear;
    end
end;

procedure Tteknisi.Button2Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text='') or (Edit3.Text='') or (Edit4.Text='')then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else if dm1.ZData.Locate('id_teknisi',Edit1.Text,[]) then
    begin
      MessageDlg('ID sudah terdaftar...',mtInformation,[mbOK],0);
      Edit1.Clear;
      Edit1.SetFocus;
    end
  else
  with dm1 do
    begin
      ZData.Append;
      ZData['id_teknisi']:=Edit1.Text;
      ZData['nama_teknisi']:=Edit2.Text;
      ZData['hp_teknisi']:=Edit3.Text;
      ZData['alamat']:=Edit4.Text;
      ZData.Post;
      MessageDlg('Data anda sudah tersimpan',mtInformation,[mbOK],0);
      nol;
      Edit1.Clear;
      Button1.Click;
    end
end;

procedure Tteknisi.Button3Click(Sender: TObject);
begin
  with dm1 do
  begin
    ZData.Edit;
    ZData['nama_teknisi']:=Edit2.Text;
    ZData['hp_teknisi']:=Edit3.Text;
    ZData['alamat']:=Edit4.Text;
    ZData.Post;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Tteknisi.Button4Click(Sender: TObject);
var
  x : String;
begin
try
  with dm1 do
  begin
    x := ZData['id_teknisi'];
    if MessageDlg('Yakin hapus ID TEKNISI '+x+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
    ZData.Delete;
  end;
  Button1.Click;
except
  DBGrid1.DataSource:=dm1.Source1;
  MessageDlg('Data gagal dihapus...'+#13+'Masih terjalin antar data..!',mtError,[mbOK],0);
end
end;


procedure Tteknisi.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
 Key := #0;
 PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tteknisi.FormCreate(Sender: TObject);
begin
keyPreview := True;
end;

end.
