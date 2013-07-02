object HomeStoreSelectForm: THomeStoreSelectForm
  Left = 305
  Top = 147
  Width = 503
  Height = 353
  Caption = 'HomeStoreSelectForm'
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
    Top = 256
    Width = 495
    Height = 63
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object CancelButton: TButton
      Left = 408
      Top = 16
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'CancelButton'
      TabOrder = 0
      TabStop = False
      OnClick = CancelButtonClick
    end
    object OKButton: TButton
      Left = 312
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OKButton'
      TabOrder = 1
      TabStop = False
      OnClick = OKButtonClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 25
    Width = 495
    Height = 231
    Align = alClient
    DataSource = StoreDataModule.HomeStoreDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'StoreID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'AccountPrice'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RemainQty'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'Amount'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'InitialQty'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'AmountRemain'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'Pack'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CountryID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CCDID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CertificateID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DivisionID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DivisionName'
        Footers = <>
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 495
    Height = 25
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
      Caption = 'InsertButton'
      ImageIndex = 0
      OnClick = InsertButtonClick
    end
    object EditButton: TToolButton
      Left = 31
      Top = 0
      Caption = 'EditButton'
      ImageIndex = 1
      OnClick = EditButtonClick
    end
    object DeleteButton: TToolButton
      Left = 54
      Top = 0
      Caption = 'DeleteButton'
      ImageIndex = 2
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
      TabOrder = 0
    end
  end
end
