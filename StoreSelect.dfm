object StoreSelectForm: TStoreSelectForm
  Left = 305
  Top = 147
  Width = 435
  Height = 290
  Caption = 'StoreSelectForm'
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
    Top = 216
    Width = 427
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      427
      40)
    object CancelButton: TButton
      Left = 344
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
      Left = 260
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
    Width = 427
    Height = 216
    Align = alClient
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
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'StoreID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 38
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'Price'
        Footers = <>
        Title.Caption = #1062#1077#1085#1072
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'Qty'
        Footers = <
          item
            ValueType = fvtSum
          end>
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
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
        Width = 88
      end>
  end
end
