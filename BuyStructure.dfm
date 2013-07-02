object BuyStructureForm: TBuyStructureForm
  Left = 256
  Top = 334
  Width = 434
  Height = 305
  Anchors = [akTop]
  Caption = 'BuyStructureForm'
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
    418
    267)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 13
    Width = 408
    Height = 201
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label2: TLabel
    Left = 24
    Top = 58
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 24
    Top = 92
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object Label4: TLabel
    Left = 24
    Top = 126
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object Label5: TLabel
    Left = 24
    Top = 184
    Width = 40
    Height = 13
    Caption = #1055#1072#1088#1090#1080#1103':'
  end
  object OKButton: TButton
    Left = 257
    Top = 234
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 335
    Top = 234
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 128
    Top = 21
    Width = 105
    Height = 21
    DataField = 'ProductID'
    DataSource = StoreDataModule.BuyStructureDataSource
    DecimalPlaces = 0
    EditButtons = <>
    TabOrder = 2
    Visible = True
    OnEnter = DBNumberEditEh1Enter
    OnExit = DBNumberEditEh1Exit
  end
  object DBEditEh1: TDBEditEh
    Left = 128
    Top = 55
    Width = 273
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1058#1086#1074#1072#1088#1072' (F3)'
    DataField = 'ProductFullName'
    DataSource = StoreDataModule.BuyStructureDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnKeyDown = DBEditEh1KeyDown
  end
  object DBEditEh2: TDBEditEh
    Left = 128
    Top = 176
    Width = 105
    Height = 21
    DataField = 'StoreID'
    DataSource = StoreDataModule.BuyStructureDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    Enabled = False
    ReadOnly = True
    TabOrder = 6
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 128
    Top = 90
    Width = 121
    Height = 21
    DataField = 'Qty'
    DataSource = StoreDataModule.BuyStructureDataSource
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object DBNumberEditEh3: TDBNumberEditEh
    Left = 128
    Top = 125
    Width = 121
    Height = 21
    DataField = 'Price'
    DataSource = StoreDataModule.BuyStructureDataSource
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object RadioGroup1: TRadioGroup
    Left = 272
    Top = 118
    Width = 97
    Height = 57
    Caption = #1053#1044#1057
    ItemIndex = 0
    Items.Strings = (
      #1042#1099#1076#1077#1083#1080#1090#1100
      #1053#1072#1095#1080#1089#1083#1080#1090#1100)
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
end
