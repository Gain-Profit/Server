object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Update Gain Profit'
  ClientHeight = 416
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object SgApp: TStringGrid
    Left = 0
    Top = 73
    Width = 705
    Height = 289
    Align = alClient
    ColCount = 2
    DefaultColWidth = 100
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 0
    ColWidths = (
      100
      100)
    RowHeights = (
      24
      24)
  end
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 73
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label2: TLabel
      Left = 8
      Top = 43
      Width = 36
      Height = 13
      Caption = 'Expired'
    end
    object Label3: TLabel
      Left = 240
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nama'
    end
    object Label4: TLabel
      Left = 240
      Top = 40
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object EdKode: TEdit
      Left = 56
      Top = 13
      Width = 178
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object EdExpired: TEdit
      Left = 56
      Top = 40
      Width = 178
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object EdNama: TEdit
      Left = 277
      Top = 13
      Width = 419
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object EdAlamat: TEdit
      Left = 277
      Top = 40
      Width = 419
      Height = 21
      Enabled = False
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 397
    Width = 705
    Height = 19
    Panels = <>
  end
  object PnlFooter: TPanel
    Left = 0
    Top = 362
    Width = 705
    Height = 35
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      705
      35)
    object BtnCekUpdate: TButton
      Left = 8
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cek Update'
      TabOrder = 0
      OnClick = BtnCekUpdateClick
    end
    object BtnUpdate: TButton
      Left = 621
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Update'
      TabOrder = 1
    end
  end
end
