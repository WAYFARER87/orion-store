object DivisionItemForm: TDivisionItemForm
  Left = 192
  Top = 107
  Width = 468
  Height = 218
  Caption = 'DivisionItemForm'
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
    452
    180)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 435
    Height = 121
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 102
    Height = 13
    Caption = #1050#1086#1076' '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object OKButton: TButton
    Left = 292
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 370
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 144
    Top = 24
    Width = 97
    Height = 21
    DataField = 'DivisionID'
    DataSource = StoreDataModule.DivisionDataSource
    EditButtons = <>
    Enabled = False
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 144
    Top = 56
    Width = 297
    Height = 21
    DataField = 'DivisionName'
    DataSource = StoreDataModule.DivisionDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBEditEh3: TDBEditEh
    Left = 144
    Top = 88
    Width = 297
    Height = 21
    DataField = 'Address'
    DataSource = StoreDataModule.DivisionDataSource
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
end
