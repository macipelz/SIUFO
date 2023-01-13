unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, jpeg;

type
  Thome = class(TForm)
    MainMenu1: TMainMenu;
    MasterData1: TMenuItem;
    Laporan1: TMenuItem;
    Laporan2: TMenuItem;
    Pengaturan1: TMenuItem;
    Logout1: TMenuItem;
    DataBarang1: TMenuItem;
    DataKonsumen1: TMenuItem;
    DataTeknisi1: TMenuItem;
    Servis1: TMenuItem;
    Pembayaran1: TMenuItem;
    DataLogin1: TMenuItem;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    RekapTransaksi1: TMenuItem;
    data_barang: TMenuItem;
    lapteknisi: TMenuItem;
    sparepart: TMenuItem;
    UbahPassword1: TMenuItem;
    Label1: TLabel;
    RekapTransaksiBulanan1: TMenuItem;
    RekapTransaksiTahunan1: TMenuItem;
    DataSparepart1: TMenuItem;
    img1: TImage;
    Retur1: TMenuItem;
    ReturPembelian1: TMenuItem;
    ReturPenjualan1: TMenuItem;
    RekapSparepartKeluar1: TMenuItem;
    RekapSparepartMasuk1: TMenuItem;
    DataSparepart2: TMenuItem;
    DataSparepartMasuk1: TMenuItem;
    DataPesanSparepart2: TMenuItem;
    RekapBarangBelumDiservis1: TMenuItem;
    RekapBarangSudahDiservis1: TMenuItem;
    RekapBarangGagalDiservis1: TMenuItem;
    RekapTransaksi2: TMenuItem;
    RekapDataBarang1: TMenuItem;
    RekapSparepart1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logout1Click(Sender: TObject);
    procedure DataKonsumen1Click(Sender: TObject);
    procedure DataBarang1Click(Sender: TObject);
    procedure DataTeknisi1Click(Sender: TObject);
    procedure Servis1Click(Sender: TObject);
    procedure Pembayaran1Click(Sender: TObject);
    procedure DataLogin1Click(Sender: TObject);
    procedure UbahPassword1Click(Sender: TObject);
    procedure RekapTransaksi1Click(Sender: TObject);
    procedure data_barangClick(Sender: TObject);
    procedure sparepartClick(Sender: TObject);
    procedure lapteknisiClick(Sender: TObject);
    procedure RekapTransaksiBulanan1Click(Sender: TObject);
    procedure RekapTransaksiTahunan1Click(Sender: TObject);
    procedure ReturPembelian1Click(Sender: TObject);
    procedure ReturPenjualan1Click(Sender: TObject);
    procedure RekapSparepartKeluar1Click(Sender: TObject);
    procedure RekapSparepartMasuk1Click(Sender: TObject);
    procedure DataSparepart2Click(Sender: TObject);
    procedure DataSparepartMasuk1Click(Sender: TObject);
    procedure DataPesanSparepart1Click(Sender: TObject);
    procedure DataPesanSparepart2Click(Sender: TObject);
    procedure RekapBarangBelumDiservis1Click(Sender: TObject);
    procedure RekapBarangSudahDiservis1Click(Sender: TObject);
    procedure RekapBarangGagalDiservis1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  home: Thome;

implementation

uses Ulogin, dm, Ukonsumen, Ubarang, Uteknisi, Usparepart, Uservis,
  Upembayaran, Uuser, Ulaporan, Ureturbeli, Ureturjual, Upart2, Uorder;

{$R *.dfm}

procedure Thome.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='Hari / Tanggal : '+FormatDateTime('dddd, dd-mmm-yyyy',Date);
end;

procedure Thome.Timer1Timer(Sender: TObject);
begin
StatusBar1.Panels[1].Text:='Jam : '+FormatDateTime('hh:mm:ss',now);
end;

procedure Thome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure Thome.Logout1Click(Sender: TObject);
begin
  Logout1.Visible:=False;
  DataLogin1.Visible:=False;
  StatusBar1.Panels[2].Text:='User :    ';
  StatusBar1.Panels[3].Text:='Level :    ';
  home.Enabled:=False;
  login.Show;
end;

procedure Thome.DataKonsumen1Click(Sender: TObject);
begin
konsumen.ShowModal;
end;

procedure Thome.DataBarang1Click(Sender: TObject);
begin
barang.ShowModal;
end;

procedure Thome.DataTeknisi1Click(Sender: TObject);
begin
teknisi.ShowModal;
end;

procedure Thome.Servis1Click(Sender: TObject);
begin
servis.ShowModal;
end;

procedure Thome.Pembayaran1Click(Sender: TObject);
begin
pembayaran.ShowModal;
end;

procedure Thome.DataLogin1Click(Sender: TObject);
begin
user.Height:=345;
user.Width:=395;
user.Position:=poDesktopCenter;
user.Show;
user.TabSheet1.TabVisible:=True;
home.Enabled:=False;
end;

procedure Thome.UbahPassword1Click(Sender: TObject);
begin
user.Height:=213;
user.Width:=326;
user.Position:=poDesktopCenter;
user.Show;
user.TabSheet2.TabVisible:=True;
home.Enabled:=False;
end;

procedure Thome.data_barangClick(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_barang';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QRLabel111.Caption:='Tgl Masuk';
      laporan.QRDBText63.DataField:='tgl_masuk';
      laporan.QuickRep4.Preview;
  end;
end;

procedure Thome.sparepartClick(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_sparepart where no!='+'"SP-0000/00"';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QuickRep6.Preview;
  end;
end;

procedure Thome.lapteknisiClick(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_teknisi';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QuickRep5.Preview;
  end;
end;

procedure Thome.RekapTransaksi1Click(Sender: TObject);
begin
laporan.GroupBox1.Visible:=True;
laporan.GroupBox2.Visible:=False;
laporan.GroupBox3.Visible:=False;
laporan.GroupBox1.Top:=0;
laporan.GroupBox1.Left:=0;
laporan.Height:=195;
laporan.Width:=314;
laporan.Position:=poDesktopCenter;
laporan.Show;
home.Enabled:=False;
end;

procedure Thome.RekapTransaksiBulanan1Click(Sender: TObject);
begin
laporan.GroupBox1.Visible:=False;
laporan.GroupBox2.Visible:=True;
laporan.GroupBox3.Visible:=False;
laporan.GroupBox2.Top:=0;
laporan.GroupBox2.Left:=0;
laporan.Height:=195;
laporan.Width:=314;
laporan.Position:=poDesktopCenter;
laporan.Show;
home.Enabled:=False;
end;

procedure Thome.RekapTransaksiTahunan1Click(Sender: TObject);
begin
laporan.GroupBox1.Visible:=False;
laporan.GroupBox2.Visible:=False;
laporan.GroupBox3.Visible:=True;
laporan.GroupBox3.Top:=0;
laporan.GroupBox3.Left:=0;
laporan.Height:=195;
laporan.Width:=314;
laporan.Position:=poDesktopCenter;
laporan.Show;
home.Enabled:=False;
end;

procedure Thome.ReturPembelian1Click(Sender: TObject);
begin
  returbeli.Showmodal;
end;

procedure Thome.ReturPenjualan1Click(Sender: TObject);
begin
  returjual.Showmodal;
end;

procedure Thome.RekapSparepartKeluar1Click(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_servis, tb_sparepart where tb_servis.no=tb_sparepart.no and tb_sparepart.no!='+'"SP-0000/00"'+'order by tb_sparepart.no asc';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QRLabel70.Caption:='DATA SPAREPART KELUAR';
      laporan.QRLabel74.Caption:='No Servis';
      laporan.QRLabel73.Caption:='Tanggal Keluar';
      laporan.QRDBText22.DataField:='no_servis';
      laporan.QuickRep11.Preview;
  end;
end;

procedure Thome.RekapSparepartMasuk1Click(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_sparepartmasuk';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QRLabel70.Caption:='DATA SPAREPART MASUK';
      laporan.QRLabel74.Caption:='Jumlah Barang';
      laporan.QRLabel73.Caption:='Tanggal Masuk';
      laporan.QRDBText22.DataField:='jumlah';
      laporan.QuickRep11.Preview;
  end;
end;

procedure Thome.DataSparepart2Click(Sender: TObject);
begin
  part.ShowModal;
end;

procedure Thome.DataSparepartMasuk1Click(Sender: TObject);
begin
  partmasuk.ShowModal;
end;

procedure Thome.DataPesanSparepart1Click(Sender: TObject);
begin
  order.ShowModal;
end;

procedure Thome.DataPesanSparepart2Click(Sender: TObject);
begin
  order.ShowModal;
end;

procedure Thome.RekapBarangBelumDiservis1Click(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_barang where keterangan='+'"Belum Diservis"';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QRLabel111.Caption:='Keterangan';
      laporan.QRDBText63.DataField:='keterangan';
      laporan.QuickRep4.Preview;
  end;
end;

procedure Thome.RekapBarangSudahDiservis1Click(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_barang where keterangan='+'"Sudah Diservis"';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QRLabel111.Caption:='Teknisi';
      laporan.QRDBText63.DataField:='teknisi';
      laporan.QuickRep4.Preview;
  end;
end;

procedure Thome.RekapBarangGagalDiservis1Click(Sender: TObject);
begin
with dm1 do
  begin
    ZCon1.Connected:=True;
    ZReport.SQL.Clear;
    ZReport.SQL.Text:='select * from tb_barang where keterangan='+'"Gagal Diservis"';
    ZReport.Active:=True;
    ZReport.Open;
    if ZReport.RecordCount=0 then
      MessageDlg('Data tidak ada',mtWarning,[mbOK],0)
    else
      laporan.QRLabel111.Caption:='Teknisi';
      laporan.QRDBText63.DataField:='teknisi';
      laporan.QuickRep4.Preview;
  end;
end;

end.
