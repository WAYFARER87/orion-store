object ReportCirculateForm: TReportCirculateForm
  Left = 183
  Top = 107
  Width = 826
  Height = 510
  Caption = 'ReportCirculateForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 436
    Width = 818
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      818
      40)
    object CloseButton: TButton
      Left = 732
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = CloseButtonClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 818
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
    object SaveButton: TToolButton
      Left = 8
      Top = 0
      Caption = 'SaveButton'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = False
      OnClick = SaveButtonClick
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object Edit1: TEdit
      Left = 39
      Top = 0
      Width = 204
      Height = 22
      TabOrder = 0
      OnChange = Edit1Change
    end
    object ToolButton3: TToolButton
      Left = 243
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object PrintButton: TToolButton
      Left = 251
      Top = 0
      Caption = 'PrintButton'
      ImageIndex = 4
      OnClick = PrintButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 818
    Height = 412
    Align = alClient
    AutoFitColWidths = True
    DataSource = ReportDataModule.CirculateDataSource
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'ProductFullName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 247
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'AccountPrice'
        Footers = <>
        Title.Caption = #1059#1095#1077#1090#1085#1072#1103' '#1094#1077#1085#1072
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'TopQty'
        Footers = <
          item
            FieldName = 'TopQty'
            ValueType = fvtSum
          end>
        Title.Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1085#1072#1095#1072#1083#1086'|'#1050#1086#1083'-'#1074#1086
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'TopAmount'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            FieldName = 'TopAmount'
            ValueType = fvtSum
          end>
        Title.Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1085#1072#1095#1072#1083#1086'|'#1057#1091#1084#1084#1072
      end
      item
        EditButtons = <>
        FieldName = 'ReceiptQty'
        Footers = <
          item
            FieldName = 'ReceiptQty'
            ValueType = fvtSum
          end>
        Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1050#1086#1083'-'#1074#1086
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'ReceiptAmount'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            FieldName = 'ReceiptAmount'
            ValueType = fvtSum
          end>
        Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1057#1091#1084#1084#1072
      end
      item
        EditButtons = <>
        FieldName = 'ExpenseQty'
        Footers = <
          item
            FieldName = 'ExpenseQty'
            ValueType = fvtSum
          end>
        Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1050#1086#1083'-'#1074#1086
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'ExpenseAmount'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            FieldName = 'ExpenseAmount'
            ValueType = fvtSum
          end>
        Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1057#1091#1084#1084#1072
      end
      item
        EditButtons = <>
        FieldName = 'BottomQty'
        Footers = <
          item
            FieldName = 'BottomQty'
            ValueType = fvtSum
          end>
        Title.Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1082#1086#1085#1077#1094'|'#1050#1086#1083'-'#1074#1086
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'BottomAmount'
        Footers = <
          item
            DisplayFormat = ',0.00 '#1088
            FieldName = 'BottomAmount'
            ValueType = fvtSum
          end>
        Title.Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1082#1086#1085#1077#1094'|'#1057#1091#1084#1084#1072
      end>
  end
end
