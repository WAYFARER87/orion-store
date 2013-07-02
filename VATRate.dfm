object VATRateForm: TVATRateForm
  Left = 305
  Top = 147
  Width = 387
  Height = 263
  Caption = 'VATRateForm'
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
    Top = 189
    Width = 379
    Height = 40
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      379
      40)
    object OKButton: TButton
      Left = 212
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      TabStop = False
      OnClick = OKButtonClick
    end
    object CancelButton: TButton
      Left = 296
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
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 379
    Height = 189
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.VATRateDataSource
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'VATRateName'
        Footers = <>
        Title.Caption = #1053#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 158
      end
      item
        DisplayFormat = '0.##%'
        EditButtons = <>
        FieldName = 'VATRate'
        Footers = <>
        Title.Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
        Width = 70
      end>
  end
end
