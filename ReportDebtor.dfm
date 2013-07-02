object ReportDebtorForm: TReportDebtorForm
  Left = 184
  Top = 110
  Width = 696
  Height = 480
  Caption = 'ReportDebtorForm'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 266
    Width = 688
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 60
  end
  object Panel1: TPanel
    Left = 0
    Top = 406
    Width = 688
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      688
      40)
    object CloseButton: TButton
      Left = 605
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
    Width = 688
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
      Caption = 'InsertButton'
      ImageIndex = 0
      Visible = False
    end
    object EditButton: TToolButton
      Left = 31
      Top = 0
      Caption = 'EditButton'
      ImageIndex = 1
      Visible = False
    end
    object DeleteButton: TToolButton
      Left = 54
      Top = 0
      Caption = 'DeleteButton'
      ImageIndex = 2
      Visible = False
    end
    object ToolButton2: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
      Visible = False
    end
    object Edit1: TEdit
      Left = 85
      Top = 0
      Width = 252
      Height = 22
      TabStop = False
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = Edit1KeyDown
    end
    object ToolButton3: TToolButton
      Left = 337
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object PayButton: TToolButton
      Left = 345
      Top = 0
      Caption = 'PayButton'
      ImageIndex = 3
      Visible = False
    end
    object PrintButton: TToolButton
      Left = 368
      Top = 0
      Hint = #1055#1077#1095#1072#1090#1100' (F10)'
      Caption = 'PrintButton'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = PrintButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 688
    Height = 242
    Align = alClient
    AutoFitColWidths = True
    DataSource = ReportDataModule.DebtorDataSource
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CustomerID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'CustomerName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 431
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'InitialDebt'
        Footers = <>
        Title.Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1076#1086#1083#1075
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'SumDebt'
        Footers = <>
        Title.Caption = #1044#1086#1083#1075
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 269
    Width = 688
    Height = 137
    Align = alBottom
    AutoFitColWidths = True
    DataSource = ReportDataModule.DebtorOrderDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FrozenCols = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OrderID'
        Footers = <>
        Title.Caption = #1050#1086#1076
      end
      item
        EditButtons = <>
        FieldName = 'Date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'Number'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'TotalAmount'
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072
      end
      item
        EditButtons = <>
        FieldName = 'PayDate'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        Width = 79
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Pay'
        Footers = <>
        Title.Caption = #1054#1087#1083#1072#1090#1072
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Debt'
        Footers = <>
        Title.Caption = #1044#1086#1083#1075
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'ProperID'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1055#1088#1080#1093#1086#1076
          #1056#1072#1089#1093#1086#1076)
        Title.Caption = #1042#1080#1076
        Width = 67
      end>
  end
end
