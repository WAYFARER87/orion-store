object PaymentBankForm: TPaymentBankForm
  Left = 193
  Top = 128
  Width = 687
  Height = 414
  Caption = 'PaymentBankForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 679
    Height = 316
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.PaymentBankDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OrderID'
        Footers = <>
        Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
      end
      item
        EditButtons = <>
        FieldName = 'CustomerName'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
        Width = 178
      end
      item
        EditButtons = <>
        FieldName = 'Number'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
      end
      item
        EditButtons = <>
        FieldName = 'Cash'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1073#1077#1079#1085#1072#1083#1080#1095#1085#1099#1081
          #1085#1072#1083#1080#1095#1085#1099#1081)
        Title.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1099
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'Date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        Width = 73
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'TotalPay'
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072
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
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'UserName'
        Footers = <>
        Title.Caption = #1040#1074#1090#1086#1088
        Width = 100
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 340
    Width = 679
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      679
      40)
    object CloseButton: TButton
      Left = 596
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      TabStop = False
      OnClick = CloseButtonClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 679
    Height = 24
    Caption = 'ToolBar1'
    Flat = True
    HotImages = StoreDataModule.ImageList1
    Images = StoreDataModule.ImageList2
    TabOrder = 2
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
    object Edit1: TEdit
      Left = 85
      Top = 0
      Width = 164
      Height = 22
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' (F4)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = Edit1Change
    end
    object ToolButton3: TToolButton
      Left = 249
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object RefreshButton: TToolButton
      Left = 257
      Top = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' (F5)'
      Caption = 'RefreshButton'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = RefreshButtonClick
    end
  end
end
