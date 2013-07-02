object ReportOrderSelectForm: TReportOrderSelectForm
  Left = 306
  Top = 148
  Width = 502
  Height = 326
  Caption = 'ReportOrderSelectForm'
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
  object Panel1: TPanel
    Left = 0
    Top = 247
    Width = 494
    Height = 45
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      494
      45)
    object CancelButton: TButton
      Left = 411
      Top = 10
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
      Left = 323
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 1
      TabStop = False
      OnClick = OKButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 494
    Height = 247
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.ReportOrderDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OrderID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'Date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'Number'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'CustomerName'
        Footers = <>
        Title.Caption = #1050#1083#1080#1077#1085#1090
        Width = 199
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'TotalAmount'
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 88
      end>
  end
end
