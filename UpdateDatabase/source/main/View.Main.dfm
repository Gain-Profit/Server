object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Update Database Gain Profit'
  ClientHeight = 280
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlHeader: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 432
    Height = 186
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label2: TLabel
      Left = 38
      Top = 94
      Width = 36
      Height = 13
      Caption = 'Expired'
    end
    object Label3: TLabel
      Left = 21
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Nama Toko'
    end
    object Label4: TLabel
      Left = 41
      Top = 67
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object Label5: TLabel
      Left = 3
      Top = 148
      Width = 71
      Height = 13
      Caption = 'Versi Sekarang'
    end
    object Label6: TLabel
      Left = 10
      Top = 121
      Width = 64
      Height = 13
      Caption = 'Versi Terbaru'
    end
    object EdKode: TEdit
      Left = 80
      Top = 10
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object EdExpired: TEdit
      Left = 80
      Top = 91
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object EdNama: TEdit
      Left = 80
      Top = 37
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object EdAlamat: TEdit
      Left = 80
      Top = 64
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object EdVersiNew: TEdit
      Left = 80
      Top = 145
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object EdVersiOld: TEdit
      Left = 80
      Top = 118
      Width = 330
      Height = 21
      Enabled = False
      TabOrder = 5
    end
  end
  object PnlFooter: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 242
    Width = 432
    Height = 35
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      432
      35)
    object BtnCekUpdate: TButton
      Left = 267
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cek Update'
      TabOrder = 0
    end
    object BtnUpdate: TButton
      Left = 348
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Update'
      TabOrder = 1
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
    Top = 195
    Width = 432
    Height = 41
    Align = alBottom
    TabOrder = 2
    Visible = False
    object LblDownload: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 424
      Height = 13
      Align = alTop
      Caption = 'Download ...'
      ExplicitWidth = 62
    end
    object PbDownload: TProgressBar
      AlignWithMargins = True
      Left = 4
      Top = 20
      Width = 424
      Height = 17
      Margins.Top = 0
      Align = alBottom
      TabOrder = 0
    end
  end
end
