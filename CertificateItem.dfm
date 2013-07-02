object CertificateItemForm: TCertificateItemForm
  Left = 322
  Top = 177
  Width = 463
  Height = 172
  ActiveControl = DBEditEh2
  Caption = 'CertificateItemForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 441
    Height = 89
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 89
    Height = 13
    Caption = #1050#1086#1076' '#1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072
  end
  object Label2: TLabel
    Left = 32
    Top = 72
    Width = 61
    Height = 13
    Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
  end
  object OKButton: TButton
    Left = 288
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 374
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 136
    Top = 32
    Width = 105
    Height = 21
    DataField = 'CertificateID'
    DataSource = StoreDataModule.CertificateDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 136
    Top = 64
    Width = 305
    Height = 21
    DataField = 'CertificateName'
    DataSource = StoreDataModule.CertificateDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
end
