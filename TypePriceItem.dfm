object TypePriceItemForm: TTypePriceItemForm
  Left = 322
  Top = 177
  Width = 471
  Height = 208
  ActiveControl = DBEditEh2
  Caption = 'TypePriceItemForm'
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
  DesignSize = (
    463
    174)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 449
    Height = 129
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 28
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label2: TLabel
    Left = 32
    Top = 57
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 32
    Top = 86
    Width = 47
    Height = 13
    Caption = #1053#1072#1094#1077#1085#1082#1072':'
  end
  object Label4: TLabel
    Left = 32
    Top = 116
    Width = 71
    Height = 13
    Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1100' '#1076#1086':'
  end
  object OKButton: TButton
    Left = 296
    Top = 143
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 382
    Top = 143
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 136
    Top = 20
    Width = 105
    Height = 21
    DataField = 'PriceID'
    DataSource = StoreDataModule.TypePriceDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 136
    Top = 49
    Width = 305
    Height = 21
    DataField = 'PriceName'
    DataSource = StoreDataModule.TypePriceDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 136
    Top = 78
    Width = 73
    Height = 21
    DataField = 'Markup'
    DataSource = StoreDataModule.TypePriceDataSource
    DisplayFormat = '0.##%'
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 136
    Top = 108
    Width = 73
    Height = 21
    DataField = 'Round'
    DataSource = StoreDataModule.TypePriceDataSource
    DisplayFormat = ',0.00 '#1088
    EditButtons = <>
    MinValue = 0.010000000000000000
    TabOrder = 5
    Visible = True
  end
end
