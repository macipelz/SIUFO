unit dm;

interface

uses
  SysUtils, Classes, XPMan, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection;

type
  Tdm1 = class(TDataModule)
    XP: TXPManifest;
    ZCon1: TZConnection;
    ZLogin: TZQuery;
    ZData: TZQuery;
    Source1: TDataSource;
    ZEof: TZQuery;
    ZReport: TZQuery;
    ZQCRUD: TZQuery;
    ZQAutoNo: TZQuery;
    strngfldZQCRUDkode_barang: TStringField;
    strngfldZQCRUDnama_barang: TStringField;
    strngfldZQCRUDkelengkapan: TStringField;
    strngfldZQCRUDkode_konsumen: TStringField;
    dtfldZQCRUDtgl_masuk: TDateField;
    ZStok: TZQuery;
    ZBarang: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{$R *.dfm}

end.
