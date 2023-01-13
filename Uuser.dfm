object user: Tuser
  Left = 632
  Top = 241
  BorderStyle = bsDialog
  Caption = 'Pengaturan'
  ClientHeight = 311
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 387
    Height = 311
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Data User'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 64
        Top = 147
        Width = 30
        Height = 19
        Caption = 'User'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 64
        Top = 181
        Width = 65
        Height = 19
        Caption = 'Password'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 64
        Top = 213
        Width = 35
        Height = 19
        Caption = 'Level'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 152
        Top = 148
        Width = 161
        Height = 23
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 152
        Top = 181
        Width = 161
        Height = 23
        TabOrder = 1
      end
      object Button2: TButton
        Left = 64
        Top = 248
        Width = 75
        Height = 25
        Caption = 'SIMPAN'
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 152
        Top = 248
        Width = 75
        Height = 25
        Caption = 'EDIT'
        Enabled = False
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 240
        Top = 248
        Width = 75
        Height = 25
        Caption = 'HAPUS'
        Enabled = False
        TabOrder = 4
        OnClick = Button4Click
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 8
        Width = 361
        Height = 129
        DataSource = dm1.Source1
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Calibri'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'user'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'password'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'level'
            Width = 85
            Visible = True
          end>
      end
      object ComboBox1: TComboBox
        Left = 152
        Top = 214
        Width = 97
        Height = 23
        ItemHeight = 15
        TabOrder = 6
        Items.Strings = (
          'Admin'
          'Operator')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ubah Password'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label4: TLabel
        Left = 8
        Top = 11
        Width = 30
        Height = 19
        Caption = 'User'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 45
        Width = 101
        Height = 19
        Caption = 'Password Baru'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 77
        Width = 112
        Height = 19
        Caption = 'Ulangi Password'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit3: TEdit
        Left = 136
        Top = 12
        Width = 161
        Height = 26
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 136
        Top = 45
        Width = 161
        Height = 26
        PasswordChar = #8226
        TabOrder = 1
      end
      object Button1: TButton
        Left = 48
        Top = 112
        Width = 75
        Height = 25
        Caption = 'UBAH'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button5: TButton
        Left = 168
        Top = 112
        Width = 75
        Height = 25
        Caption = 'BATAL'
        TabOrder = 3
        OnClick = Button5Click
      end
      object Edit5: TEdit
        Left = 136
        Top = 77
        Width = 161
        Height = 26
        PasswordChar = #8226
        TabOrder = 4
      end
    end
  end
end
