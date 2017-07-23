object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Update Database Gain Profit'
  ClientHeight = 458
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnlHeader: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 628
    Height = 94
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 606
    DesignSize = (
      628
      94)
    object Label1: TLabel
      Left = 34
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label2: TLabel
      Left = 438
      Top = 13
      Width = 36
      Height = 13
      Caption = 'Expired'
    end
    object Label3: TLabel
      Left = 5
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Nama Toko'
    end
    object Label4: TLabel
      Left = 25
      Top = 67
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object Label5: TLabel
      Left = 403
      Top = 67
      Width = 71
      Height = 13
      Caption = 'Versi Sekarang'
    end
    object Label6: TLabel
      Left = 410
      Top = 40
      Width = 64
      Height = 13
      Caption = 'Versi Terbaru'
    end
    object EdKode: TEdit
      Left = 64
      Top = 10
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object EdExpired: TEdit
      Left = 480
      Top = 10
      Width = 142
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 1
      ExplicitWidth = 120
    end
    object EdNama: TEdit
      Left = 64
      Top = 37
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object EdAlamat: TEdit
      Left = 64
      Top = 64
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object EdVersiNew: TEdit
      Left = 480
      Top = 64
      Width = 142
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 4
      ExplicitWidth = 120
    end
    object EdVersiOld: TEdit
      Left = 480
      Top = 37
      Width = 142
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 5
      ExplicitWidth = 120
    end
  end
  object PnlFooter: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 420
    Width = 628
    Height = 35
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -87
    ExplicitTop = 378
    ExplicitWidth = 699
    DesignSize = (
      628
      35)
    object BtnCekUpdate: TButton
      Left = 463
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cek Update'
      TabOrder = 0
      ExplicitLeft = 534
    end
    object BtnUpdate: TButton
      Left = 544
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Update'
      TabOrder = 1
      ExplicitLeft = 615
    end
    object BtnSetting: TButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Setting'
      TabOrder = 2
    end
  end
  object PnlDownload: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 373
    Width = 628
    Height = 41
    Align = alBottom
    TabOrder = 2
    Visible = False
    ExplicitLeft = -87
    ExplicitTop = 331
    ExplicitWidth = 699
    object LblDownload: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 620
      Height = 13
      Align = alTop
      Caption = 'Download ...'
      ExplicitWidth = 62
    end
    object PbDownload: TProgressBar
      AlignWithMargins = True
      Left = 4
      Top = 20
      Width = 620
      Height = 17
      Margins.Top = 0
      Align = alBottom
      TabOrder = 0
      ExplicitWidth = 691
    end
  end
  object SgDownload: TStringGrid
    Tag = 4
    AlignWithMargins = True
    Left = 3
    Top = 103
    Width = 628
    Height = 264
    Align = alClient
    ColCount = 4
    DefaultColWidth = 100
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 3
    ExplicitTop = 160
    ExplicitWidth = 606
    ExplicitHeight = 207
    ColWidths = (
      150
      75
      100
      100)
    RowHeights = (
      18
      18)
  end
end
