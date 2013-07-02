object StoreForm: TStoreForm
  Left = 192
  Top = 107
  Width = 674
  Height = 462
  Caption = 'StoreForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 260
    Width = 666
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 60
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 666
    Height = 236
    Align = alClient
    AutoFitColWidths = True
    DataSource = StoreDataModule.StoreProductDataSource
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 0
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
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'Article'
        Footers = <>
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'ProductFullName'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 292
      end
      item
        EditButtons = <>
        FieldName = 'MeasureName'
        Footers = <>
        Title.Caption = #1045#1076'. '#1048#1079#1084'.'
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'ProducerName'
        Footers = <>
        Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Width = 185
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 263
    Width = 666
    Height = 125
    Align = alBottom
    AutoFitColWidths = True
    DataSource = StoreDataModule.StoreQtyDataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clInactiveCaptionText
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ParentFont = False
    ReadOnly = True
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDrawColumnCell = DBGridEh2DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ProductID'
        Footers = <>
        Title.Caption = #8470
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'StoreID'
        Footers = <>
        Title.Caption = #1050#1086#1076
      end
      item
        DisplayFormat = ',0.00 '#1088
        EditButtons = <>
        FieldName = 'AccountPrice'
        Footers = <>
        Title.Caption = #1059#1095#1077#1090#1085#1072#1103' '#1094#1077#1085#1072
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'Qty'
        Footers = <
          item
            FieldName = 'Qty'
            ValueType = fvtSum
          end>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'DivisionName'
        Footers = <>
        Title.Caption = #1057#1082#1083#1072#1076
        Width = 274
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 388
    Width = 666
    Height = 40
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      666
      40)
    object CloseButton: TButton
      Left = 581
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
    object CheckBox1: TCheckBox
      Left = 15
      Top = 15
      Width = 138
      Height = 17
      TabStop = False
      Caption = #1053#1091#1083#1077#1074#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 666
    Height = 24
    Caption = 'ToolBar1'
    Flat = True
    HotImages = StoreDataModule.ImageList1
    Images = StoreDataModule.ImageList2
    TabOrder = 3
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object EditButton: TToolButton
      Left = 8
      Top = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' ('#1054#1090#1082#1088#1099#1090#1100') (F3)'
      Caption = 'EditButton'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = EditButtonClick
    end
    object ToolButton3: TToolButton
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
      Width = 250
      Height = 22
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' (F4)'
      TabStop = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Left = 288
    Top = 472
    ReportForm = {
      18000000CB040000180000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F0000FFDC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      0024000000F50200003C0000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000000
      7C01000005004D656D6F31000200300000003800000060000000120000000300
      000001000000000000000000FFFFFF1F2C020000000000010028005B53746F72
      65446174614D6F64756C652E53746F7265446174615365742E2253746F726549
      44225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      0000000000002202000005004D656D6F320002009C0000003800000060000000
      120000000300000001000000000000000000FFFFFF1F2C020000000000010028
      005B53746F7265446174614D6F64756C652E53746F7265446174615365742E22
      476F6F64734944225D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000000000000CC00020000000000FFFFFF0000
      000002000000000000000000C902000005004D656D6F330002000C0100003800
      000060000000120000000300000001000000000000000000FFFFFF1F2C020000
      000000010029005B53746F7265446174614D6F64756C652E53746F7265446174
      615365742E224275795072696365225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000000000000CC0002000000
      0000FFFFFF00000000020000000000000000007103000005004D656D6F340002
      00780100003800000060000000120000000300000001000000000000000000FF
      FFFF1F2C02000000000001002A005B53746F7265446174614D6F64756C652E53
      746F7265446174615365742E2253616C655072696365225D00000000FFFF0000
      0000000200000001000000000500417269616C000A0000000000000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000001704000005
      004D656D6F35000200EC01000038000000600000001200000003000000010000
      00000000000000FFFFFF1F2C020000000000010028005B53746F726544617461
      4D6F64756C652E53746F7265446174615365742E22496E697469616C225D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      00BC04000005004D656D6F360002005C02000038000000600000001200000003
      00000001000000000000000000FFFFFF1F2C020000000000010027005B53746F
      7265446174614D6F64756C652E53746F7265446174615365742E2252656D6169
      6E225D00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      00000000FEFEFF000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = StoreDataModule.StoreDataSet
    Left = 328
    Top = 472
  end
end
