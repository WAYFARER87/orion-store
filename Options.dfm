object OptionsForm: TOptionsForm
  Left = 297
  Top = 175
  BorderStyle = bsDialog
  Caption = 'OptionsForm'
  ClientHeight = 219
  ClientWidth = 479
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
    479
    219)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 465
    Height = 145
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 93
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1060#1080#1088#1084#1072':'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 88
    Height = 13
    Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099':'
  end
  object Label4: TLabel
    Left = 24
    Top = 136
    Width = 132
    Height = 13
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100' '#1076#1083#1103' '#1056#1086#1079#1085#1080#1094#1099':'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 87
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1057#1082#1083#1072#1076':'
  end
  object OKButton: TButton
    Left = 311
    Top = 168
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 399
    Top = 168
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    TabStop = False
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 192
    Top = 32
    Width = 273
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1060#1080#1088#1084#1099' (F3)'
    DataField = 'CustomerName'
    DataSource = StoreDataModule.FirmSelectDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnEnter = DBEditEh1Enter
    OnExit = DBEditEh1Exit
    OnKeyDown = DBEditEh1KeyDown
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 201
    Width = 479
    Height = 18
    Panels = <
      item
        Width = 50
      end>
  end
  object DBEditEh3: TDBEditEh
    Left = 192
    Top = 96
    Width = 177
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1054#1090#1087#1091#1089#1082#1085#1099#1093' '#1094#1077#1085' (F3)'
    DataField = 'PriceName'
    DataSource = StoreDataModule.TypePriceDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh3EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnEnter = DBEditEh1Enter
    OnExit = DBEditEh1Exit
    OnKeyDown = DBEditEh3KeyDown
  end
  object DBEditEh4: TDBEditEh
    Left = 192
    Top = 128
    Width = 273
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1055#1072#1082#1091#1087#1072#1090#1077#1083#1103' '#1076#1083#1103' '#1056#1086#1079#1085#1080#1094#1099' (F3)'
    DataField = 'CustomerName'
    DataSource = StoreDataModule.CustomerSelectDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh4EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnEnter = DBEditEh1Enter
    OnExit = DBEditEh1Exit
    OnKeyDown = DBEditEh4KeyDown
  end
  object DBEditEh2: TDBEditEh
    Left = 192
    Top = 64
    Width = 273
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1089#1082#1083#1072#1076#1072' (F3)'
    DataField = 'DivisionName'
    DataSource = StoreDataModule.DivisionSelectDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnEnter = DBEditEh1Enter
    OnExit = DBEditEh1Exit
    OnKeyDown = DBEditEh2KeyDown
  end
end
