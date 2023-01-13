unit Ubarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, jpeg, ExtCtrls;

type
  Tbarang = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    RB1: TRadioButton;
    RB2: TRadioButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Button5: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
    procedure RB2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  barang: Tbarang;
  id, idjadi, mulai : String;

implementation

uses dm, StrUtils, Uservis;


{$R *.dfm}

procedure nol;
begin
  with barang do
    begin
      Edit2.Clear;
      Edit3.Clear;
      ComboBox1.Text:='';
      Edit4.Clear;
      Edit5.Clear;
      DateTimePicker1.Date:=Now;
      RB1.Checked:=false;
      RB2.Checked:=false;
    end
end;

procedure aktif;
begin
  with barang do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      Edit3.Enabled:=True;
      Edit4.Enabled:=True;
      RB1.Enabled:=True;
      RB2.Enabled:=True;
      ComboBox1.Enabled:=True;
      Edit5.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with barang do
    begin
      Edit1.Enabled:=False;
      Edit2.Enabled:=False;
      Edit3.Enabled:=False;
      Edit4.Enabled:=False;
      RB1.Enabled:=False;
      RB2.Enabled:=False;
      ComboBox1.Enabled:=False;
      Edit5.Enabled:=False;
    end
end;

procedure Tbarang.FormShow(Sender: TObject);
begin
  nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  Edit1.Clear;

  dm1.ZCon1.Connected:=True;
  dm1.ZData.SQL.Clear;
  dm1.ZData.SQL.Text:='select * from tb_barang left join tb_konsumen on tb_barang.kode_konsumen =tb_konsumen.kode_konsumen';
  dm1.ZData.Active:=True;
  dm1.ZData.Open;
  dm1.Source1.DataSet:=dm1.ZData;

  with dm1 do
    begin
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_konsumen order by kode_konsumen desc';
      ZEof.Active:=True;
      ZEof.Open;
      Combobox1.Items.Clear;
      while not ZEof.Eof do
      begin
          ComboBox1.Items.Add(ZEof['kode_konsumen']);
          ZEof.Next;
      end;
    end;
  Button1.Caption:='BARU';
  DateTimePicker1.Date:=now;
end;

procedure Tbarang.DBGrid1DblClick(Sender: TObject);
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
      Edit1.Text:=ZData['kode_barang'];
      Edit2.Text:=ZData['nama_barang'];
      Edit3.Text:=ZData['kelengkapan'];
      Edit4.Text:=ZData['no_seri'];
      ComboBox1.Text:=ZData['kode_konsumen'];
      Edit5.Text:=ZData['nama'];
      DateTimePicker1.Date:=ZData['tgl_masuk'];
      Label6.caption:=ZData['servis'];
      if Label6.caption='Servis Langsung' then
      begin
        RB1.Checked:=true;
        RB2.Checked:=false;
      end
      else if Label6.caption='Penitipan Servis' then
      begin
        RB1.Checked:=false;
        RB2.Checked:=true;
      end;
    end
  end
end;

procedure Tbarang.ComboBox1Change(Sender: TObject);
begin
  with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_konsumen where';
      ZEof.SQL.Add('kode_konsumen like'+QuotedStr('%'+ComboBox1.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      Edit5.Text:=ZEof['nama'];
    end
end;

procedure Tbarang.Button1Click(Sender: TObject);
begin
  if Button1.Caption='BARU' then
    begin
      Button1.Caption:='BATAL';
      aktif;
      Edit2.SetFocus;
      Button2.Enabled:=True;
      nol;
      mulai:='0000';
      dm1.ZCon1.Connected:=True;
      dm1.ZQAutoNo.SQL.Clear;
      dm1.ZQAutoNo.SQL.Text:='select * from tb_barang';
      dm1.ZQAutoNo.Active:=True;
      dm1.ZQAutoNo.Open;
      if dm1.ZQAutoNo.RecordCount > 0 then
        begin
          dm1.ZQAutoNo.Last;
          id:=dm1.ZQAutoNo.FieldByname('kode_barang').AsString;
          idjadi:=MidStr(id,4,4);
          id:=Inttostr(Strtoint(idjadi)+1);
          idjadi:='BR-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='BR-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='BARU';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      nol;
      Edit1.Clear;
    end
end;

procedure Tbarang.Button2Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text='') or (Edit3.Text='') or (ComboBox1.Text='')then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else if dm1.ZData.Locate('kode_barang',Edit1.Text,[]) then
    begin
      MessageDlg('Kode sudah terdaftar...',mtInformation,[mbOK],0);
      Edit1.Clear;
      Edit1.SetFocus;
    end
  else
  with dm1 do
    begin
      dm1.ZQCRUD.SQL.Clear;
      dm1.ZQCRUD.SQL.Text:= 'insert into tb_barang (kode_barang,nama_barang,no_seri,kelengkapan,servis,kode_konsumen,nama,tgl_masuk,keterangan)'+
                        'value ('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(Edit2.Text)+
                        ','+QuotedStr(Edit4.Text)+
                        ','+QuotedStr(Edit3.Text)+
                        ','+QuotedStr(Label6.Caption)+
                        ','+QuotedStr(ComboBox1.Text)+
                        ','+QuotedStr(Edit5.Text)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+
                        ','+'"Belum Diservis"'+')';
      dm1.ZQCRUD.ExecSQL;
      dm1.ZData.Refresh;
      MessageDlg('Data anda sudah tersimpan',mtInformation,[mbOK],0);
      nol;
      Edit1.Clear;
      Button1.Click;
      ZData.Refresh;
    end
end;

procedure Tbarang.Button3Click(Sender: TObject);
begin
  with dm1 do
  begin
    dm1.ZQCRUD.SQL.Clear;
    dm1.ZQCRUD.SQL.Text:= 'update tb_barang set nama_barang ='+QuotedStr(Edit2.Text)+
                        ', no_seri='+QuotedStr(Edit4.Text)+
                        ', kelengkapan='+QuotedStr(Edit3.Text)+
                        ', servis='+QuotedStr(Label6.Caption)+
                        ', kode_konsumen='+QuotedStr(ComboBox1.Text)+
                        ', nama='+QuotedStr(Edit5.Text)+
                        ', tgl_masuk='+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+
                        ', keterangan='+'"Belum Diservis"'+
                        'where kode_barang ='+QuotedStr(Edit1.Text);
    dm1.ZQCRUD.ExecSQL;
    dm1.ZData.Refresh;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Tbarang.Button4Click(Sender: TObject);
var
  x : String;
begin
try
  with dm1 do
  begin
    x := ZData['kode_barang'];
    if MessageDlg('Yakin hapus KODE BARANG '+x+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
      begin
        dm1.ZQCRUD.SQL.Clear;
        dm1.ZQCRUD.SQL.Text:='delete from tb_barang where kode_barang ='+QuotedStr(Edit1.Text);
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

procedure Tbarang.RB1Click(Sender: TObject);
begin
  Label6.Caption:='Servis Langsung';
end;

procedure Tbarang.RB2Click(Sender: TObject);
begin
  Label6.Caption:='Penitipan Servis';
end;

procedure Tbarang.Button5Click(Sender: TObject);
begin
  servis.ShowModal;
end;

end.
