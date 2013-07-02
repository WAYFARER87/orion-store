object BankForm: TBankForm
  Left = 305
  Top = 147
  Width = 503
  Height = 353
  Caption = 'BankForm'
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
    Top = 279
    Width = 495
    Height = 40
    Align = alBottom
    TabOrder = 1
    object CancelButton: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = CancelButtonClick
    end
    object OKButton: TButton
      Left = 321
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = OKButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 495
    Height = 255
    Align = alClient
    DataSource = StoreDataModule.BankDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'BankID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'BankName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 301
      end
      item
        EditButtons = <>
        FieldName = 'Address'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 293
      end
      item
        EditButtons = <>
        FieldName = 'Account'
        Footers = <>
        Title.Caption = #1050#1086#1088'. '#1089#1095#1077#1090
      end
      item
        EditButtons = <>
        FieldName = 'BIC'
        Footers = <>
        Title.Caption = #1041#1048#1050
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 495
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
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1053#1072#1080#1084#1077#1085#1086#1074#1085#1080#1102' (F4)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
end
