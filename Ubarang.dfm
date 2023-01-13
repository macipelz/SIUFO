object barang: Tbarang
  Left = 539
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Data Barang'
  ClientHeight = 408
  ClientWidth = 538
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
    Top = 10
    Width = 87
    Height = 19
    Caption = 'Kode Barang'
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
    Top = 45
    Width = 92
    Height = 19
    Caption = 'Nama Barang'
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
    Top = 109
    Width = 88
    Height = 19
    Caption = 'Kelengkapan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 16
    Top = 174
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
    Left = 16
    Top = 208
    Width = 101
    Height = 19
    Caption = 'Tanggal Masuk'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 352
    Top = 288
    Width = 32
    Height = 13
    Caption = 'Label6'
    Visible = False
  end
  object Label7: TLabel
    Left = 16
    Top = 141
    Width = 40
    Height = 19
    Caption = 'Servis'
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
    Top = 77
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
  object Edit1: TEdit
    Left = 128
    Top = 12
    Width = 97
    Height = 23
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 45
    Width = 225
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 128
    Top = 109
    Width = 265
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Button1: TButton
    Left = 448
    Top = 16
    Width = 75
    Height = 25
    Caption = 'BARU'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 448
    Top = 56
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 448
    Top = 96
    Width = 75
    Height = 25
    Caption = 'EDIT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 136
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 240
    Width = 505
    Height = 153
    DataSource = dm1.Source1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kode_barang'
        Title.Alignment = taCenter
        Title.Caption = 'KD Barang'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_barang'
        Title.Alignment = taCenter
        Title.Caption = 'Nama Barang'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_seri'
        Title.Alignment = taCenter
        Title.Caption = 'No Seri'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kelengkapan'
        Title.Alignment = taCenter
        Title.Caption = 'Kelengkapan'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'servis'
        Title.Alignment = taCenter
        Title.Caption = 'Servis'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'kode_konsumen'
        Title.Alignment = taCenter
        Title.Caption = 'KD Konsumen'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama'
        Title.Alignment = taCenter
        Title.Caption = 'Pemilik Barang'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'tgl_masuk'
        Title.Alignment = taCenter
        Title.Caption = 'Tgl Masuk'
        Visible = True
      end>
  end
  object DateTimePicker1: TDateTimePicker
    Left = 128
    Top = 208
    Width = 97
    Height = 23
    Date = 42032.890838935190000000
    Time = 42032.890838935190000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Edit5: TEdit
    Left = 232
    Top = 174
    Width = 153
    Height = 23
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 175
    Width = 97
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    TabOrder = 6
    OnChange = ComboBox1Change
  end
  object RB1: TRadioButton
    Left = 128
    Top = 144
    Width = 113
    Height = 17
    Caption = 'Servis Langsung'
    TabOrder = 4
    OnClick = RB1Click
  end
  object RB2: TRadioButton
    Left = 264
    Top = 144
    Width = 113
    Height = 17
    Caption = 'Penitipan Servis'
    TabOrder = 5
    OnClick = RB2Click
  end
  object Edit4: TEdit
    Left = 128
    Top = 80
    Width = 225
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button5: TButton
    Left = 448
    Top = 200
    Width = 75
    Height = 25
    Caption = 'NEXT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = Button5Click
  end
end
