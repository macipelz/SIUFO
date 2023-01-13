unit Upembayaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls;

type
  Tpembayaran = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label9: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Edit4: TEdit;
    Label10: TLabel;
    Edit5: TEdit;
    Label11: TLabel;
    Edit6: TEdit;
    Label12: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Label13: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pembayaran: Tpembayaran;
  id, idjadi, mulai : String;

implementation

uses dm, StrUtils, menu, Ulaporan;

{$R *.dfm}

//coding fungsi nilai rupiah
function terbilang(sValue: string):string;
const
Angka : array [1..20] of string =
('', 'Satu', 'Dua', 'Tiga', 'Empat','Lima', 'Enam', 'Tujuh', 'Delapan','Sembilan', 'Sepuluh', 'Sebelas','Duabelas', 'Tigabelas', 'Empatbelas','Limabelas', 'Enambelas', 'Tujuhbelas','Delapanbelas', 'Sembilanbelas');
sPattern: string = '000000000000000';

var
S,Rupiah : string;
Satu, Dua, Tiga, Belas, Gabung: string;
Sen, Sen1, Sen2: string;
Hitung, ribuan : integer;
one, two, three: integer;

begin
One := 4;
Two := 5;
Three := 6;
Hitung := 1;
Rupiah := '';
S := copy(sPattern, 1, length(sPattern) - length(trim(sValue))) + sValue;
Sen1 := Copy(S, 14, 1);
Sen2 := Copy(S, 15, 1);
Sen := Sen1 + Sen2;
while Hitung < 5 do
begin
Satu := Copy(S, One, 1);
Dua := Copy(S, Two, 1);
Tiga := Copy(S, Three, 1);
Gabung := Satu + Dua + Tiga;

if StrToInt(Satu) = 1 then
Rupiah := Rupiah + 'Seratus '
else
if StrToInt(Satu) > 1 Then
Rupiah := Rupiah + Angka[StrToInt(satu)+1] + ' Ratus ';

if StrToInt(Dua) = 1 then
begin
Belas := Dua + Tiga;
Rupiah := Rupiah + Angka[StrToInt(Belas)+1];
end
else
if StrToInt(Dua) > 1 Then
Rupiah := Rupiah + Angka[StrToInt(Dua)+1] + ' Puluh ' +
Angka[StrToInt(Tiga)+1]
else
if (StrToInt(Dua) = 0) and (StrToInt(Tiga) > 0) Then
begin
if ((Hitung = 3) and (Gabung = '001')) or
((Hitung = 3) and (Gabung = ' 1')) then
Rupiah := Rupiah + 'Seribu '
else
Rupiah := Rupiah + Angka[StrToInt(Tiga)+1];
end;

if (hitung = 1) and (StrToInt(Gabung) > 0) then
Rupiah := Rupiah + ' Milyar '
else
if (Hitung = 2) and (StrToInt(Gabung) > 0) then
Rupiah := Rupiah + ' Juta '
else
if (Hitung = 3) and (StrToInt(Gabung) > 0) then
begin
if (Gabung = '001') or (Gabung = ' 1') then
Rupiah := Rupiah + ''
else
Rupiah := Rupiah + ' Ribu ';
end;
Hitung := Hitung + 1;
One := One + 3;
Two := Two + 3;
Three := Three + 3;
end;
if length(Rupiah) > 1 then Rupiah := Rupiah + ' Rupiah ';
Result := Rupiah;
end;

procedure ribuan(edit : Tedit);
var
 sRupiah: string;
 iRupiah: Currency;
begin
//ribuan --> currency ( menyesuaikan setting windows )
 sRupiah := edit.Text;
 sRupiah := StringReplace(sRupiah,',','',[rfReplaceAll,rfIgnoreCase]); // hilangkan char koma , pemisah //ribuan selain IDR
 sRupiah := StringReplace(sRupiah,'.','',[rfReplaceAll,rfIgnoreCase]); //remove char titik . pemisah //ribuan IDR
 iRupiah := StrToCurrDef(sRupiah,0); // convert srupiah ke currency

//currency --> format ribuan
 edit.Text := FormatCurr('#,###',iRupiah);
 edit.SelStart := length(edit.text);
end;

function hapusribuan(edit: TEdit): string;
var
  hasil: string;
begin
  hasil := edit.Text;
  hasil := StringReplace(hasil, ',', '', [rfReplaceAll, rfIgnoreCase]);
  hasil := StringReplace(hasil, '.', '', [rfReplaceAll, rfIgnoreCase]);
  hapusribuan := hasil;
end;

procedure EditInputNomor(var txtEdit : TEdit);
var
  defstyle: dWord;
begin
  defstyle := GetWindowLong(txtEdit.Handle, GWL_STYLE);
  SetWindowLong(txtEdit.Handle, GWL_STYLE, defstyle or ES_NUMBER);
end;
//akhir coding format rupiah

procedure nol;
begin
  with pembayaran do
    begin
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Edit5.Clear;
      Edit6.Clear;
      Edit7.Clear;
      Edit8.Clear;
      Label12.Hide;
      ComboBox1.Text:='';
      DateTimePicker1.Date:=Now;
    end
end;

procedure aktif;
begin
  with pembayaran do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      Edit4.Enabled:=True;
      Edit5.Enabled:=True;
      Edit6.Enabled:=True;
      Edit7.Enabled:=True;
      Edit8.Enabled:=True;
      ComboBox1.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with pembayaran do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      Edit4.Enabled:=False;
      Edit5.Enabled:=False;
      Edit6.Enabled:=False;
      Edit7.Enabled:=False;
      Edit8.Enabled:=False;
      ComboBox1.Enabled:=False;
    end
end;

procedure Tpembayaran.FormShow(Sender: TObject);
begin
  nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Edit1.Clear;
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZData.SQL.Clear;
      ZData.SQL.Text:='select * from tb_kwitansi';
      ZData.Active:=True;
      ZData.Open;
      Source1.DataSet:=ZData;

      ZLogin.SQL.Clear;
      ZLogin.SQL.Text:='select * from tb_user where';
      ZLogin.SQL.Add('user like'+QuotedStr(home.Label1.Caption));
      ZLogin.Active:=True;
      ZLogin.Open;
      Edit9.Text:=ZLogin.FieldList[0].AsString;

      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_servis';
      ZEof.Active:=True;
      ZEof.Open;
      Combobox1.Items.Clear;
      while not ZEof.Eof do
      begin
          ComboBox1.Items.Add(ZEof['no_servis']);
          ZEof.Next;
      end;
    end;
  Button1.Caption:='BARU';
  DateTimePicker1.Date:=now;
end;

procedure Tpembayaran.ComboBox1Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      //ZEof.SQL.Text:='select * from tb_servis where';
      //ZEof.SQL.Add('no_servis like'+QuotedStr('%'+ComboBox1.Text+'%'));
      ZEof.SQL.Add('SELECT tb_servis.no_seri, tb_barang.nama_barang, tb_konsumen.nama, tb_servis.kerusakan, tb_sparepart.no, tb_sparepart.harga FROM tb_servis');
      ZEof.SQL.Add('INNER JOIN tb_barang ON (tb_servis.kode_barang = tb_barang.kode_barang) INNER JOIN tb_konsumen ON (tb_servis.kode_konsumen = tb_konsumen.kode_konsumen) AND (tb_barang.kode_konsumen = tb_konsumen.kode_konsumen)');
      ZEof.SQL.Add('INNER JOIN tb_sparepart ON (tb_servis.no = tb_sparepart.no)');
      ZEof.SQL.Add('WHERE no_servis LIKE "'+ComboBox1.Text+'"');
      ZEof.Active:=True;
      ZEof.Open;
      Edit2.Text:=ZEof['nama_barang'];
      Edit3.Text:=ZEof['nama'];
      Edit7.Text:=ZEof['kerusakan'];
      Edit4.Text:=ZEof['harga'];
      Edit6.Text:=ZEof['no_seri'];
      Label13.Caption:=ZEof['no'];
      if edit4.Text='0' then Label12.Show else Label12.Hide;
      if Label13.Caption='SP-0000/17' then
      begin
        Label12.Hide;
        Edit8.Text:='20000';
      end
      else
      begin
        Edit8.Text:='0';
      end;
    end
end;

procedure Tpembayaran.Button1Click(Sender: TObject);
begin
  if Button1.Caption='BARU' then
    begin
      Button1.Caption:='BATAL';
      aktif;
      ComboBox1.SetFocus;
      Button2.Enabled:=True;
      nol;
      mulai:='0000';
      dm1.ZCon1.Connected:=True;
      dm1.ZData.SQL.Clear;
      dm1.ZData.SQL.Text:='select * from tb_kwitansi';
      dm1.ZData.Active:=True;
      dm1.ZData.Open;
      if dm1.ZData.RecordCount > 0 then
        begin
          dm1.ZData.Last;
          id:=dm1.ZData.FieldByname('no_kwitansi').AsString;
          idjadi:=MidStr(id,4,4);
          id:=Inttostr(Strtoint(idjadi)+1);
          idjadi:='KW-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='KW-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='BARU';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      nol;
      Edit1.Clear;
    end
end;

procedure Tpembayaran.Button3Click(Sender: TObject);
begin
dm1.ZReport.Active:=False;
dm1.ZReport.SQL.Clear;
dm1.ZReport.SQL.Add('SELECT * FROM tb_kwitansi LEFT JOIN (SELECT tb_servis.no_servis, tb_servis.kerusakan, pelanggan. *');
dm1.ZReport.SQL.Add('FROM tb_servis LEFT JOIN (SELECT tb_konsumen.nama, tb_barang.kode_barang, tb_barang.nama_barang, tb_barang.kelengkapan');
dm1.ZReport.SQL.Add('FROM tb_konsumen LEFT JOIN tb_barang ON tb_konsumen.kode_konsumen = tb_barang.kode_konsumen) AS pelanggan');
dm1.ZReport.SQL.Add('ON tb_servis.kode_barang = pelanggan.kode_barang) AS data_servis ON tb_kwitansi.no_servis = data_servis.no_servis') ;
dm1.ZReport.SQL.Add('WHERE no_kwitansi LIKE "'+Edit1.Text+'"');
dm1.ZReport.Active:=True;
if dm1.ZReport.RecordCount>0 then
  begin
    laporan.QRLabel156.Caption:=terbilang(dm1.ZReport['total']);
    laporan.QRLabel157.Caption:=Edit9.Text;
    if Edit4.Text='0' then
      laporan.QRLabel162.Caption:='-'
    else begin
      laporan.QRLabel162.Caption:='Rp. '+Edit11.Text;
    end;
    laporan.QRLabel60.Caption:='Rp. '+Edit10.Text;
    laporan.QRLabel61.Caption:='Rp. '+Edit12.Text;
    laporan.QRLabel49.Caption:=Edit6.Text;
    laporan.QuickRep8.Preview;
    Button3.Enabled:=False;
    nol;
    Button1.Click;
  end
else
  MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

procedure Tpembayaran.Button2Click(Sender: TObject);
var
  x : String;
begin
  if (Edit1.Text = '') or (ComboBox1.Text='') or (Edit8.Text='') then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else if dm1.ZData.Locate('no_servis',ComboBox1.Text,[]) then
    begin
      x := dm1.ZData['no_servis'];
      MessageDlg('Barang dengan No Servis '+x+' Sudah Dibayar Sebelumnya',mtInformation,[mbOK],0);
    end
  else
  with dm1 do
    begin
      ZData.Append;
      ZData['no_kwitansi']:=Edit1.Text;
      ZData['tgl_kwitansi']:=DateTimePicker1.Date;
      ZData['no_servis']:=ComboBox1.Text;
      ZData['biaya']:=Edit8.Text;
      ZData['total']:=Edit5.Text;
      ZData.Post;
      MessageDlg('Data anda sudah tersimpan',mtInformation,[mbOK],0);
      //Button1.Click;
      Button3.Enabled:=True;
    end
end;

procedure Tpembayaran.Edit8Change(Sender: TObject);
begin
  ribuan(Edit8);
  if edit8.Text='' then
    begin
      Edit5.Text:=Edit4.Text;
    end
  else
    begin
      Edit5.Text:=IntToStr(StrtoInt(hapusribuan(Edit4))+StrtoInt(hapusribuan(Edit8)));
    end;
  Edit10.Text:=Edit8.Text;
  Edit11.Text:=Edit4.Text;
  Edit12.Text:=Edit5.Text;
end;

procedure Tpembayaran.Edit10Change(Sender: TObject);
begin
  ribuan(Edit10);
end;

procedure Tpembayaran.Edit11Change(Sender: TObject);
begin
  ribuan(Edit11);
end;

procedure Tpembayaran.Edit12Change(Sender: TObject);
begin
  ribuan(Edit12);
end;

procedure Tpembayaran.Edit4Change(Sender: TObject);
begin
  if edit4.Text='0' then
    begin
      Edit4.Text:='0';
    end
  else
   ribuan(Edit4);
end;

procedure Tpembayaran.Edit5Change(Sender: TObject);
begin
  ribuan(Edit5);
end;

end.
