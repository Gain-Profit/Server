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
    Tag = 4
    AlignWithMargins = True
    Left = 3
    Top = 82
    Width = 699
    Height = 224
    Align = alClient
    ColCount = 4
    DefaultColWidth = 100
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 0
    OnDrawCell = SgAppDrawCell
    ColWidths = (
      150
      75
      100
      100)
    RowHeights = (
      18
      18)
  end
  object PnlHeader: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 699
    Height = 73
    Align = alTop
    TabOrder = 1
    DesignSize = (
      699
      73)
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
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 2
    end
    object EdAlamat: TEdit
      Left = 277
      Top = 40
      Width = 419
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
    AlignWithMargins = True
    Left = 3
    Top = 359
    Width = 699
    Height = 35
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      699
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
      Left = 615
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Update'
      TabOrder = 1
      OnClick = BtnUpdateClick
    end
  end
  object PnlDownload: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 312
    Width = 699
    Height = 41
    Align = alBottom
    TabOrder = 4
    Visible = False
    object LblDownload: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 691
      Height = 13
      Align = alTop
      Caption = 'Download ...'
      ExplicitWidth = 62
    end
    object PbDownload: TProgressBar
      AlignWithMargins = True
      Left = 4
      Top = 20
      Width = 691
      Height = 17
      Margins.Top = 0
      Align = alBottom
      TabOrder = 0
    end
  end
  object DataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 104
    object DataSetNama: TStringField
      DisplayLabel = 'Nama Applikasi'
      FieldName = 'nama'
      Size = 50
    end
    object DataSetVersi: TStringField
      DisplayLabel = 'Versi Terbaru'
      FieldName = 'versi'
    end
    object DataSetPath: TStringField
      DisplayLabel = 'Path'
      FieldName = 'path'
      Size = 100
    end
    object DataSetDownload: TStringField
      FieldName = 'download'
      Size = 255
    end
    object DataSetMd5: TStringField
      DisplayLabel = 'MD5'
      FieldName = 'md5_file'
      Size = 50
    end
    object DataSetversi_now: TStringField
      DisplayLabel = 'Versi Sekarang'
      FieldName = 'versi_now'
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataSet
    ScopeMappings = <>
    Left = 64
    Top = 8
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = SgApp
      Columns = <
        item
          MemberName = 'nama'
          Width = 150
        end
        item
          MemberName = 'path'
          Width = 75
        end
        item
          MemberName = 'versi_now'
          Width = 100
        end
        item
          MemberName = 'versi'
          Width = 100
        end>
    end
  end
end
