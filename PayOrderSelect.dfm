object PayOrderSelectForm: TPayOrderSelectForm
  Left = 306
  Top = 148
  Width = 644
  Height = 421
  Caption = 'PayOrderSelectForm'
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
    Top = 347
    Width = 636
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      636
      40)
    object CancelButton: TButton
      Left = 553
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
      Left = 467
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 636
    Height = 347
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.PayOrderSelectDataSource
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
    OnDblClick = DBGridEh1DblClick
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
      end
      item
        EditButtons = <>
        FieldName = 'PayDate'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        Width = 71
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Pay'
        Footers = <>
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Width = 81
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Debt'
        Footers = <>
        Title.Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
        Width = 85
      end>
  end
end
