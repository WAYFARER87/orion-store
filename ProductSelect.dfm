object ProductSelectForm: TProductSelectForm
  Left = 198
  Top = 124
  Width = 673
  Height = 466
  Caption = 'ProductSelectForm'
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
    Top = 282
    Width = 665
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 60
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 665
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      665
      40)
    object CancelButton: TButton
      Left = 583
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
    object OKButton: TButton
      Left = 499
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      TabStop = False
      OnClick = OKButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 665
    Height = 258
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.ProductSelectDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'Article'
        Footers = <>
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'ProductFullName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1086#1074#1072#1088#1072
        Width = 349
      end
      item
        EditButtons = <>
        FieldName = 'Pack'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077
        Width = 103
      end
      item
        DisplayFormat = '0.##%'
        EditButtons = <>
        FieldName = 'VATRate'
        Footers = <>
        Title.Caption = #1053#1044#1057
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 665
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
      Hint = #1057#1086#1079#1076#1072#1090#1100' (F3)'
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
      Width = 252
      Height = 22
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' (F4)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 285
    Width = 665
    Height = 107
    Align = alBottom
    AutoFitColWidths = True
    DataSource = StoreDataModule.StoreSelectDataSource
    FooterColor = clInactiveCaptionText
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'StoreID'
        Footers = <>
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Width = 81
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Price'
        Footers = <>
        Title.Caption = #1062#1077#1085#1072
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'Qty'
        Footers = <
          item
            ValueType = fvtSum
          end>
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 142
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'CurAmountRemain'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            ValueType = fvtSum
          end>
        Title.Caption = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1072
        Width = 133
      end>
  end
end
