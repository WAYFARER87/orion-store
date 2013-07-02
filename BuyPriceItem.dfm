object BuyPriceItemForm: TBuyPriceItemForm
  Left = 192
  Top = 107
  Width = 415
  Height = 198
  Caption = 'BuyPriceItemForm'
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
    407
    164)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 393
    Height = 113
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object OKButton: TButton
    Left = 240
    Top = 129
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    TabStop = False
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 326
    Top = 129
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 160
    Top = 16
    Width = 105
    Height = 21
    DataField = 'PriceID'
    DataSource = StoreDataModule.BuyPriceDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 2
    Visible = True
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 160
    Top = 48
    Width = 233
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1058#1080#1087#1072' '#1094#1077#1085#1099' (F3)'
    DataField = 'PriceName'
    DataSource = StoreDataModule.BuyPriceDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBLookupComboboxEh1EditButtons0Click
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 160
    Top = 85
    Width = 121
    Height = 21
    DataField = 'Price'
    DataSource = StoreDataModule.BuyPriceDataSource
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 288
    Top = 16
    Width = 105
    Height = 21
    DataField = 'StoreID'
    DataSource = StoreDataModule.BuyPriceDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    Visible = True
  end
end
