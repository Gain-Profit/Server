object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Update Gain Profit'
  ClientHeight = 416
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 42
    Width = 684
    Height = 355
    Align = alClient
    ColCount = 1
    DefaultColWidth = 100
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 0
    ColWidths = (
      179)
    RowHeights = (
      24
      24)
  end
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 42
    Align = alTop
    TabOrder = 1
    object BtnCekUpdate: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cek Update'
      TabOrder = 0
      OnClick = BtnCekUpdateClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 397
    Width = 684
    Height = 19
    Panels = <>
  end
  object Client: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://gain-profit-update.firebaseio.com'
    Params = <>
    HandleRedirects = True
    Left = 8
    Top = 144
  end
  object Req: TRESTRequest
    Client = Client
    Params = <>
    Response = Response
    SynchronizedEvents = False
    Left = 56
    Top = 144
  end
  object Response: TRESTResponse
    ContentType = 'application/json'
    Left = 120
    Top = 144
  end
end
