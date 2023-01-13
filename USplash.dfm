object FSplash: TFSplash
  Left = 450
  Top = 333
  BorderStyle = bsNone
  ClientHeight = 145
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 434
    Height = 55
    Caption = 'UFO ELEKTRONIK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -48
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 16
    Top = 112
    Width = 7
    Height = 16
    Alignment = taCenter
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 80
    Width = 433
    Height = 25
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
  end
end
