object HomeStructureForm: THomeStructureForm
  Left = 213
  Top = 186
  Width = 432
  Height = 257
  Caption = 'HomeStructureForm'
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
    424
    223)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 409
    Height = 177
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
    Top = 64
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label5: TLabel
    Left = 24
    Top = 160
    Width = 40
    Height = 13
    Caption = #1055#1072#1088#1090#1080#1103':'
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object Label4: TLabel
    Left = 24
    Top = 120
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object OKButton: TButton
    Left = 256
    Top = 192
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 342
    Top = 192
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 128
    Top = 21
    Width = 105
    Height = 21
    DataField = 'ProductID'
    DataSource = StoreDataModule.HomeStructureDataSource
    DecimalPlaces = 0
    EditButtons = <>
    TabOrder = 0
    Visible = True
    OnEnter = DBNumberEditEh1Enter
    OnExit = DBNumberEditEh1Exit
  end
  object DBEditEh1: TDBEditEh
    Left = 128
    Top = 56
    Width = 273
    Height = 21
    DataField = 'ProductFullName'
    DataSource = StoreDataModule.HomeStructureDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 1
    Visible = True
    OnKeyDown = DBEditEh1KeyDown
  end
  object DBEditEh2: TDBEditEh
    Left = 128
    Top = 152
    Width = 105
    Height = 21
    DataField = 'StoreID'
    DataSource = StoreDataModule.HomeStructureDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    Enabled = False
    ReadOnly = True
    TabOrder = 4
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 128
    Top = 85
    Width = 121
    Height = 21
    DataField = 'Qty'
    DataSource = StoreDataModule.HomeStructureDataSource
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object DBNumberEditEh3: TDBNumberEditEh
    Left = 128
    Top = 117
    Width = 121
    Height = 21
    DataField = 'Price'
    DataSource = StoreDataModule.HomeStructureDataSource
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
end
