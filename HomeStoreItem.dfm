object HomeStoreItemForm: THomeStoreItemForm
  Left = 200
  Top = 179
  Width = 482
  Height = 304
  Caption = 'HomeStoreItemForm'
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
    Height = 230
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 466
        Height = 202
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 24
        Top = 14
        Width = 22
        Height = 13
        Caption = #1050#1086#1076':'
      end
      object Label3: TLabel
        Left = 24
        Top = 45
        Width = 79
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 24
        Top = 75
        Width = 74
        Height = 13
        Caption = #1059#1095#1077#1090#1085#1072#1103' '#1062#1077#1085#1072':'
      end
      object Label2: TLabel
        Left = 288
        Top = 14
        Width = 18
        Height = 13
        Caption = 'SN:'
      end
      object Label5: TLabel
        Left = 24
        Top = 112
        Width = 25
        Height = 13
        Caption = #1043#1058#1044':'
      end
      object Label6: TLabel
        Left = 24
        Top = 144
        Width = 64
        Height = 13
        Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090':'
      end
      object Label7: TLabel
        Left = 24
        Top = 176
        Width = 48
        Height = 13
        Caption = #1043#1086#1076#1077#1085' '#1076#1086':'
      end
      object DBEditEh1: TDBEditEh
        Left = 128
        Top = 11
        Width = 121
        Height = 21
        DataField = 'ProductID'
        DataSource = StoreDataModule.HomeStoreDataSource
        EditButtons = <>
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object DBEditEh3: TDBEditEh
        Left = 128
        Top = 42
        Width = 321
        Height = 21
        DataField = 'ProductFullName'
        DataSource = StoreDataModule.HomeStructureDataSource
        EditButtons = <>
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
      object DBNumberEditEh1: TDBNumberEditEh
        Left = 128
        Top = 71
        Width = 121
        Height = 21
        DataField = 'AccountPrice'
        DataSource = StoreDataModule.HomeStoreDataSource
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
        DataSource = StoreDataModule.HomeStoreDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 128
        Top = 104
        Width = 281
        Height = 21
        DataField = 'CCDID'
        DataSource = StoreDataModule.HomeStoreDataSource
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
        Left = 128
        Top = 136
        Width = 281
        Height = 21
        DataField = 'CertificateID'
        DataSource = StoreDataModule.HomeStoreDataSource
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
        Left = 128
        Top = 168
        Width = 105
        Height = 21
        DataField = 'BeforeDate'
        DataSource = StoreDataModule.HomeStoreDataSource
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
        Height = 178
        Align = alClient
        AutoFitColWidths = True
        DataSource = StoreDataModule.HomePriceDataSource
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
            Width = 187
          end
          item
            DisplayFormat = ',0.00 '#1088
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Width = 91
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
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
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
          Caption = 'ToolButton3'
          ImageIndex = 5
          OnClick = ToolButton3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080
      ImageIndex = 2
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 466
        Height = 202
        Align = alClient
        AutoFitColWidths = True
        DataSource = StoreDataModule.HomeQtyDataSource
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
            Width = 68
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 230
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
