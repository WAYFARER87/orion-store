object FirmItemForm: TFirmItemForm
  Left = 192
  Top = 107
  Width = 516
  Height = 282
  Caption = 'FirmItemForm'
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
    Width = 500
    Height = 204
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 492
        Height = 176
        Align = alClient
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
        Top = 56
        Width = 79
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Label3: TLabel
        Left = 24
        Top = 88
        Width = 120
        Height = 13
        Caption = #1055#1086#1083#1085#1086#1077' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Label4: TLabel
        Left = 24
        Top = 120
        Width = 34
        Height = 13
        Caption = #1040#1076#1088#1077#1089':'
      end
      object Label5: TLabel
        Left = 24
        Top = 152
        Width = 48
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085':'
      end
      object DBEditEh1: TDBEditEh
        Left = 160
        Top = 16
        Width = 105
        Height = 21
        DataField = 'CustomerID'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object DBEditEh2: TDBEditEh
        Left = 160
        Top = 48
        Width = 233
        Height = 21
        DataField = 'CustomerName'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
        OnExit = DBEditEh2Exit
      end
      object DBEditEh3: TDBEditEh
        Left = 160
        Top = 80
        Width = 329
        Height = 21
        DataField = 'CustomerFullName'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object DBEditEh4: TDBEditEh
        Left = 160
        Top = 112
        Width = 329
        Height = 21
        DataField = 'Address'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object DBEditEh5: TDBEditEh
        Left = 160
        Top = 144
        Width = 153
        Height = 21
        DataField = 'Phone'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 4
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1052#1053#1057
      ImageIndex = 3
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 492
        Height = 176
        Align = alClient
        Shape = bsFrame
      end
      object Label6: TLabel
        Left = 16
        Top = 24
        Width = 61
        Height = 13
        Caption = #1048#1053#1053' / '#1050#1055#1055':'
      end
      object Label9: TLabel
        Left = 16
        Top = 152
        Width = 80
        Height = 13
        Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086':'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 41
        Height = 13
        Caption = #1054#1050#1054#1053#1061':'
      end
      object Label8: TLabel
        Left = 16
        Top = 80
        Width = 34
        Height = 13
        Caption = #1054#1050#1055#1054':'
      end
      object DBEditEh6: TDBEditEh
        Left = 152
        Top = 16
        Width = 153
        Height = 21
        DataField = 'INN'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object DBEditEh7: TDBEditEh
        Left = 328
        Top = 16
        Width = 153
        Height = 21
        DataField = 'KPP'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBEditEh10: TDBEditEh
        Left = 152
        Top = 144
        Width = 329
        Height = 21
        DataField = 'Registration'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        Enabled = False
        TabOrder = 5
        Visible = True
      end
      object DBEditEh8: TDBEditEh
        Left = 152
        Top = 48
        Width = 153
        Height = 21
        DataField = 'OKONH'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object DBEditEh9: TDBEditEh
        Left = 152
        Top = 80
        Width = 153
        Height = 21
        DataField = 'OKPO'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object CheckBox1: TCheckBox
        Left = 152
        Top = 114
        Width = 121
        Height = 17
        Caption = #1055#1088#1077#1076#1087#1088#1080#1085#1080#1084#1072#1090#1077#1083#1100
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
      ImageIndex = 2
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 492
        Height = 176
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
        Width = 83
        Height = 13
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090':'
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 152
        Top = 16
        Width = 329
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1041#1072#1085#1082#1072' (F3)'
        DataField = 'BankID'
        DataSource = StoreDataModule.FirmDataSource
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
        Left = 152
        Top = 48
        Width = 185
        Height = 21
        DataField = 'Account'
        DataSource = StoreDataModule.FirmDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1057#1082#1083#1072#1076
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 24
        Width = 492
        Height = 152
        Align = alClient
        AutoFitColWidths = True
        DataSource = StoreDataModule.DivisionDataSource
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DivisionID'
            Footers = <>
            Title.Caption = #1050#1086#1076
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'DivisionName'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 217
          end
          item
            EditButtons = <>
            FieldName = 'Address'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 259
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 492
        Height = 24
        Caption = 'ToolBar1'
        Flat = True
        HotImages = StoreDataModule.ImageList1
        Images = StoreDataModule.ImageList2
        TabOrder = 1
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          Style = tbsSeparator
        end
        object InsertButton: TToolButton
          Left = 8
          Top = 0
          Hint = #1057#1086#1079#1076#1072#1090#1100' (F2)'
          Caption = 'InsertButton'
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = InsertButtonClick
        end
        object EditButton: TToolButton
          Left = 31
          Top = 0
          Hint = #1048#1079#1084#1077#1085#1080#1090#1100' ('#1054#1090#1082#1088#1099#1090#1100') (F3)'
          Caption = 'EditButton'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = EditButtonClick
        end
        object DeleteButton: TToolButton
          Left = 54
          Top = 0
          Hint = #1059#1076#1072#1083#1080#1090#1100' (F8)'
          Caption = 'DeleteButton'
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = DeleteButtonClick
        end
        object ToolButton2: TToolButton
          Left = 77
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 2
          Style = tbsSeparator
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 204
    Width = 500
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      500
      40)
    object CancelButton: TButton
      Left = 425
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      TabStop = False
      OnClick = CancelButtonClick
    end
    object OKButton: TButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 1
      OnClick = OKButtonClick
    end
  end
end
