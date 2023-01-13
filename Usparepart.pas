unit Usparepart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls;

type
  Tpart = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Button4: TButton;
    Label4: TLabel;
    Edit4: TEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  part: Tpart;
  id, idjadi, mulai : String;

implementation

uses dm, StrUtils, Uorder;

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
Hitung : integer;
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
 edit.Text := FormatCurr('#,##0',iRupiah);
 edit.SelStart := length(edit.text);
end;

procedure EditInputNomor(var txtEdit : TEdit);
var
  defstyle: dWord;
begin
  defstyle := GetWindowLong(txtEdit.Handle, GWL_STYLE);
  SetWindowLong(txtEdit.Handle, GWL_STYLE, defstyle or ES_NUMBER);
end;
//akhir coding format rupiah

procedure Tpart.FormShow(Sender: TObject);
begin
  EditInputNomor(Edit3);
  Edit2.Clear;
  Edit3.Clear;
  Edit1.Enabled:=False;
  Edit2.Enabled:=False;
  Edit3.Enabled:=False;
  Edit4.Enabled:=False;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  Edit1.Clear;
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZData.SQL.Clear;
      ZData.SQL.Text:='select * from tb_sparepart where no!='+'"SP-0000/00"'+' and no!= '+'"SP-0000/17"';
      ZData.Active:=True;
      ZData.Open;
      Source1.DataSet:=ZData;
    end;
  Button1.Caption:='BARU';
end;

procedure Tpart.DBGrid1DblClick(Sender: TObject);
begin
if dm1.ZData.RecordCount = 0 then
  MessageDlg('Data masih kosong',mtError,[mbOK],0)
else
  begin
    Edit1.Enabled:=True;
    Edit2.Enabled:=True;
    Edit3.Enabled:=True;
    Edit2.SetFocus;
    Edit1.ReadOnly:=True;
    Button3.Enabled:=True;
    Button4.Enabled:=True;
    Button2.Enabled:=False;
    Button1.Caption:='BATAL';
    with dm1 do
    begin
      Edit1.Text:=ZData['no'];
      Edit2.Text:=ZData['nama_sparepart'];
      Edit3.Text:=ZData['harga'];
      Edit4.Text:=ZData['stok'];
    end
  end
end;

procedure Tpart.Button1Click(Sender: TObject);
begin
  if Button1.Caption='BARU' then
    begin
      Button1.Caption:='BATAL';
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      Edit4.Enabled:=True;
      Edit2.SetFocus;
      Button2.Enabled:=True;
      Edit2.Clear;
      Edit3.Clear;
      mulai:='0000';
      dm1.ZCon1.Connected:=True;
      dm1.ZData.SQL.Clear;
      dm1.ZData.SQL.Text:='select * from tb_sparepart order by no asc';
      dm1.ZData.Active:=True;
      dm1.ZData.Open;
      if dm1.ZData.RecordCount > 0 then
        begin
          dm1.ZData.Last;
          id:=dm1.ZData.FieldByname('no').AsString;
          idjadi:=MidStr(id,4,4);
          id:=IntToStr(Strtoint(idjadi)+1);
          idjadi:='SP-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='SP-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='BARU';
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      Edit4.Enabled:=False;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      Edit2.Clear;
      Edit3.Clear;
      Edit1.Clear;
    end
end;

procedure Tpart.Button2Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text='') or (Edit3.Text='') then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else if dm1.ZData.Locate('no',Edit1.Text,[]) then
    begin
      MessageDlg('ID sudah terdaftar...',mtInformation,[mbOK],0);
      Edit1.Clear;
      Edit1.SetFocus;
    end
  else
  with dm1 do
    begin
      ZData.Append;
      ZData['no']:=Edit1.Text;
      ZData['nama_sparepart']:=Edit2.Text;
      ZData['harga']:=Edit3.Text;
      ZData['stok']:=Edit4.Text;
      ZData.Post;
      MessageDlg('Data anda sudah tersimpan',mtInformation,[mbOK],0);
      Edit2.Clear;
      Edit3.Clear;
      Edit1.Clear;
      Button1.Click;
    end
end;

procedure Tpart.Button3Click(Sender: TObject);
begin
  with dm1 do
  begin
    ZData.Edit;
    ZData['nama_sparepart']:=Edit2.Text;
    ZData['harga']:=Edit3.Text;
    ZData['stok']:=Edit4.Text;
    ZData.Post;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Tpart.Button4Click(Sender: TObject);
var
  x : String;
begin
try
  with dm1 do
  begin
    x := ZData['no'];
    if MessageDlg('Yakin hapus SPAREPART NO '+x+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
    ZData.Delete;
  end;
  Button1.Click;
except
  DBGrid1.DataSource:=dm1.Source1;
  MessageDlg('Data gagal dihapus...'+#13+'Masih terjalin antar data..!',mtError,[mbOK],0);
end
end;

//Coding tekan enter untuk pindah kolom
procedure Tpart.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
 Key := #0;
 PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tpart.FormCreate(Sender: TObject);
begin
keyPreview := True;
end;
//Akhir coding

procedure Tpart.Edit3Change(Sender: TObject);
begin
  ribuan(Edit3);
end;

procedure Tpart.Button5Click(Sender: TObject);
begin
  order.Showmodal;
end;

end.
