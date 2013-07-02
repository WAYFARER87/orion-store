object CustomerItemForm: TCustomerItemForm
  Left = 192
  Top = 107
  Width = 511
  Height = 282
  Caption = 'CustomerItemForm'
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 503
    Height = 208
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 495
        Height = 180
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 22
        Height = 13
        Caption = #1050#1086#1076':'
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 79
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 120
        Height = 13
        Caption = #1055#1086#1083#1085#1086#1077' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Label4: TLabel
        Left = 16
        Top = 120
        Width = 34
        Height = 13
        Caption = #1040#1076#1088#1077#1089':'
      end
      object Label5: TLabel
        Left = 16
        Top = 152
        Width = 48
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085':'
      end
      object DBEditEh1: TDBEditEh
        Left = 152
        Top = 16
        Width = 105
        Height = 21
        DataField = 'CustomerID'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object DBEditEh2: TDBEditEh
        Left = 152
        Top = 48
        Width = 233
        Height = 21
        DataField = 'CustomerName'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
        OnExit = DBEditEh2Exit
      end
      object DBEditEh3: TDBEditEh
        Left = 152
        Top = 80
        Width = 329
        Height = 21
        DataField = 'CustomerFullName'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object DBEditEh4: TDBEditEh
        Left = 152
        Top = 112
        Width = 329
        Height = 21
        DataField = 'Address'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object DBEditEh5: TDBEditEh
        Left = 152
        Top = 144
        Width = 153
        Height = 21
        DataField = 'Phone'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 4
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1052#1053#1057
      ImageIndex = 1
      object Bevel4: TBevel
        Left = 0
        Top = 0
        Width = 495
        Height = 180
        Align = alClient
        Shape = bsFrame
      end
      object Label6: TLabel
        Left = 16
        Top = 24
        Width = 55
        Height = 13
        Caption = #1048#1053#1053'/'#1050#1055#1055':'
      end
      object Label7: TLabel
        Left = 16
        Top = 54
        Width = 41
        Height = 13
        Caption = #1054#1050#1054#1053#1061':'
      end
      object Label8: TLabel
        Left = 16
        Top = 84
        Width = 34
        Height = 13
        Caption = #1054#1050#1055#1054':'
      end
      object Label9: TLabel
        Left = 16
        Top = 144
        Width = 80
        Height = 13
        Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086':'
      end
      object DBEditEh6: TDBEditEh
        Left = 144
        Top = 16
        Width = 153
        Height = 21
        DataField = 'INN'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object DBEditEh7: TDBEditEh
        Left = 320
        Top = 16
        Width = 153
        Height = 21
        DataField = 'KPP'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBEditEh8: TDBEditEh
        Left = 144
        Top = 46
        Width = 153
        Height = 21
        DataField = 'OKONH'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object DBEditEh9: TDBEditEh
        Left = 144
        Top = 76
        Width = 153
        Height = 21
        DataField = 'OKPO'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object CheckBox1: TCheckBox
        Left = 144
        Top = 114
        Width = 121
        Height = 17
        Caption = #1055#1088#1077#1076#1087#1088#1080#1085#1080#1084#1072#1090#1077#1083#1100
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object DBEditEh10: TDBEditEh
        Left = 144
        Top = 139
        Width = 289
        Height = 21
        DataField = 'Registration'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        Enabled = False
        TabOrder = 5
        Visible = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      ImageIndex = 2
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 495
        Height = 180
        Align = alClient
        Shape = bsFrame
      end
      object Label10: TLabel
        Left = 16
        Top = 24
        Width = 28
        Height = 13
        Caption = #1041#1072#1085#1082':'
      end
      object Label11: TLabel
        Left = 16
        Top = 56
        Width = 84
        Height = 13
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1057#1095#1077#1090':'
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 135
        Top = 16
        Width = 234
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1041#1072#1085#1082#1072' (F3)'
        DataField = 'BankID'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBLookupComboboxEh1EditButtons0Click
          end>
        KeyField = 'BankID'
        ListField = 'BankName'
        ListSource = StoreDataModule.BankDataSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnKeyDown = DBLookupComboboxEh1KeyDown
      end
      object DBEditEh11: TDBEditEh
        Left = 135
        Top = 48
        Width = 233
        Height = 21
        DataField = 'Account'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077
      ImageIndex = 3
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 495
        Height = 80
        Align = alClient
        Shape = bsFrame
      end
      object Label12: TLabel
        Left = 16
        Top = 24
        Width = 45
        Height = 13
        Caption = #1058#1080#1087' '#1062#1077#1085':'
      end
      object Label13: TLabel
        Left = 16
        Top = 56
        Width = 72
        Height = 13
        Caption = #1050#1088#1077#1076#1080#1090' ('#1076#1085#1077#1081'):'
      end
      object Label14: TLabel
        Left = 216
        Top = 56
        Width = 27
        Height = 13
        Caption = #1076#1085#1077#1081'.'
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 144
        Top = 16
        Width = 153
        Height = 21
        DataField = 'PriceID'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        KeyField = 'PriceID'
        ListField = 'PriceName'
        ListSource = StoreDataModule.TypePriceDataSource
        TabOrder = 0
        Visible = True
      end
      object DBEditEh12: TDBEditEh
        Left = 144
        Top = 48
        Width = 57
        Height = 21
        DataField = 'DelayPay'
        DataSource = StoreDataModule.CustomerDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 80
        Width = 495
        Height = 100
        Align = alBottom
        DataField = 'Note'
        DataSource = StoreDataModule.CustomerDataSource
        TabOrder = 2
      end
      object CheckBox2: TCheckBox
        Left = 320
        Top = 18
        Width = 65
        Height = 17
        Caption = #1089' '#1053#1044#1057
        TabOrder = 3
        Visible = False
        OnClick = CheckBox2Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 503
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      503
      40)
    object OKButton: TButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object CancelButton: TButton
      Left = 422
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      TabStop = False
      OnClick = CancelButtonClick
    end
  end
end
