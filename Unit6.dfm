object FUbahStruktur: TFUbahStruktur
  Left = 0
  Top = 0
  Caption = 'FUbahStruktur'
  ClientHeight = 358
  ClientWidth = 541
  Color = 13420101
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  PopupParent = FStruktur.Owner
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 24
    Top = 144
    Width = 46
    Height = 31
    Caption = 'NIP'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3878170
    Font.Height = -27
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 197
    Width = 66
    Height = 31
    Caption = 'Nama'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3878170
    Font.Height = -27
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 24
    Top = 91
    Width = 80
    Height = 31
    Caption = 'Jabatan'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3878170
    Font.Height = -27
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 104
    Top = 27
    Width = 316
    Height = 31
    Caption = 'FORM UBAH STRUKTUR'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3878170
    Font.Height = -27
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
  end
  object ENip: TEdit
    Left = 208
    Top = 144
    Width = 305
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ENama: TEdit
    Left = 208
    Top = 200
    Width = 305
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object CbJabatan: TComboBox
    Left = 208
    Top = 91
    Width = 305
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = CbJabatanChange
    Items.Strings = (
      'Lurah'
      'Sekertaris'
      'Kasi Pemerintah dan umum'
      'Kasi Trantib'
      'Kasi Ekonomi')
  end
  object BUbah: TButton
    Left = 24
    Top = 281
    Width = 184
    Height = 41
    Caption = 'UBAH'
    Font.Charset = ANSI_CHARSET
    Font.Color = 3878170
    Font.Height = -27
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BUbahClick
  end
  object BBatal: TButton
    Left = 329
    Top = 281
    Width = 184
    Height = 41
    Caption = 'BATAL'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 3878170
    Font.Height = -27
    Font.Name = 'Baskerville Old Face'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BBatalClick
  end
  object ZQuery1: TZQuery
    Connection = FDashboard.ZConnection1
    Params = <>
    Left = 448
    Top = 40
  end
end
