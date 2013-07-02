object CategoryItemForm: TCategoryItemForm
  Left = 322
  Top = 177
  Width = 465
  Height = 228
  Caption = 'CategoryItemForm'
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
    457
    194)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 441
    Height = 145
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 78
    Height = 13
    Caption = #1050#1086#1076' '#1050#1072#1090#1077#1075#1086#1088#1080#1080':'
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 24
    Top = 120
    Width = 66
    Height = 13
    Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057':'
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 82
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074':'
  end
  object OKButton: TButton
    Left = 288
    Top = 161
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 374
    Top = 161
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 144
    Top = 16
    Width = 97
    Height = 21
    DataField = 'CategoryID'
    DataSource = StoreDataModule.CategoryDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 144
    Top = 48
    Width = 289
    Height = 21
    DataField = 'CategoryName'
    DataSource = StoreDataModule.CategoryDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBEditEh4: TDBEditEh
    Left = 144
    Top = 112
    Width = 177
    Height = 21
    DataField = 'VATRateName'
    DataSource = StoreDataModule.CategoryDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh4EditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 3
    Visible = True
    OnKeyDown = DBEditEh4KeyDown
  end
  object DBEditEh3: TDBEditEh
    Left = 144
    Top = 80
    Width = 289
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1043#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074' (F3)'
    DataField = 'GroupName'
    DataSource = StoreDataModule.CategoryDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh3EditButtons0Click
      end
      item
        Style = ebsMinusEh
        OnClick = DBEditEh3EditButtons1Click
      end>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnKeyDown = DBEditEh3KeyDown
  end
end
