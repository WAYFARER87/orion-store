object InitialRemainsForm: TInitialRemainsForm
  Left = 209
  Top = 191
  Width = 752
  Height = 467
  Caption = 'InitialRemainsForm'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 744
    Height = 296
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 25
      Width = 742
      Height = 270
      Align = alClient
      AutoFitColWidths = True
      Ctl3D = True
      DataSource = StoreDataModule.HomeStructureDataSource
      FooterColor = clInactiveCaptionText
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FrozenCols = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ParentCtl3D = False
      ReadOnly = True
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OrderID'
          Footers = <>
          Title.Caption = #8470
          Width = 26
        end
        item
          EditButtons = <>
          FieldName = 'ProductID'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'StoreID'
          Footers = <>
          Title.Caption = #1055#1072#1088#1090#1080#1103
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'ProductFullName'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1086#1074#1072#1088#1072
          Width = 271
        end
        item
          DisplayFormat = ',0.00 '#1088
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'Qty'
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Width = 62
        end
        item
          DisplayFormat = '0.## %'
          EditButtons = <>
          FieldName = 'VATRate'
          Footers = <>
          Title.Caption = #1053#1044#1057
          Width = 37
        end
        item
          DisplayFormat = ',0.00 '#1088
          EditButtons = <>
          FieldName = 'AmountVAT'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
          Width = 70
        end
        item
          DisplayFormat = ',0.00 '#1088
          EditButtons = <>
          FieldName = 'Amount'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'Type'
          Footers = <>
          ImageList = StoreDataModule.ImageList3
          KeyList.Strings = (
            '-1'
            '1')
          Title.Caption = #1058#1080#1087
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'RemainQty'
          Footers = <>
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082
          Visible = False
          Width = 54
        end
        item
          EditButtons = <>
          FieldName = 'DivisionName'
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076
          Visible = False
          Width = 170
        end>
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 742
      Height = 24
      Caption = 'ToolBar1'
      Flat = True
      HotImages = StoreDataModule.ImageList1
      Images = StoreDataModule.ImageList2
      TabOrder = 1
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
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 97
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 363
      Top = 27
      Width = 18
      Height = 16
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 153
      Top = 28
      Width = 101
      Height = 16
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 56
      Top = 60
      Width = 41
      Height = 13
      Caption = #1057#1082#1083#1072#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3a: TLabel
      Left = 104
      Top = 60
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 386
      Top = 24
      Width = 104
      Height = 21
      DataField = 'Date'
      DataSource = StoreDataModule.HomeOrderDataSource
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 266
      Top = 24
      Width = 87
      Height = 21
      DataField = 'Number'
      DataSource = StoreDataModule.HomeOrderDataSource
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 24
      Top = 56
      Width = 21
      Height = 21
      DataField = 'InDivisionID'
      DataSource = StoreDataModule.HomeOrderDataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = DBEditEh3EditButtons0Click
        end>
      ReadOnly = True
      TabOrder = 2
      Visible = True
      OnKeyDown = DBEditEh3KeyDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 393
    Width = 744
    Height = 40
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      744
      40)
    object OKButton: TButton
      Left = 578
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
      Left = 662
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
end
