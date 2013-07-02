object BuyOrderForm: TBuyOrderForm
  Left = 251
  Top = 161
  Width = 871
  Height = 515
  Caption = 'BuyOrderForm'
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
  object Splitter1: TSplitter
    Left = 0
    Top = 308
    Width = 855
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 60
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 855
    Height = 45
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      855
      45)
    object CloseButton: TButton
      Left = 781
      Top = 10
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 855
    Height = 284
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.BuyOrderDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OrderID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'Date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'Number'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'IssueDate'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
        Title.TitleButton = True
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'CustomerName'
        Footers = <>
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Title.TitleButton = True
        Width = 241
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'TotalAmount'
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072
        Title.TitleButton = True
        Width = 84
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'TotalAmountVAT'
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
        Title.TitleButton = True
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'PayDate'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        Title.TitleButton = True
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Pay'
        Footers = <>
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Title.TitleButton = True
        Width = 80
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Debt'
        Footers = <>
        Title.Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'UserName'
        Footers = <>
        Title.Caption = #1040#1074#1090#1086#1088
        Title.TitleButton = True
        Visible = False
        Width = 100
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 311
    Width = 855
    Height = 121
    Align = alBottom
    AutoFitColWidths = True
    DataSource = StoreDataModule.BuyStructureDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh2DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OrderID'
        Footers = <>
        Title.Caption = #8470
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'StoreID'
        Footers = <>
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'ProductFullName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 226
      end
      item
        EditButtons = <>
        FieldName = 'Qty'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Price'
        Footers = <>
        Title.Caption = #1062#1077#1085#1072
      end
      item
        DisplayFormat = '0.##%'
        EditButtons = <>
        FieldName = 'VATRate'
        Footers = <>
        Title.Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
        Width = 68
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'AmountVAT'
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Amount'
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
        Width = 26
      end
      item
        EditButtons = <>
        FieldName = 'RemainQty'
        Footers = <>
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
      end
      item
        EditButtons = <>
        FieldName = 'DivisionName'
        Footers = <>
        Title.Caption = #1057#1082#1083#1072#1076
        Width = 150
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 855
    Height = 24
    Caption = 'ToolBar1'
    Flat = True
    HotImages = StoreDataModule.ImageList1
    Images = StoreDataModule.ImageList2
    TabOrder = 3
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
      Width = 220
      Height = 22
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091' (F4)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = Edit1Change
    end
    object ToolButton3: TToolButton
      Left = 305
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object PayButton: TToolButton
      Left = 313
      Top = 0
      Hint = #1054#1087#1083#1072#1090#1072' (F9)'
      Caption = 'PayButton'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = PayButtonClick
    end
    object ToolButton4: TToolButton
      Left = 336
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object RefreshButton: TToolButton
      Left = 344
      Top = 0
      Caption = 'RefreshButton'
      ImageIndex = 5
      OnClick = RefreshButtonClick
    end
  end
end
