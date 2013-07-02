object RegistrationForm: TRegistrationForm
  Left = 297
  Top = 175
  BorderStyle = bsDialog
  Caption = 'RegistrationForm'
  ClientHeight = 150
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
    150)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 465
    Height = 89
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 93
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1060#1080#1088#1084#1072':'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 89
    Height = 13
    Caption = #1050#1086#1076' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
  end
  object Label3: TLabel
    Left = 255
    Top = 68
    Width = 3
    Height = 13
    Caption = '-'
  end
  object Label4: TLabel
    Left = 327
    Top = 68
    Width = 3
    Height = 13
    Caption = '-'
  end
  object OKButton: TButton
    Left = 311
    Top = 115
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 4
    TabStop = False
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 399
    Top = 115
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
    DataField = 'CustomerName'
    DataSource = StoreDataModule.FirmSelectDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 0
    Visible = True
    OnKeyDown = DBEditEh1KeyDown
  end
  object KeyEdit1: TEdit
    Left = 192
    Top = 64
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 1
    OnChange = KeyEdit1Change
  end
  object KeyEdit2: TEdit
    Left = 264
    Top = 64
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 2
    OnChange = KeyEdit2Change
  end
  object KeyEdit3: TEdit
    Left = 336
    Top = 64
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 3
    OnChange = KeyEdit3Change
  end
end
