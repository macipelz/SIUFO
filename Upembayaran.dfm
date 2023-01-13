object pembayaran: Tpembayaran
  Left = 308
  Top = 232
  BorderStyle = bsDialog
  Caption = 'Transaksi Pembayaran'
  ClientHeight = 319
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 109
    Height = 19
    Caption = 'Nomor Kwitansi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 16
    Top = 77
    Width = 48
    Height = 19
    Caption = 'Barang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 16
    Top = 141
    Width = 50
    Height = 19
    Caption = 'Pemilik'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 352
    Top = 13
    Width = 52
    Height = 19
    Caption = 'Tanggal'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 16
    Top = 46
    Width = 92
    Height = 19
    Caption = 'Nomor Servis'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 16
    Top = 174
    Width = 71
    Height = 19
    Caption = 'Kerusakan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 16
    Top = 270
    Width = 33
    Height = 19
    Caption = 'Kasir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 16
    Top = 206
    Width = 81
    Height = 19
    Caption = 'Biaya Servis'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 264
    Top = 206
    Width = 121
    Height = 19
    Caption = '+ Biaya Sparepart'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 16
    Top = 238
    Width = 34
    Height = 19
    Caption = 'Total'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 16
    Top = 109
    Width = 50
    Height = 19
    Caption = 'No Seri'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 392
    Top = 230
    Width = 133
    Height = 15
    Caption = '( Tidak Ganti Sparepart )'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label13: TLabel
    Left = 296
    Top = 264
    Width = 38
    Height = 13
    Caption = 'Label13'
    Visible = False
  end
  object Edit1: TEdit
    Left = 136
    Top = 14
    Width = 97
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 136
    Top = 77
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 136
    Top = 141
    Width = 185
    Height = 21
    TabOrder = 4
  end
  object Button1: TButton
    Left = 440
    Top = 72
    Width = 75
    Height = 25
    Caption = 'BARU'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 440
    Top = 104
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 440
    Top = 136
    Width = 75
    Height = 25
    Caption = 'CETAK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = Button3Click
  end
  object Edit7: TEdit
    Left = 136
    Top = 174
    Width = 225
    Height = 21
    TabOrder = 5
  end
  object Edit8: TEdit
    Left = 136
    Top = 206
    Width = 121
    Height = 21
    TabOrder = 6
    OnChange = Edit8Change
  end
  object Edit9: TEdit
    Left = 136
    Top = 270
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 9
  end
  object ComboBox1: TComboBox
    Left = 136
    Top = 47
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object DateTimePicker1: TDateTimePicker
    Left = 416
    Top = 14
    Width = 97
    Height = 23
    Date = 42045.840469108800000000
    Time = 42045.840469108800000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object Edit4: TEdit
    Left = 392
    Top = 208
    Width = 129
    Height = 21
    ReadOnly = True
    TabOrder = 7
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 136
    Top = 240
    Width = 121
    Height = 21
    TabOrder = 8
    OnChange = Edit5Change
  end
  object Edit6: TEdit
    Left = 136
    Top = 112
    Width = 185
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Edit10: TEdit
    Left = 376
    Top = 272
    Width = 41
    Height = 21
    TabOrder = 14
    Visible = False
    OnChange = Edit10Change
  end
  object Edit11: TEdit
    Left = 424
    Top = 272
    Width = 41
    Height = 21
    TabOrder = 15
    Visible = False
    OnChange = Edit11Change
  end
  object Edit12: TEdit
    Left = 472
    Top = 272
    Width = 49
    Height = 21
    TabOrder = 16
    Visible = False
    OnChange = Edit12Change
  end
end
