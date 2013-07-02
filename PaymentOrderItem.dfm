object PaymentOrderItemForm: TPaymentOrderItemForm
  Left = 323
  Top = 178
  Width = 411
  Height = 259
  Caption = 'PaymentOrderItemForm'
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
    403
    225)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 385
    Height = 177
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 67
    Height = 13
    Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082':'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088':'
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 82
    Height = 13
    Caption = #1060#1086#1088#1084#1072' '#1054#1087#1083#1072#1090#1099':'
  end
  object Label4: TLabel
    Left = 24
    Top = 128
    Width = 71
    Height = 13
    Caption = #1044#1072#1090#1072' '#1054#1087#1083#1072#1090#1099':'
  end
  object Label5: TLabel
    Left = 24
    Top = 160
    Width = 79
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1054#1087#1083#1072#1090#1099':'
  end
  object OKButton: TButton
    Left = 232
    Top = 192
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 318
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
  object DBEditEh1: TDBEditEh
    Left = 136
    Top = 24
    Width = 249
    Height = 21
    DataField = 'CustomerName'
    DataSource = StoreDataModule.PaymentOrderDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    Enabled = False
    TabOrder = 0
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 136
    Top = 120
    Width = 121
    Height = 21
    DataField = 'Date'
    DataSource = StoreDataModule.PaymentOrderDataSource
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 136
    Top = 152
    Width = 121
    Height = 21
    DataField = 'TotalPay'
    DataSource = StoreDataModule.PaymentOrderDataSource
    DisplayFormat = ',0.00 '#1088
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object DBComboBoxEh1: TDBComboBoxEh
    Left = 136
    Top = 88
    Width = 121
    Height = 21
    DataField = 'Cash'
    DataSource = StoreDataModule.PaymentOrderDataSource
    EditButtons = <>
    Items.Strings = (
      #1073#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081
      #1085#1072#1083#1080#1095#1085#1099#1081)
    KeyItems.Strings = (
      '0'
      '1')
    TabOrder = 2
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 136
    Top = 56
    Width = 121
    Height = 21
    DataField = 'Number'
    DataSource = StoreDataModule.PaymentOrderDataSource
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
end
