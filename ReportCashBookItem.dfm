object ReportCashBookItemForm: TReportCashBookItemForm
  Left = 184
  Top = 110
  Width = 636
  Height = 416
  Caption = 'ReportCashBookItemForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 342
    Width = 628
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      628
      40)
    object CancelButton: TButton
      Left = 545
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
      Left = 457
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 1
      TabStop = False
      OnClick = OKButtonClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 25
    Caption = 'ToolBar1'
    Flat = True
    HotImages = StoreDataModule.ImageList1
    Images = StoreDataModule.ImageList2
    TabOrder = 1
    Visible = False
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
      OnClick = InsertButtonClick
    end
    object EditButton: TToolButton
      Left = 31
      Top = 0
      Caption = 'EditButton'
      ImageIndex = 1
    end
    object DeleteButton: TToolButton
      Left = 54
      Top = 0
      Caption = 'DeleteButton'
      ImageIndex = 2
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
    object PayButton: TToolButton
      Left = 257
      Top = 0
      Caption = 'PayButton'
      ImageIndex = 3
    end
    object PrintButton: TToolButton
      Left = 280
      Top = 0
      Caption = 'PrintButton'
      ImageIndex = 4
      OnClick = PrintButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 25
    Width = 628
    Height = 317
    Align = alClient
    AutoFitColWidths = True
    DataSource = ReportDataModule.CashBookItemDataSource
    FooterColor = clWindow
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
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Number'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'Date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'CustomerName'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082'/'#1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Width = 307
      end
      item
        EditButtons = <>
        FieldName = 'Debit'
        Footers = <>
        Title.Caption = #1057#1095#1077#1090
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Receipt'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            FieldName = 'Receipt'
            ValueType = fvtSum
          end>
        Title.Caption = #1055#1088#1080#1093#1086#1076
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Expense'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            FieldName = 'Expense'
            ValueType = fvtSum
          end>
        Title.Caption = #1056#1072#1089#1093#1086#1076
      end>
  end
end
