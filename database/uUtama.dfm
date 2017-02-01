object FUtama: TFUtama
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Utama Not Connected'
  ClientHeight = 338
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 338
    ActivePage = TsKoneksi
    Align = alClient
    TabOrder = 0
    object TsKoneksi: TTabSheet
      Caption = 'Koneksi Dan Database'
      object GbKoneksi: TGroupBox
        Left = 0
        Top = 0
        Width = 529
        Height = 129
        Align = alTop
        Caption = 'Koneksi'
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 96
          Width = 46
          Height = 13
          Caption = 'Password'
        end
        object Label3: TLabel
          Left = 8
          Top = 72
          Width = 22
          Height = 13
          Caption = 'User'
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 19
          Height = 13
          Caption = 'Port'
        end
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object EdPassword: TEdit
          Left = 56
          Top = 96
          Width = 457
          Height = 21
          PasswordChar = '#'
          TabOrder = 3
        end
        object EdUser: TEdit
          Left = 56
          Top = 72
          Width = 457
          Height = 21
          TabOrder = 2
          Text = 'root'
        end
        object EdPort: TEdit
          Left = 56
          Top = 48
          Width = 457
          Height = 21
          TabOrder = 1
          Text = '3306'
        end
        object EdHost: TEdit
          Left = 56
          Top = 24
          Width = 457
          Height = 21
          TabOrder = 0
          Text = 'localhost'
        end
      end
      object GbDb: TGroupBox
        Left = 0
        Top = 129
        Width = 529
        Height = 128
        Align = alTop
        Caption = 'Database Dan User'
        TabOrder = 1
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
          Top = 100
          Width = 85
          Height = 13
          Caption = 'Kode Perusahaan'
        end
        object EdDatabase: TEdit
          Left = 96
          Top = 24
          Width = 417
          Height = 21
          TabOrder = 0
        end
        object EdUserDb: TEdit
          Left = 96
          Top = 48
          Width = 417
          Height = 21
          TabOrder = 1
        end
        object EdPasswordDb: TEdit
          Left = 96
          Top = 72
          Width = 417
          Height = 21
          PasswordChar = '#'
          TabOrder = 2
        end
        object EdPerusahaan: TEdit
          Left = 96
          Top = 96
          Width = 417
          Height = 21
          TabOrder = 3
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 269
        Width = 529
        Height = 41
        Align = alBottom
        TabOrder = 2
        object BtnConnect: TButton
          Left = 320
          Top = 8
          Width = 201
          Height = 25
          Caption = '&Sambungkan Dan Buat Database'
          TabOrder = 0
          OnClick = BtnConnectClick
        end
      end
    end
    object TsDatabase: TTabSheet
      Caption = 'Arsitektur Database'
      ImageIndex = 1
    end
  end
  object Con: TmySQLDatabase
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30')
    AfterConnect = ConAfterConnect
    AfterDisconnect = ConAfterDisconnect
    Left = 488
    Top = 144
  end
end
