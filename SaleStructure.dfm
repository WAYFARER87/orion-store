object SaleStructureForm: TSaleStructureForm
  Left = 324
  Top = 197
  Width = 433
  Height = 292
  Caption = 'SaleStructureForm'
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
    425
    258)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 409
    Height = 217
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
    Width = 40
    Height = 13
    Caption = #1055#1072#1088#1090#1080#1103':'
  end
  object Label6: TLabel
    Left = 24
    Top = 158
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object Label7: TLabel
    Left = 24
    Top = 192
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object Label4: TLabel
    Left = 24
    Top = 126
    Width = 118
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' ('#1091#1087#1072#1082#1086#1074#1086#1082'):'
  end
  object Label5: TLabel
    Left = 272
    Top = 126
    Width = 3
    Height = 13
  end
  object OKButton: TButton
    Left = 256
    Top = 228
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 6
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 342
    Top = 228
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 168
    Top = 21
    Width = 105
    Height = 21
    DataField = 'ProductID'
    DataSource = StoreDataModule.SaleStructureDataSource
    DecimalPlaces = 0
    EditButtons = <>
    TabOrder = 0
    Visible = True
    OnEnter = DBNumberEditEh1Enter
    OnExit = DBNumberEditEh1Exit
  end
  object DBNumberEditEh3: TDBNumberEditEh
    Left = 168
    Top = 155
    Width = 121
    Height = 21
    DataField = 'Qty'
    DataSource = StoreDataModule.SaleStructureDataSource
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 4
    Visible = True
    OnChange = DBNumberEditEh3Change
  end
  object DBEditEh1: TDBEditEh
    Left = 168
    Top = 55
    Width = 241
    Height = 21
    DataField = 'ProductFullName'
    DataSource = StoreDataModule.SaleStructureDataSource
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
    Left = 168
    Top = 89
    Width = 105
    Height = 21
    DataField = 'StoreID'
    DataSource = StoreDataModule.SaleStructureDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    Enabled = False
    ReadOnly = True
    TabOrder = 2
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBNumberEditEh4: TDBNumberEditEh
    Left = 168
    Top = 189
    Width = 121
    Height = 21
    DataField = 'Price'
    DataSource = StoreDataModule.SaleStructureDataSource
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 168
    Top = 123
    Width = 81
    Height = 21
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 3
    Visible = True
    OnExit = DBNumberEditEh2Exit
  end
end
