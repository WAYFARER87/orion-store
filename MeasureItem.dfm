object MeasureItemForm: TMeasureItemForm
  Left = 322
  Top = 177
  Width = 474
  Height = 171
  ActiveControl = DBEditEh2
  Caption = 'MeasureItemForm'
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
    137)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 449
    Height = 89
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 104
    Height = 13
    Caption = #1045#1076#1080#1085#1080#1094#1072' '#1048#1079#1084#1077#1088#1077#1085#1080#1103
  end
  object OKButton: TButton
    Left = 296
    Top = 103
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 382
    Top = 103
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 144
    Top = 24
    Width = 97
    Height = 21
    DataField = 'MeasureID'
    DataSource = StoreDataModule.MeasureDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 3
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 144
    Top = 56
    Width = 297
    Height = 21
    DataField = 'MeasureName'
    DataSource = StoreDataModule.MeasureDataSource
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
end
