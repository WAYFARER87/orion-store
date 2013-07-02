object StoreItemForm: TStoreItemForm
  Left = 210
  Top = 139
  Width = 482
  Height = 294
  Caption = 'StoreItemForm'
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
    Width = 474
    Height = 220
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 466
        Height = 192
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 16
        Top = 14
        Width = 22
        Height = 13
        Caption = #1050#1086#1076':'
      end
      object Label3: TLabel
        Left = 16
        Top = 43
        Width = 79
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 16
        Top = 73
        Width = 74
        Height = 13
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1062#1077#1085#1072':'
      end
      object Label6: TLabel
        Left = 16
        Top = 162
        Width = 48
        Height = 13
        Caption = #1043#1086#1076#1077#1085' '#1076#1086':'
      end
      object Label2: TLabel
        Left = 288
        Top = 14
        Width = 18
        Height = 13
        Caption = 'SN:'
      end
      object Label8: TLabel
        Left = 16
        Top = 102
        Width = 25
        Height = 13
        Caption = #1043#1058#1044':'
      end
      object Label9: TLabel
        Left = 16
        Top = 132
        Width = 64
        Height = 13
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090':'
      end
      object DBEditEh1: TDBEditEh
        Left = 144
        Top = 11
        Width = 121
        Height = 21
        DataField = 'ProductID'
        DataSource = StoreDataModule.StoreDataSource
        EditButtons = <>
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object DBEditEh3: TDBEditEh
        Left = 144
        Top = 41
        Width = 305
        Height = 21
        DataField = 'ProductFullName'
        DataSource = StoreDataModule.StoreProductDataSource
        EditButtons = <>
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
      object DBNumberEditEh1: TDBNumberEditEh
        Left = 144
        Top = 70
        Width = 121
        Height = 21
        DataField = 'AccountPrice'
        DataSource = StoreDataModule.StoreDataSource
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object DBEditEh2: TDBEditEh
        Left = 328
        Top = 11
        Width = 121
        Height = 21
        DataField = 'Serial'
        DataSource = StoreDataModule.StoreDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 144
        Top = 99
        Width = 249
        Height = 21
        DataField = 'CCDID'
        DataSource = StoreDataModule.StoreDataSource
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBLookupComboboxEh1EditButtons0Click
          end>
        KeyField = 'CCDID'
        ListField = 'CCDName'
        ListSource = StoreDataModule.CCDDataSource
        TabOrder = 4
        Visible = True
        OnKeyDown = DBLookupComboboxEh1KeyDown
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 144
        Top = 128
        Width = 249
        Height = 21
        DataField = 'CertificateID'
        DataSource = StoreDataModule.StoreDataSource
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBLookupComboboxEh2EditButtons0Click
          end>
        KeyField = 'CertificateID'
        ListField = 'CertificateName'
        ListSource = StoreDataModule.CertificateDataSource
        TabOrder = 5
        Visible = True
        OnKeyDown = DBLookupComboboxEh2KeyDown
      end
      object DBDateTimeEditEh1: TDBDateTimeEditEh
        Left = 144
        Top = 160
        Width = 121
        Height = 21
        DataField = 'BeforeDate'
        DataSource = StoreDataModule.StoreDataSource
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 6
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1062#1077#1085#1099
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 24
        Width = 466
        Height = 168
        Align = alClient
        AutoFitColWidths = True
        DataSource = StoreDataModule.PriceDataSource
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PriceName'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1062#1077#1085#1099
            Width = 203
          end
          item
            DisplayFormat = ',0.00 '#1088
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Width = 117
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 466
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
        object ToolButton3: TToolButton
          Left = 85
          Top = 0
          Hint = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1094#1077#1085
          Caption = 'ToolButton3'
          ImageIndex = 5
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080
      ImageIndex = 2
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 466
        Height = 192
        Align = alClient
        AutoFitColWidths = True
        DataSource = StoreDataModule.QtyStoreDataSource
        FooterColor = clInactiveCaptionText
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DivisionName'
            Footers = <>
            Title.Caption = #1057#1082#1083#1072#1076
            Width = 270
          end
          item
            EditButtons = <>
            FieldName = 'Qty'
            Footers = <
              item
                FieldName = 'Qty'
                ValueType = fvtSum
              end>
            Title.Caption = #1054#1089#1090#1072#1090#1086#1082
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 3
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 466
        Height = 192
        Align = alClient
        AutoFitColWidths = True
        DataSource = StoreDataModule.StoreOrderDataSource
        FooterColor = clInactiveCaptionText
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CustomerName'
            Footers = <>
            Title.Caption = #1050#1083#1080#1077#1085#1090
            Width = 163
          end
          item
            EditButtons = <>
            FieldName = 'ProperID'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2'
              '5'
              '6'
              '7'
              '8'
              '9')
            PickList.Strings = (
              #1055#1088#1080#1093#1086#1076
              #1056#1072#1089#1093#1086#1076
              #1056#1072#1089#1093#1086#1076
              #1042#1074#1074#1086#1076' '#1086#1089#1090#1072#1090#1082#1086#1074
              #1048#1079#1083#1080#1096#1082#1080
              #1057#1087#1080#1089#1072#1085#1080#1077
              #1055#1077#1088#1077#1089#1086#1088#1090
              #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077)
            Title.Caption = #1042#1080#1076
          end
          item
            EditButtons = <>
            FieldName = 'Date'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 58
          end
          item
            DisplayFormat = ',0.00 '#1088
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
          end
          item
            EditButtons = <>
            FieldName = 'Qty'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Width = 49
          end
          item
            DisplayFormat = ',0.00 '#1088
            EditButtons = <>
            FieldName = 'Amount'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'Type'
            Footers = <>
            ImageList = StoreDataModule.ImageList3
            KeyList.Strings = (
              '-1'
              '1')
            Title.Caption = #1058#1080#1087
            Width = 29
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 220
    Width = 474
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      474
      40)
    object OKButton: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object CancelButton: TButton
      Left = 390
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = CancelButtonClick
    end
  end
end
