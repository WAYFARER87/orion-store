object VATItemForm: TVATItemForm
  Left = 322
  Top = 177
  Width = 291
  Height = 203
  ActiveControl = DBEditEh2
  Caption = 'VATItemForm'
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
    275
    165)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 265
    Height = 121
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 75
    Height = 13
    Caption = #1050#1086#1076' '#1050#1072#1090#1077#1075#1086#1088#1080#1080
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 63
    Height = 13
    Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
  end
  object OKButton: TButton
    Left = 113
    Top = 135
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 199
    Top = 135
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
    Left = 136
    Top = 24
    Width = 97
    Height = 21
    DataField = 'CategoryID'
    DataSource = StoreDataModule.VATDataSource
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 136
    Top = 56
    Width = 121
    Height = 21
    DataField = 'VATRateName'
    DataSource = StoreDataModule.VATDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    TabOrder = 1
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 136
    Top = 88
    Width = 121
    Height = 21
    DataField = 'Date'
    DataSource = StoreDataModule.VATDataSource
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
end
