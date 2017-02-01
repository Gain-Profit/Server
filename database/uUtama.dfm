object FUtama: TFUtama
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Utama Not Connected'
  ClientHeight = 193
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 193
    ActivePage = TsKoneksi
    Align = alClient
    TabOrder = 0
    object TsKoneksi: TTabSheet
      Caption = 'Koneksi'
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 22
        Height = 13
        Caption = 'Host'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 19
        Height = 13
        Caption = 'Port'
      end
      object Label3: TLabel
        Left = 8
        Top = 72
        Width = 22
        Height = 13
        Caption = 'User'
      end
      object Label4: TLabel
        Left = 8
        Top = 96
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object EdHost: TEdit
        Left = 64
        Top = 24
        Width = 457
        Height = 21
        TabOrder = 0
        Text = 'localhost'
      end
      object EdPort: TEdit
        Left = 64
        Top = 48
        Width = 457
        Height = 21
        TabOrder = 1
        Text = '3306'
      end
      object EdUser: TEdit
        Left = 64
        Top = 72
        Width = 457
        Height = 21
        TabOrder = 2
        Text = 'root'
      end
      object EdPassword: TEdit
        Left = 64
        Top = 96
        Width = 457
        Height = 21
        PasswordChar = '#'
        TabOrder = 3
      end
      object BtnConnect: TButton
        Left = 400
        Top = 128
        Width = 123
        Height = 25
        Caption = '&Sambungkan'
        TabOrder = 4
        OnClick = BtnConnectClick
      end
    end
    object TsDatabase: TTabSheet
      Caption = 'Database'
      ImageIndex = 1
      object Label5: TLabel
        Left = 8
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Database'
      end
      object Label6: TLabel
        Left = 8
        Top = 48
        Width = 47
        Height = 13
        Caption = 'User Baru'
      end
      object Label7: TLabel
        Left = 8
        Top = 72
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object Label8: TLabel
        Left = 8
        Top = 96
        Width = 85
        Height = 13
        Caption = 'Kode Perusahaan'
      end
      object EdDatabase: TEdit
        Left = 104
        Top = 24
        Width = 417
        Height = 21
        TabOrder = 0
      end
      object EdUserDb: TEdit
        Left = 104
        Top = 48
        Width = 417
        Height = 21
        TabOrder = 1
      end
      object EdPasswordDb: TEdit
        Left = 104
        Top = 72
        Width = 417
        Height = 21
        PasswordChar = '#'
        TabOrder = 2
      end
      object BtnBuat: TButton
        Left = 400
        Top = 128
        Width = 123
        Height = 25
        Caption = 'Buat Database Baru'
        Enabled = False
        TabOrder = 4
        OnClick = BtnBuatClick
      end
      object EdPerusahaan: TEdit
        Left = 104
        Top = 96
        Width = 417
        Height = 21
        TabOrder = 3
      end
    end
  end
  object Con: TmySQLDatabase
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30')
    AfterConnect = ConAfterConnect
    AfterDisconnect = ConAfterDisconnect
    Left = 40
    Top = 24
  end
  object Batch: TMySQLBatchExecute
    Database = Con
    Left = 88
    Top = 24
  end
end
