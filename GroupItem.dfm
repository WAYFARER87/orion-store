object GroupItemForm: TGroupItemForm
  Left = 322
  Top = 177
  Width = 474
  Height = 194
  ActiveControl = DBEditEh2
  Caption = 'GroupItemForm'
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
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 449
    Height = 113
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 22
    Height = 13
    Caption = #1050#1086#1076':'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 57
    Height = 13
    Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
  end
  object OKButton: TButton
    Left = 296
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 382
    Top = 128
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
    Left = 144
    Top = 24
    Width = 97
    Height = 21
    DataField = 'GroupID'
    DataSource = StoreDataModule.GroupDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 2
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 144
    Top = 56
    Width = 297
    Height = 21
    DataField = 'GroupName'
    DataSource = StoreDataModule.GroupDataSource
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 144
    Top = 88
    Width = 65
    Height = 21
    DataField = 'Priorit'
    DataSource = StoreDataModule.GroupDataSource
    DecimalPlaces = 0
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
end
