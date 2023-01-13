unit Upart2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls;

type
  Tpartmasuk = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  partmasuk: Tpartmasuk;

implementation

uses dm;

{$R *.dfm}

procedure nol;
begin
  with partmasuk do
    begin
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      DateTimePicker1.Date:=now;
    end
end;

procedure aktif;
begin
  with partmasuk do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      ComboBox1.Enabled:=True;
      DateTimePicker1.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with partmasuk do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      ComboBox1.Enabled:=False;
      DateTimePicker1.Enabled:=False;
    end
end;

procedure Tpartmasuk.FormShow(Sender: TObject);
begin
  //nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZData.SQL.Clear;
      ZData.SQL.Text:='select * from tb_sparepartmasuk';
      ZData.Active:=True;
      ZData.Open;
      Source1.DataSet:=ZData;
    end;
  Button1.Caption:='TAMBAH';
  with dm1 do
  begin
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_pesansparepart';
      ZEof.Active:=True;
      ZEof.Open;
      Combobox1.Items.Clear;
      while not ZEof.Eof do
      begin
          ComboBox1.Items.Add(ZEof['no_pesan']);
          ZEof.Next;
      end;
  end;
end;

procedure Tpartmasuk.ComboBox1Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_pesansparepart where';
      ZEof.SQL.Add('no_pesan like'+QuotedStr(ComboBox1.Text));
      ZEof.Active:=True;
      ZEof.Open;
      if ZEof.RecordCount>0 then
        begin
          Edit1.Text:=ZEof.Fields[1].AsString;
          Edit2.Text:=ZEof.Fields[2].AsString;
          Edit3.Text:=ZEof.Fields[3].AsString;
        end
      else
        begin
          Edit1.Clear;
          Edit2.Clear;
          Edit3.Clear;
        end;
    end
end;

procedure Tpartmasuk.Button1Click(Sender: TObject);
begin
  if Button1.Caption='TAMBAH' then
    begin
      Button1.Caption:='BATAL';
      aktif;
      Button2.Enabled:=True;
      nol;
    end
  else
    begin
      Button1.Caption:='TAMBAH';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      nol;
    end
end;

procedure Tpartmasuk.DBGrid1DblClick(Sender: TObject);
begin
    aktif;
    Button3.Enabled:=True;
    Button4.Enabled:=True;
    Button2.Enabled:=False;
    Button1.Caption:='BATAL';
    with dm1 do
    begin
      Edit1.Text:=ZData['no'];
      Combobox1.Text:=ZData['no_pesan'];
      Edit2.Text:=ZData['nama_sparepart'];
      Edit3.Text:=ZData['jumlah'];
      DateTimePicker1.Date:=ZData['tanggal'];
    end
end;

procedure Tpartmasuk.Button2Click(Sender: TObject);
begin
    with dm1 do
    begin
     ZStok.Active:=False;
     ZStok.SQL.Text:='select * from tb_sparepart';
     ZStok.Active:=True;
     if ZStok.Locate('no',Edit1.Text,[]) then
        begin
          ZStok.Edit;
          ZStok.FieldByName('stok').AsInteger:=ZStok.FieldByName('stok').AsInteger+StrToInt(Edit3.Text);
          ZStok.Post;
        end;
    end;
  if (Edit1.Text = '') or (Edit2.Text='') or (Edit3.Text='') then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else if dm1.ZData.Locate('no_pesan',ComboBox1.Text,[]) then
    begin
      MessageDlg('No Order sudah terdaftar...',mtInformation,[mbOK],0);
    end
  else
  with dm1 do
    begin
      ZData.Append;
      ZData['no']:=Edit1.Text;
      ZData['nama_sparepart']:=Edit2.Text;
      ZData['jumlah']:=Edit3.Text;
      ZData['no_pesan']:=Combobox1.Text;
      ZData['tanggal']:=DateTimePicker1.Date;
      ZData.Post;
      MessageDlg('Data anda sudah tersimpan',mtInformation,[mbOK],0);
      nol;
      Button1.Click;
    end
end;

procedure Tpartmasuk.Button3Click(Sender: TObject);
begin
  with dm1 do
    begin
     ZStok.Active:=False;
     ZStok.SQL.Text:='select * from tb_sparepart';
     ZStok.Active:=True;
     if ZStok.Locate('no',Edit1.Text,[]) then
        begin
          ZStok.Edit;
          ZStok.FieldByName('stok').AsInteger:=ZStok.FieldByName('stok').AsInteger-ZData.FieldByName('jumlah').AsInteger+StrToInt(Edit3.Text);
          ZStok.Post;
        end;
    end;
  with dm1 do
  begin
    ZData.Edit;
    ZData['nama_sparepart']:=Edit2.Text;
    ZData['jumlah']:=Edit3.Text;
    ZData['no']:=Edit1.Text;
    ZData['no_pesan']:=ComboBox1.Text;
    ZData['tanggal']:=DateTimePicker1.Date;
    ZData.Post;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Tpartmasuk.Button4Click(Sender: TObject);
var
  x : String;
begin
  with dm1 do
    begin
     ZStok.Active:=False;
     ZStok.SQL.Text:='select * from tb_sparepart';
     ZStok.Active:=True;
     if ZStok.Locate('no',Edit1.Text,[]) then
        begin
          ZStok.Edit;
          ZStok.FieldByName('stok').AsInteger:=ZStok.FieldByName('stok').AsInteger-ZData.FieldByName('jumlah').AsInteger;
          ZStok.Post;
        end;
    end;
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

end.
