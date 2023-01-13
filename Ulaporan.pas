unit Ulaporan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, QuickRpt, QRCtrls, jpeg;

type
  Tlaporan = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    QuickRep1: TQuickRep;
    QRBand22: TQRBand;
    QRLabel82: TQRLabel;
    QRShape8: TQRShape;
    QRImage8: TQRImage;
    QRLabel83: TQRLabel;
    QRBand23: TQRBand;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRBand24: TQRBand;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRExpr5: TQRExpr;
    TabSheet3: TTabSheet;
    QuickRep2: TQuickRep;
    QRBand25: TQRBand;
    QRLabel90: TQRLabel;
    QRShape9: TQRShape;
    QRImage9: TQRImage;
    QRLabel91: TQRLabel;
    QRBand26: TQRBand;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRBand27: TQRBand;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRExpr6: TQRExpr;
    TabSheet4: TTabSheet;
    QuickRep3: TQuickRep;
    QRBand28: TQRBand;
    QRLabel98: TQRLabel;
    QRShape10: TQRShape;
    QRImage10: TQRImage;
    QRLabel99: TQRLabel;
    QRBand29: TQRBand;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRBand30: TQRBand;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRExpr7: TQRExpr;
    TabSheet5: TTabSheet;
    QuickRep4: TQuickRep;
    QRBand31: TQRBand;
    QRLabel106: TQRLabel;
    QRBand32: TQRBand;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRBand33: TQRBand;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRImage11: TQRImage;
    TabSheet6: TTabSheet;
    QuickRep5: TQuickRep;
    QRBand34: TQRBand;
    QRLabel113: TQRLabel;
    QRImage12: TQRImage;
    QRBand35: TQRBand;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRBand36: TQRBand;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    TabSheet7: TTabSheet;
    QuickRep6: TQuickRep;
    QRBand37: TQRBand;
    QRLabel118: TQRLabel;
    QRImage13: TQRImage;
    QRBand38: TQRBand;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRBand39: TQRBand;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRBand40: TQRBand;
    QRExpr8: TQRExpr;
    TabSheet8: TTabSheet;
    QuickRep7: TQuickRep;
    QRBand41: TQRBand;
    QRImage14: TQRImage;
    QRLabel122: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    TabSheet9: TTabSheet;
    QuickRep8: TQuickRep;
    QRBand42: TQRBand;
    QRShape13: TQRShape;
    QRLabel139: TQRLabel;
    QRImage15: TQRImage;
    QRShape14: TQRShape;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText83: TQRDBText;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    QuickRepOrder: TQuickRep;
    QRBand43: TQRBand;
    QRImage16: TQRImage;
    QRLabel163: TQRLabel;
    QRShape15: TQRShape;
    QRLabel165: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QuickRep10: TQuickRep;
    QRBand2: TQRBand;
    QRImage2: TQRImage;
    QRLabel18: TQRLabel;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrdbtxtno_seribaru: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText15: TQRDBText;
    QuickRep9: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbtxtbarang: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    qrdbtxtno_returjual: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape2: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel55: TQRLabel;
    QRShape4: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel62: TQRLabel;
    qrdbtxtnama_barang: TQRDBText;
    QRLabel57: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    TabSheet13: TTabSheet;
    QuickRep11: TQuickRep;
    QRBand6: TQRBand;
    QRLabel70: TQRLabel;
    QRImage3: TQRImage;
    QRBand7: TQRBand;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRBand8: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand9: TQRBand;
    QRDBText22: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  laporan: Tlaporan;

implementation

uses menu, dm, StrUtils;

{$R *.dfm}

procedure Tlaporan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  home.Enabled:=True;
end;

procedure Tlaporan.FormShow(Sender: TObject);
begin
  //TabSheet1.TabVisible:=False;
  TabSheet2.TabVisible:=False;
  TabSheet3.TabVisible:=False;
  TabSheet4.TabVisible:=False;
  TabSheet5.TabVisible:=False;
  TabSheet6.TabVisible:=False;
  TabSheet7.TabVisible:=False;
  TabSheet8.TabVisible:=False;
  TabSheet9.TabVisible:=False;
  TabSheet10.TabVisible:=False;
  TabSheet11.TabVisible:=False;
  TabSheet12.TabVisible:=False;
  TabSheet13.TabVisible:=False;
  DateTimePicker1.Date:=Now;
  DateTimePicker2.Date:=Now;
  ComboBox1.ItemIndex:=StrToInt(FormatDateTime('mm',Now))-1;
  ComboBox2.text:=IntToStr(StrToInt(FormatDateTime('yyyy',Now)));
  Edit1.Text:=IntToStr(StrToInt(FormatDateTime('yyyy',Now)));
end;

procedure Tlaporan.Button1Click(Sender: TObject);
begin
   dm1.ZReport.Active:=False;
   dm1.ZReport.SQL.Clear;
   dm1.ZReport.SQL.Add('SELECT * FROM tb_kwitansi LEFT JOIN (SELECT tb_servis.no_servis, tb_servis.kerusakan, pelanggan. *');
   dm1.ZReport.SQL.Add('FROM tb_servis LEFT JOIN (SELECT tb_konsumen.nama, tb_barang.kode_barang, tb_barang.nama_barang, tb_barang.kelengkapan');
   dm1.ZReport.SQL.Add('FROM tb_konsumen LEFT JOIN tb_barang ON tb_konsumen.kode_konsumen = tb_barang.kode_konsumen) AS pelanggan');
   dm1.ZReport.SQL.Add('ON tb_servis.kode_barang = pelanggan.kode_barang) AS data_servis ON tb_kwitansi.no_servis = data_servis.no_servis');
   dm1.ZReport.SQL.Add('where tgl_kwitansi >= "'+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+'" and tgl_kwitansi <= "'+FormatDateTime('yyyy-mm-dd',DateTimePicker2.Date)+'"');
   dm1.ZReport.Active:=True;
   if dm1.ZReport.RecordCount>0 then
    begin
      QRLabel83.Caption:='Tanggal  :  '+FormatDateTime('dd mmm yyyy',DateTimePicker1.Date)+' s/d '+ FormatDateTime('dd mmm yyyy',DateTimePicker2.Date);
      QuickRep1.Preview;
    end
   else
      MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

procedure Tlaporan.Button3Click(Sender: TObject);
begin
   dm1.ZReport.Active:=False;
   dm1.ZReport.SQL.Clear;
   dm1.ZReport.SQL.Add('SELECT * FROM tb_kwitansi LEFT JOIN (SELECT tb_servis.no_servis, tb_servis.kerusakan, pelanggan. *');
   dm1.ZReport.SQL.Add('FROM tb_servis LEFT JOIN (SELECT tb_konsumen.nama, tb_barang.kode_barang, tb_barang.nama_barang, tb_barang.kelengkapan');
   dm1.ZReport.SQL.Add('FROM tb_konsumen LEFT JOIN tb_barang ON tb_konsumen.kode_konsumen = tb_barang.kode_konsumen) AS pelanggan');
   dm1.ZReport.SQL.Add('ON tb_servis.kode_barang = pelanggan.kode_barang) AS data_servis ON tb_kwitansi.no_servis = data_servis.no_servis');
   dm1.ZReport.SQL.Add('where tgl_kwitansi >= "'+ComboBox2.Text+'-'+RightStr('0'+IntToStr(ComboBox1.ItemIndex+1),2)+'-%"');
   dm1.ZReport.Active:=True;
   if dm1.ZReport.RecordCount>0 then
    begin
      QRLabel91.Caption:='Bulan : '+ComboBox1.Text+'    Tahun : '+ ComboBox2.Text;
      QuickRep2.Preview;
    end
   else
      MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

procedure Tlaporan.Button5Click(Sender: TObject);
begin
   dm1.ZReport.Active:=False;
   dm1.ZReport.SQL.Clear;
   dm1.ZReport.SQL.Add('SELECT * FROM tb_kwitansi LEFT JOIN (SELECT tb_servis.no_servis, tb_servis.kerusakan, pelanggan. *');
   dm1.ZReport.SQL.Add('FROM tb_servis LEFT JOIN (SELECT tb_konsumen.nama, tb_barang.kode_barang, tb_barang.nama_barang, tb_barang.kelengkapan');
   dm1.ZReport.SQL.Add('FROM tb_konsumen LEFT JOIN tb_barang ON tb_konsumen.kode_konsumen = tb_barang.kode_konsumen) AS pelanggan');
   dm1.ZReport.SQL.Add('ON tb_servis.kode_barang = pelanggan.kode_barang) AS data_servis ON tb_kwitansi.no_servis = data_servis.no_servis');
   dm1.ZReport.SQL.Add('where tgl_kwitansi like "'+Edit1.Text+'-%-%"');
   dm1.ZReport.Active:=True;
   if dm1.ZReport.RecordCount>0 then
    begin
      QRLabel99.Caption:='Tahun : '+Edit1.Text;
      QuickRep3.Preview;
    end
   else
      MessageDlg('Data tidak ada',mtInformation,[mbOK],0);
end;

procedure Tlaporan.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure Tlaporan.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure Tlaporan.Button6Click(Sender: TObject);
begin
  Close;
end;

end.
