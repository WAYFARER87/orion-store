object PriceItemForm: TPriceItemForm
  Left = 266
  Top = 228
  Width = 425
  Height = 194
  Caption = 'PriceItemForm'
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
  OnShow = FormShow
  DesignSize = (
    417
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 401
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
    Left = 248
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
    OnKeyDown = OKButtonKeyDown
  end
  object CancelButton: TButton
    Left = 334
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 160
    Top = 16
    Width = 105
    Height = 21
    DataField = 'PriceID'
    DataSource = StoreDataModule.PriceDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 160
    Top = 48
    Width = 233
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1058#1080#1087#1072' '#1062#1077#1085' (F3)'
    DataField = 'PriceName'
    DataSource = StoreDataModule.PriceDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBLookupComboboxEh1EditButtons0Click
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnKeyDown = DBLookupComboboxEh1KeyDown
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 160
    Top = 85
    Width = 121
    Height = 21
    DataField = 'Price'
    DataSource = StoreDataModule.PriceDataSource
    DisplayFormat = ',0.00 '#1088
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 288
    Top = 16
    Width = 105
    Height = 21
    DataField = 'StoreID'
    DataSource = StoreDataModule.PriceDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
end
