object dm1: Tdm1
  OldCreateOrder = False
  Left = 1180
  Top = 113
  Height = 250
  Width = 168
  object XP: TXPManifest
    Left = 8
    Top = 104
  end
  object ZCon1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'servis'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'F:\Project\SI Pengelolaan Data Layanan Perbaikan UFO Elektronik\' +
      'libmysql.dll'
    Left = 8
    Top = 8
  end
  object ZLogin: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'select*from tb_user')
    Params = <>
    Left = 56
    Top = 8
  end
  object ZData: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'select*from tb_barang')
    Params = <>
    Left = 104
    Top = 8
  end
  object Source1: TDataSource
    DataSet = ZData
    Left = 104
    Top = 56
  end
  object ZEof: TZQuery
    Connection = ZCon1
    Params = <>
    Left = 8
    Top = 56
  end
  object ZReport: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'SELECT *'
      'FROM tb_kwitansi'
      'LEFT JOIN ('
      ''
      'SELECT tb_servis.no_servis, tb_servis.kerusakan, pelanggan . *'
      'FROM tb_servis'
      'LEFT JOIN ('
      ''
      
        'SELECT tb_konsumen.nama, tb_barang.kode_barang, tb_barang.nama_b' +
        'arang, tb_barang.kelengkapan'
      'FROM tb_konsumen'
      
        'LEFT JOIN tb_barang ON tb_konsumen.kode_konsumen = tb_barang.kod' +
        'e_konsumen'
      ') AS pelanggan ON tb_servis.kode_barang = pelanggan.kode_barang'
      
        ') AS data_servis ON tb_kwitansi.no_servis = data_servis.no_servi' +
        's')
    Params = <>
    Left = 56
    Top = 56
  end
  object ZQCRUD: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'select*from tb_barang')
    Params = <>
    Left = 56
    Top = 104
    object strngfldZQCRUDkode_barang: TStringField
      FieldName = 'kode_barang'
      Required = True
      Size = 12
    end
    object strngfldZQCRUDnama_barang: TStringField
      FieldName = 'nama_barang'
      Required = True
    end
    object strngfldZQCRUDkelengkapan: TStringField
      FieldName = 'kelengkapan'
      Required = True
      Size = 50
    end
    object strngfldZQCRUDkode_konsumen: TStringField
      FieldName = 'kode_konsumen'
      Required = True
      Size = 12
    end
    object dtfldZQCRUDtgl_masuk: TDateField
      FieldName = 'tgl_masuk'
      Required = True
    end
  end
  object ZQAutoNo: TZQuery
    Connection = ZCon1
    Params = <>
    Left = 104
    Top = 104
  end
  object ZStok: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'select * from tb_sparepart')
    Params = <>
    Left = 56
    Top = 152
  end
  object ZBarang: TZQuery
    Connection = ZCon1
    SQL.Strings = (
      'select * from tb_barang')
    Params = <>
    Left = 104
    Top = 152
  end
end
