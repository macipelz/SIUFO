unit Ureturbeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls;

type
  Treturbeli = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit7: TEdit;
    cbbEdit2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cbbEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  returbeli: Treturbeli;
  id, idjadi, mulai : String;

implementation

uses
  dm, StrUtils, Ulaporan;

{$R *.dfm}

procedure nol;
begin
  with returbeli do
    begin
      Edit3.Clear;
      Edit4.Clear;
      Edit5.Clear;
      Edit6.Clear;
      Edit7.Clear;
      DateTimePicker1.Date:=Now;
      cbbEdit2.Text:='';
    end
end;

procedure aktif;
begin
  with returbeli do
    begin
      Edit1.Enabled:=True;
      Edit3.Enabled:=True;
      Edit4.Enabled:=True;
      Edit5.Enabled:=True;
      Edit6.Enabled:=True;
      Edit7.Enabled:=True;
      cbbEdit2.Enabled:=True;
    end
end;

procedure nonaktif;
begin
  with returbeli do
    begin
      Edit1.Enabled:=False;
      Edit3.Enabled:=False;
      Edit4.Enabled:=False;
      Edit5.Enabled:=False;
      Edit6.Enabled:=False;
      Edit7.Enabled:=False;
      cbbEdit2.Enabled:=False;
    end
end;

procedure data;
begin
  with returbeli do
    begin
      dm1.ZCon1.Connected:=True;
      dm1.ZData.SQL.Clear;
      dm1.ZData.SQL.Text:='select * from tb_returbeli';
      dm1.ZData.Active:=True;
      dm1.ZData.Open;
      dm1.Source1.DataSet:=dm1.ZData;
    end
end;


procedure Treturbeli.FormShow(Sender: TObject);
begin
  data;
  nol;
  nonaktif;
  Button2.Enabled:=False;
  Button3.Enabled:=False;
  Button4.Enabled:=False;
  Button5.Enabled:=False;
  Edit1.Clear;
  Button1.Caption:='BARU';
  DateTimePicker1.Date:=now;
    with dm1 do
    begin
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_returjual';
      ZEof.Active:=True;
      ZEof.Open;
      cbbEdit2.Items.Clear;
      while not ZEof.Eof do
      begin
          cbbEdit2.Items.Add(ZEof['no_returjual']);
          ZEof.Next;
      end;
    end;
end;

procedure Treturbeli.Button1Click(Sender: TObject);
begin
  if Button1.Caption='BARU' then
    begin
      Button1.Caption:='BATAL';
      aktif;
      Button2.Enabled:=True;
      nol;
      mulai:='0000';
      dm1.ZCon1.Connected:=True;
      dm1.ZQAutoNo.SQL.Clear;
      dm1.ZQAutoNo.SQL.Text:='select * from tb_returbeli';
      dm1.ZQAutoNo.Active:=True;
      dm1.ZQAutoNo.Open;
      if dm1.ZQAutoNo.RecordCount > 0 then
        begin
          dm1.ZQAutoNo.Last;
          id:=dm1.ZQAutoNo.FieldByname('no_returbeli').AsString;
          idjadi:=MidStr(id,4,4);
          id:=IntToStr(Strtoint(idjadi)+1);
          idjadi:='RB-'+LeftStr(mulai,4-length(id))+id;
          Edit1.Text:=idjadi+'/'+FormatDateTime('yy',Date);
        end
      else
        begin
          Edit1.Text:='RB-0001/17';
        end;
      end
  else
    begin
      Button1.Caption:='BARU';
      nonaktif;
      Button2.Enabled:=False;
      Button3.Enabled:=False;
      Button4.Enabled:=False;
      Button5.Enabled:=False;
      nol;
      Edit1.Clear;
    end
end;

procedure Treturbeli.Button2Click(Sender: TObject);
begin
  if (Edit1.Text ='') or (Edit3.Text='') or (Edit4.Text='') or (Edit5.Text='') or (Edit6.Text='') or (Edit7.Text='') then
    MessageDlg('Isi Data Textbox dengan lengkap !',mtInformation,[mbOK],0)
  else
    begin
      try
      dm1.ZQCRUD.SQL.Clear;
      dm1.ZQCRUD.SQL.Text:= 'insert into tb_returbeli (no_returbeli, no_returjual, merk, barang, no_seri, jumlah, kerusakan, tanggal)'+
                        'value ('+QuotedStr(Edit1.Text)+
                        ','+QuotedStr(cbbEdit2.Text)+
                        ','+QuotedStr(Edit3.Text)+
                        ','+QuotedStr(Edit4.Text)+
                        ','+QuotedStr(Edit5.Text)+
                        ','+QuotedStr(Edit6.Text)+
                        ','+QuotedStr(Edit7.Text)+
                        ','+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+')';
      dm1.ZQCRUD.ExecSQL;
      dm1.ZData.Refresh;
      Button1.Click;
      except
      MessageDlg('Data Sudah dientri..!',mtInformation,[mbOK],0);
      end
    end;
end;

procedure Treturbeli.Button3Click(Sender: TObject);
begin
  with dm1 do
  begin
    dm1.ZQCRUD.SQL.Clear;
    dm1.ZQCRUD.SQL.Text:= 'update tb_returbeli set no_returjual ='+QuotedStr(cbbEdit2.Text)+
                        ', merk='+QuotedStr(Edit3.Text)+
                        ', barang='+QuotedStr(Edit4.Text)+
                        ', no_seri='+QuotedStr(Edit5.Text)+
                        ', jumlah='+QuotedStr(Edit6.Text)+
                        ', kerusakan='+QuotedStr(Edit7.Text)+
                        ', tanggal='+QuotedStr(FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date))+
                        'where no_returbeli ='+QuotedStr(Edit1.Text);
    dm1.ZQCRUD.ExecSQL;
    dm1.ZData.Refresh;
    MessageDlg('Update Data Berhasil',mtInformation,[mbOK],0);
  end;
  Button1.Click;
end;

procedure Treturbeli.Button4Click(Sender: TObject);
var
  x : String;
begin
try
  with dm1 do
  begin
    x := ZData['no_returbeli'];
    if MessageDlg('Yakin hapus NO RETUR '+x+' ?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
      begin
        dm1.ZQCRUD.SQL.Clear;
        dm1.ZQCRUD.SQL.Text:='delete from tb_returbeli where no_returbeli ='+QuotedStr(Edit1.Text);
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

procedure Treturbeli.DBGrid1DblClick(Sender: TObject);
begin
if dm1.ZData.RecordCount = 0 then
  MessageDlg('Data masih kosong',mtError,[mbOK],0)
else
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
      Edit1.Text:=ZData['no_returbeli'];
      cbbEdit2.Text:=ZData['no_returjual'];
      Edit3.Text:=ZData['merk'];
      Edit4.Text:=ZData['barang'];
      Edit5.Text:=ZData['no_seri'];
      Edit6.Text:=ZData['jumlah'];
      Edit7.Text:=ZData['kerusakan'];
      DateTimePicker1.Date:=ZData['tanggal'];
    end
  end
end;

procedure Treturbeli.Button5Click(Sender: TObject);
begin
  dm1.ZReport.SQL.Clear;
  dm1.ZReport.SQL.Add('SELECT * FROM tb_returbeli');
  dm1.ZReport.SQL.Add('where no_returbeli like "'+Edit1.Text+'"');
  dm1.ZReport.Active:=True;
  dm1.ZReport.Open;
  if dm1.ZReport.RecordCount > 0 then
    laporan.QuickRep9.Preview
  else
    MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

procedure Treturbeli.cbbEdit2Change(Sender: TObject);
begin
    with dm1 do
    begin
      ZCon1.Connected:=True;
      ZEof.SQL.Clear;
      ZEof.SQL.Text:='select * from tb_returjual where';
      ZEof.SQL.Add('no_returjual like'+QuotedStr('%'+cbbEdit2.Text+'%'));
      ZEof.Active:=True;
      ZEof.Open;
      Edit4.Text:=ZEof['nama_barang'];
      Edit5.Text:=ZEof['no_seri'];
      Edit7.Text:=ZEof['kerusakan'];
    end
end;

end.
