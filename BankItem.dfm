object BankItemForm: TBankItemForm
  Left = 322
  Top = 177
  Width = 474
  Height = 260
  ActiveControl = DBEditEh2
  Caption = 'BankItemForm'
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
    466
    226)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 449
    Height = 177
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 28
    Width = 56
    Height = 13
    Caption = #1050#1086#1076' '#1041#1072#1085#1082#1072':'
  end
  object Label2: TLabel
    Left = 32
    Top = 60
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 32
    Top = 92
    Width = 34
    Height = 13
    Caption = #1040#1076#1088#1077#1089':'
  end
  object Label4: TLabel
    Left = 32
    Top = 124
    Width = 25
    Height = 13
    Caption = #1041#1048#1050':'
  end
  object Label5: TLabel
    Left = 32
    Top = 156
    Width = 50
    Height = 13
    Caption = #1050#1086#1088'. '#1089#1095#1077#1090':'
  end
  object OKButton: TButton
    Left = 296
    Top = 193
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 382
    Top = 193
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 136
    Top = 20
    Width = 65
    Height = 21
    DataField = 'BankID'
    DataSource = StoreDataModule.BankDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 136
    Top = 52
    Width = 305
    Height = 21
    DataField = 'BankName'
    DataSource = StoreDataModule.BankDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBEditEh3: TDBEditEh
    Left = 136
    Top = 84
    Width = 305
    Height = 21
    DataField = 'Address'
    DataSource = StoreDataModule.BankDataSource
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object DBEditEh4: TDBEditEh
    Left = 136
    Top = 116
    Width = 193
    Height = 21
    DataField = 'BIC'
    DataSource = StoreDataModule.BankDataSource
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object DBEditEh5: TDBEditEh
    Left = 136
    Top = 148
    Width = 193
    Height = 21
    DataField = 'Account'
    DataSource = StoreDataModule.BankDataSource
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
end
