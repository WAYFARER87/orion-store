object ProducerItemForm: TProducerItemForm
  Left = 322
  Top = 177
  Width = 474
  Height = 171
  ActiveControl = DBEditEh2
  Caption = 'ProducerItemForm'
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
    458
    133)
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
    Width = 104
    Height = 13
    Caption = #1050#1086#1076' '#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103':'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object OKButton: TButton
    Left = 296
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    TabStop = False
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 382
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 152
    Top = 28
    Width = 105
    Height = 21
    DataField = 'ProducerID'
    DataSource = StoreDataModule.ProducerDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 152
    Top = 60
    Width = 297
    Height = 21
    DataField = 'ProducerName'
    DataSource = StoreDataModule.ProducerDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
end
