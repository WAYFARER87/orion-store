object CountryItemForm: TCountryItemForm
  Left = 372
  Top = 209
  Width = 463
  Height = 181
  ActiveControl = DBEditEh2
  Caption = 'CountryItemForm'
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
  DesignSize = (
    447
    143)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 436
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 60
    Height = 13
    Caption = #1050#1086#1076' '#1057#1090#1088#1072#1085#1099
  end
  object Label2: TLabel
    Left = 32
    Top = 72
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object OKButton: TButton
    Left = 282
    Top = 110
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 368
    Top = 110
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
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
    DataField = 'CountryID'
    DataSource = StoreDataModule.CountryDataSource
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
    DataField = 'CountryName'
    DataSource = StoreDataModule.CountryDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
end
