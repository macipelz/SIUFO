unit Uservis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons;

type
  Tservis = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit5: TEdit;
    Edit6: TEdit;
    ComboBox3: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit7: TEdit;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Button4: TButton;
    Button3: TButton;
    L: TLabel;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    Edit9: TEdit;
    Label12: TLabel;
    Edit10: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  servis: Tservis;
  id, idjadi, mulai : String;

implementation

uses dm, StrUtils, Ulaporan;

{$R *.dfm}

procedure nol;
begin
  with servis do
    begin
      Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Edit5.Clear;
      Edit6.Clear;
      Edit7.Clear;
      Edit8.Clear;
      Edit9.Text:='Tidak Ganti Sparepart';
      Edit10.Text:='Tidak Ganti Sparepart';
      ComboBox1.Text:='';
      ComboBox2.Text:='';
      ComboBox3.Text:=''; 
      ComboBox4.Text:='';
      ComboBox5.Text:='';
      DateTimePicker1.Date:=Now;
    end
end;

procedure aktif;
begin
  with servis do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      Edit4.Enabled:=True;
      Edit5.Enabled:=True;
      Edit6.Enabled:=True;
      Edit7.Enabled:=True;
      Edit9.Enabled:=True;
      Edit10.Enabled:=True;
      ComboBox1.Enabled:=True;
      ComboBox2.Enabled:=True;
      ComboBox3.Enabled:=True;
      ComboBox4.Enabled:=True;
      ComboBox5.Enabled:=True;
      BitBtn1.Enabled:=True;
      BitBtn2.Enabled:=True;
      BitBtn3.Enabled:=True;
      BitBtn4.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with servis do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      Edit4.Enabled:=False;
      Edit5.Enabled:=False;
      Edit6.Enabled:=False;
      Edit7.Enabled:=False;
      Edit9.Enabled:=False;
      Edit10.Enabled:=False;
      ComboBox1.Enabled:=False;
      ComboBox2.Enabled:=False;
      ComboBox3.Enabled:=False;
      ComboBox4.Enabled:=False;
      ComboBox5.Enabled:=False;
      BitBtn1.Enabled:=False;
      BitBtn2.Enabled:=False;
      BitBtn3.Enabled:=False;
      BitBtn4.Enabled:=False;
      Label11.Visible:=False;
      ComboBox4.Visible:=False;
      Edit9.Visible:=False;
      Label12.Visible:=False;
      ComboBox5.Visible:=False;
      Edit10.Visible:=False;
      BitBtn4.Visible:=False;
      BitBtn3.Visible:=False;
    end
end;

procedure data_servis;
begin
  with servis do
    begin
      dm1.ZCon1.Connected:=True;
      dm1.ZData.SQL.Clear;
      //ZData.SQL.Text:='select * from tb_servis';
      dm1.ZData.SQL.Add('SELECT * FROM (SELECT data_service. * , tb_sparepart.nama_sparepart FROM (SELECT data. * , tb_konsumen.nama');
      dm1.ZData.SQL.Add('FROM (SELECT tb_servis. * , tb_barang.nama_barang FROM tb_servis');
      dm1.ZData.SQL.Add('LEFT JOIN tb_barang ON tb_servis.kode_barang = tb_barang.kode_barang ) AS data');
      dm1.ZData.SQL.Add('LEFT JOIN tb_konsumen ON data.kode_konsumen = tb_konsumen.kode_konsumen ) AS data_service');
      dm1.ZData.SQL.Add('LEFT JOIN tb_sparepart ON data_service.no = tb_sparepart.no ) AS Dt');
      dm1.ZData.SQL.Add('LEFT JOIN tb_teknisi ON Dt.id_teknisi = tb_teknisi.id_teknisi');
      dm1.ZData.Active:=True;
      dm1.ZData.Open;
      dm1.Source1.DataSet:=dm1.ZData;
    end
end;

procedure Tservis.FormShow(Sender: TObject);
begin
  data_servis;
  nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  Button5.Enabled:=False;
  Edit1.Clear;
  with dm1 do
    begin
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_teknisi';
      ZEof.Active:=True;
      ZEof.Open;
      combobox1.Items.Clear;
      while not ZEof.Eof do
        begin
          ComboBox1.Items.Add(ZEof['id_teknisi']);
          ZEof.Next;
        end;

      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_barang where keterangan='+'"Belum Diservis"'+' order by kode_barang desc';
      ZEof.Active:=True;
      ZEof.Open;
      Combobox2.Items.Clear;
      while not ZEof.Eof do
      begin
          ComboBox2.Items.Add(ZEof['kode_barang']);
          ZEof.Next;
      end;

      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_sparepart where no!='+'"SP-0000/00"';
      ZEof.Active:=True;
      ZEof.Open;
      Combobox3.Items.Clear;
      while not ZEof.Eof do
      begin
          ComboBox3.Items.Add(ZEof['no']);
          ComboBox4.Items.Add(ZEof['no']);
          ComboBox5.Items.Add(ZEof['no']);
          ZEof.Next;
      end;
    end;
  Button1.Caption:='DAFTAR';
  DateTimePicker1.Date:=now;
end;

procedure Tservis.ComboBox1Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_teknisi where';
      ZEof.SQL.Add('id_teknisi like'+QuotedStr('%'+ComboBox1.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      if ZEof.RecordCount>0 then
        Edit7.Text:=ZEof['nama_teknisi']
      else
        Edit7.Clear;
    end
end;

procedure Tservis.ComboBox2Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_barang';
      ZEof.SQL.Add('LEFT JOIN tb_konsumen ON tb_barang.kode_konsumen = tb_konsumen.kode_konsumen');
      ZEof.SQL.Add('where kode_barang like'+QuotedStr('%'+ComboBox2.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      Edit2.Text:=ZEof['nama_barang'];
      Edit3.Text:=ZEof['kode_konsumen'];
      Edit5.Text:=ZEof['nama'];
      Edit8.Text:=ZEof['no_seri'];
      Label8.Caption:=ZEof['servis'];
      if Label8.Caption='Penitipan Servis' then
        begin
          Combobox3.Text:='SP-0000/00';
          Edit6.Text:='Tidak Ganti Sparepart';
          Combobox3.Enabled:=false;
          Combobox4.Text:='SP-0000/00';
          Edit9.Text:='Tidak Ganti Sparepart';
          Combobox4.Enabled:=false;
          Combobox5.Text:='SP-0000/00';
          Edit10.Text:='Tidak Ganti Sparepart';
          Combobox5.Enabled:=false;
        end else Combobox3.Enabled:=true;
    end
end;

procedure Tservis.ComboBox3Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_sparepart where';
      ZEof.SQL.Add('no like'+QuotedStr('%'+ComboBox3.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      if ZEof.RecordCount>0 then
        Edit6.Text:=ZEof['nama_sparepart']
      else
        Edit6.Clear
    end
end;

procedure Tservis.Button1Click(Sender: TObject);
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
      dm1.ZQAutoNo.SQL.Clear;
      dm1.ZQAutoNo.SQL.Text:='select * from tb_servis';
      dm1.ZQAutoNo.Active:=True;
      dm1.ZQAutoNo.Open;
      if dm1.ZQAutoNo.RecordCount > 0 then
        begin
          dm1.ZQAutoNo.Last;
          id:=dm1.ZQAutoNo.FieldByname('no_servis').AsString;
          idjadi:=MidStr(id,4,4);
          id:=IntToStr(Strtoint(idjadi)+1);
          idjadi:='SV-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='SV-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='DAFTAR';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      Button5.Enabled:=False;
      nol;
      Edit1.Clear;
    end
end;

procedure Tservis.Button2Click(Sender: TObject);
begin
  with dm1 do
    begin
     ZStok.Active:=False;
     ZStok.SQL.Text:='select * from tb_sparepart';
     ZStok.Active:=True;
     ZBarang.Active:=False;
     ZBarang.SQL.Text:='select * from tb_barang';
     ZBarang.Active:=True;
     if ZStok.Locate('no',ComboBox3.Text,[]) then
        begin
          Label10.Caption:=ZStok.FieldByName('stok').AsString;
          if (StrtoInt(Label10.Caption)<1) then
            Label10.Caption:='0'
          else
          begin
            ZStok.Edit;
            ZStok.FieldByName('stok').AsInteger:=ZStok.FieldByName('stok').AsInteger-StrToInt(L.Caption);
            ZStok.Post;
          end;
        end;
     if ZBarang.Locate('kode_barang',ComboBox2.Text,[]) then
        begin
          if ComboBox3.Text='SP-0000/17' then
          begin
            ZBarang.Edit;
            ZBarang.FieldByName('keterangan').AsString:='Gagal Diservis';
            ZBarang.FieldByName('teknisi').AsString:=Edit7.Text;
            ZBarang.Post;
          end
          else
          begin
            ZBarang.Edit;
            ZBarang.FieldByName('keterangan').AsString:='Sudah Diservis';
            ZBarang.FieldByName('teknisi').AsString:=Edit7.Text;
            ZBarang.Post;
          end;
        end;
    end;
  if (Edit1.Text ='') or (Edit4.Text='') or (ComboBox1.Text='') or (ComboBox2.Text='') or (ComboBox3.Text='') then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else
  if (StrtoInt(Label10.Caption)<1) then
      MessageDlg('Sparepart sedang Kosong !',mtInformation,[mbOK],0)
  else
    begin
      try
      dm1.ZQCRUD.SQL.Clear;
      dm1.ZQCRUD.SQL.Text:= 'insert into tb_servis (no_servis,kode_barang,no_seri,id_teknisi,kerusakan, no, kode_konsumen, tanggal, spr2, spr3)'+
                        'value ('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(ComboBox2.Text)+
                        ','+QuotedStr(Edit8.Text)+
                        ','+QuotedStr(ComboBox1.Text)+
                        ','+QuotedStr(Edit4.Text)+
                        ','+QuotedStr(ComboBox3.Text)+
                        ','+QuotedStr(Edit3.Text)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+
                        ','+QuotedStr(Edit9.Text)+
                        ','+QuotedStr(Edit10.Text)+')';
      dm1.ZQCRUD.ExecSQL;
      dm1.ZData.Refresh;
      MessageDlg('Data Berhasil di Input..!',mtInformation,[mbOK],0);
      Button1.Click;
      except
      MessageDlg('Data Sudah dientri..!',mtInformation,[mbOK],0);
      end
    end;
end;

procedure Tservis.Button3Click(Sender: TObject);
begin
  with dm1 do
  begin
    ZBarang.Active:=False;
        ZBarang.SQL.Text:='select * from tb_barang';
        ZBarang.Active:=True;
        if ZBarang.Locate('kode_barang',ComboBox2.Text,[]) then
        begin
          if ComboBox3.Text='SP-0000/17' then
          begin
            ZBarang.Edit;
            ZBarang.FieldByName('keterangan').AsString:='Gagal Diservis';
            ZBarang.FieldByName('teknisi').AsString:=Edit7.Text;
            ZBarang.Post;
          end
          else
          begin
            ZBarang.Edit;
            ZBarang.FieldByName('keterangan').AsString:='Sudah Diservis';
            ZBarang.FieldByName('teknisi').AsString:=Edit7.Text;
            ZBarang.Post;
          end;
        end;
    dm1.ZQCRUD.SQL.Clear;
    dm1.ZQCRUD.SQL.Text:= 'update tb_servis set kode_barang ='+QuotedStr(ComboBox2.Text)+
                        ', no_seri='+QuotedStr(Edit8.Text)+
                        ', id_teknisi='+QuotedStr(ComboBox1.Text)+
                        ', kerusakan='+QuotedStr(Edit4.Text)+
                        ', no='+QuotedStr(ComboBox3.Text)+
                        ', kode_konsumen='+QuotedStr(Edit3.Text)+
                        ', tanggal='+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+
                        'where no_servis ='+QuotedStr(Edit1.Text);
    dm1.ZQCRUD.ExecSQL;
    dm1.ZData.Refresh;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Tservis.Button4Click(Sender: TObject);
var
  x : String;
begin
  with dm1 do
    begin
     ZStok.Active:=False;
     ZStok.SQL.Text:='select * from tb_sparepart';
     ZStok.Active:=True;
     ZBarang.Active:=False;
     ZBarang.SQL.Text:='select * from tb_barang';
     ZBarang.Active:=True;
     if ZStok.Locate('no',ComboBox3.Text,[]) then
        begin
          ZStok.Edit;
          ZStok.FieldByName('stok').AsInteger:=ZStok.FieldByName('stok').AsInteger+StrToInt(L.Caption);
          ZStok.Post;
        end;
     if ZBarang.Locate('kode_barang',ComboBox2.Text,[]) then
        begin
          ZBarang.Edit;
          ZBarang.FieldByName('keterangan').AsString:='Belum Diservis';
          ZBarang.Post;
        end;
    end;
try
  with dm1 do
  begin
    x := ZData['no_servis'];
    if MessageDlg('Yakin hapus NO SERVIS '+x+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
      begin
        dm1.ZQCRUD.SQL.Clear;
        dm1.ZQCRUD.SQL.Text:='delete from tb_servis where no_servis ='+QuotedStr(Edit1.Text);
        dm1.ZQCRUD.ExecSQL;
        dm1.ZData.Refresh;
      end
  end;
  Button1.Click;
except
  DBGrid1.DataSource:=dm1.Source1;
  MessageDlg('Data gagal dihapus...'+#13+'Masih terjalin antar data..!',mtError,[mbOK],0);
end
end;

procedure Tservis.DBGrid1DblClick(Sender: TObject);
begin
if dm1.ZData.RecordCount = 0 then
  MessageDlg('Data masih kosong',mtError,[mbOK],0)
else
  begin
    aktif;
    Edit4.SetFocus;
    Edit1.ReadOnly:=True;
    Button3.Enabled:=True;
    Button4.Enabled:=True;
    Button5.Enabled:=True;
    Button2.Enabled:=False;
    Button1.Caption:='BATAL';
    with dm1 do
    begin
      Edit1.Text:=ZData['no_servis'];
      ComboBox2.Text:=ZData['kode_barang'];
      ComboBox1.Text:=ZData['id_teknisi'];
      Edit4.Text:=ZData['kerusakan'];
      ComboBox3.Text:=ZData['no'];
      Edit3.Text:=ZData['kode_konsumen'];
      DateTimePicker1.Date:=ZData['tanggal'];
      Edit2.Text:=ZData['nama_barang'];
      Edit5.Text:=ZData['nama'];
      Edit6.Text:=ZData['nama_sparepart'];
      Edit7.Text:=ZData['nama_teknisi'];
      Edit8.Text:=ZData['no_seri'];
      Label11.Visible:=True;
      Label12.Visible:=True;
      Combobox4.Visible:=True;
      Combobox4.Text:='SP-0003/17';
      Edit9.Visible:=True;
      Edit9.Text:=ZData['spr2'];
      Combobox5.Visible:=True;
      Combobox5.Text:='SP-0004/17';
      Edit10.Visible:=True;
      Edit10.Text:=ZData['spr3'];
    end;
    if Combobox3.Text='SP-0000/00' then
    begin
      Edit6.Text:='Tidak Ganti Sparepart';
      Combobox3.Enabled:=false;
    end else Combobox3.Enabled:=true;
  end;
  with dm1 do
  begin
    ZCon1.Connected:=True;
    ZEof.SQL.Clear;
    ZEof.SQL.Text:='select * from tb_barang';
    ZEof.SQL.Add('where kode_barang like'+QuotedStr('%'+ComboBox2.Text+'%'));
    ZEof.Active:=True;
    ZEof.Open;
    Label8.Caption:=ZEof['servis'];
  end;
end;

procedure Tservis.Button5Click(Sender: TObject);
begin
  dm1.ZReport.SQL.Clear;
  dm1.ZReport.SQL.Add('SELECT * FROM (SELECT data_service. * , tb_sparepart.nama_sparepart FROM (SELECT data. * , tb_konsumen.nama');
  dm1.ZReport.SQL.Add('FROM (SELECT tb_servis. * , tb_barang.nama_barang FROM tb_servis');
  dm1.ZReport.SQL.Add('LEFT JOIN tb_barang ON tb_servis.kode_barang = tb_barang.kode_barang ) AS data');
  dm1.ZReport.SQL.Add('LEFT JOIN tb_konsumen ON data.kode_konsumen = tb_konsumen.kode_konsumen ) AS data_service');
  dm1.ZReport.SQL.Add('LEFT JOIN tb_sparepart ON data_service.no = tb_sparepart.no ) AS Dt');
  dm1.ZReport.SQL.Add('LEFT JOIN tb_teknisi ON Dt.id_teknisi = tb_teknisi.id_teknisi');
  dm1.ZReport.SQL.Add('where no_servis like "'+Edit1.Text+'"');
  dm1.ZReport.Active:=True;
  dm1.ZReport.Open;
  if dm1.ZReport.RecordCount > 0 then
    begin
      laporan.QRLabel62.Caption:=Label8.Caption;
      laporan.QRLabel166.Caption:=Edit6.Text;
      laporan.QRLabel168.Caption:=Edit9.Text;
      laporan.QRLabel169.Caption:=Edit10.Text;
      laporan.QuickRep7.Preview
    end
  else
    MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

procedure Tservis.BitBtn1Click(Sender: TObject);
begin
  Combobox3.Text:='SP-0000/17';
  Combobox4.Text:='SP-0000/17';
  Edit6.Text:='Tidak Bisa Diperbaiki';
  Edit9.Text:='Tidak Bisa Diperbaiki';
  Combobox3.Enabled:=false;
  Combobox4.Enabled:=false;
end;


procedure Tservis.ComboBox4Change(Sender: TObject);
begin
    with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_sparepart where';
      ZEof.SQL.Add('no like'+QuotedStr('%'+ComboBox4.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      if ZEof.RecordCount>0 then
        Edit9.Text:=ZEof['nama_sparepart']
      else
        Edit9.Clear
    end
end;

procedure Tservis.ComboBox5Change(Sender: TObject);
begin
    with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_sparepart where';
      ZEof.SQL.Add('no like'+QuotedStr('%'+ComboBox5.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      if ZEof.RecordCount>0 then
        Edit10.Text:=ZEof['nama_sparepart']
      else
        Edit10.Clear
    end
end;

procedure Tservis.BitBtn2Click(Sender: TObject);
begin
  Label11.Visible:=True;
  ComboBox4.Visible:=True;
  Edit9.Visible:=True;
  BitBtn3.Visible:=True;
end;

procedure Tservis.BitBtn3Click(Sender: TObject);
begin
  Label12.Visible:=True;
  ComboBox5.Visible:=True;
  Edit10.Visible:=True; 
  BitBtn4.Visible:=True;
end;

end.
