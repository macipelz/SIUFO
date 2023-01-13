unit Uorder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  Torder = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button5: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  order: Torder;
  id, idjadi, mulai : String;

implementation

uses dm, StrUtils, Ulaporan;

{$R *.dfm}

procedure nol;
begin
  with order do
    begin
      Edit2.Clear;
      Edit3.Clear;
    end
end;

procedure aktif;
begin
  with order do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      ComboBox1.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with order do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      ComboBox1.Enabled:=False;
    end
end;

procedure Torder.ComboBox1Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_sparepart where';
      ZEof.SQL.Add('no like'+QuotedStr('%'+ComboBox1.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      if ZEof.RecordCount>0 then
        Edit2.Text:=ZEof['nama_sparepart']
      else
        Edit2.Clear
    end
end;

procedure Torder.FormShow(Sender: TObject);
begin
  nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  Button5.Enabled:=False;
  Edit1.Clear;
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZData.SQL.Clear;
      ZData.SQL.Text:='select * from tb_pesansparepart';
      ZData.Active:=True;
      ZData.Open;
      Source1.DataSet:=ZData;
    end;
  Button1.Caption:='TAMBAH';
  with dm1 do
  begin
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_sparepart where no!='+'"SP-0000/00"'+' and no!= '+'"SP-0000/17"'+'order by no desc';
      ZEof.Active:=True;
      ZEof.Open;
      Combobox1.Items.Clear;
      while not ZEof.Eof do
      begin
          ComboBox1.Items.Add(ZEof['no']);
          ZEof.Next;
      end;
  end;
end;

procedure Torder.Button1Click(Sender: TObject);
begin
  if Button1.Caption='TAMBAH' then
    begin
      Button1.Caption:='BATAL';
      aktif;
      Button2.Enabled:=True;
      nol;
      mulai:='0000';
      dm1.ZCon1.Connected:=True;
      dm1.ZData.SQL.Clear;
      dm1.ZData.SQL.Text:='select * from tb_pesansparepart order by no_pesan asc';
      dm1.ZData.Active:=True;
      dm1.ZData.Open;
      if dm1.ZData.RecordCount > 0 then
        begin
          dm1.ZData.Last;
          id:=dm1.ZData.FieldByname('no_pesan').AsString;
          idjadi:=MidStr(id,4,4);
          id:=Inttostr(Strtoint(idjadi)+1);
          idjadi:='PS-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='PS-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='TAMBAH';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      Button5.Enabled:=False;
      nol;
      Edit1.Clear;
    end
end;

procedure Torder.DBGrid1DblClick(Sender: TObject);
begin
    aktif;
    Edit1.ReadOnly:=True;
    Button3.Enabled:=True;
    Button4.Enabled:=True;
    Button5.Enabled:=True;
    Button2.Enabled:=False;
    Button1.Caption:='BATAL';
    with dm1 do
    begin
      Edit1.Text:=ZData['no_pesan'];
      Combobox1.Text:=ZData['no'];
      Edit2.Text:=ZData['nama_sparepart'];
      Edit3.Text:=ZData['jumlah'];
    end
end;

procedure Torder.Button2Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text='') or (Edit3.Text='') then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else if dm1.ZData.Locate('no_pesan',Edit1.Text,[]) then
    begin
      MessageDlg('ID sudah terdaftar...',mtInformation,[mbOK],0);
      Edit1.Clear;
      Edit1.SetFocus;
    end
  else
  with dm1 do
    begin
      ZData.Append;
      ZData['no_pesan']:=Edit1.Text;
      ZData['nama_sparepart']:=Edit2.Text;
      ZData['jumlah']:=Edit3.Text;
      ZData['no']:=Combobox1.Text;
      ZData.Post;
      MessageDlg('Data anda sudah tersimpan',mtInformation,[mbOK],0);
      nol;
      Edit1.Clear;
    end
end;

procedure Torder.Button3Click(Sender: TObject);
begin
  with dm1 do
  begin
    ZData.Edit;
    ZData['nama_sparepart']:=Edit2.Text;
    ZData['jumlah']:=Edit3.Text;
    ZData['no']:=Combobox1.Text;
    ZData.Post;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Torder.Button4Click(Sender: TObject);
var
  x : String;
begin
try
  with dm1 do
  begin
    x := ZData['no_pesan'];
    if MessageDlg('Yakin hapus NO PESAN '+x+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
    ZData.Delete;
  end;
  Button1.Click;
except
  DBGrid1.DataSource:=dm1.Source1;
  MessageDlg('Data gagal dihapus...'+#13+'Masih terjalin antar data..!',mtError,[mbOK],0);
end
end;

procedure Torder.Button5Click(Sender: TObject);
begin
  dm1.ZReport.SQL.Clear;
  dm1.ZReport.SQL.Add('SELECT * FROM tb_pesansparepart');
  dm1.ZReport.SQL.Add('where no_pesan like "'+Edit1.Text+'"');
  dm1.ZReport.Active:=True;
  dm1.ZReport.Open;
  if dm1.ZReport.RecordCount > 0 then
    laporan.QuickRepOrder.Preview
  else
    MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

end.
