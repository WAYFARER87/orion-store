object SaleOrderItemForm: TSaleOrderItemForm
  Left = 181
  Top = 109
  Width = 756
  Height = 474
  Caption = 'SaleOrderItemForm'
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
    Top = 177
    Width = 748
    Height = 223
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 25
      Width = 746
      Height = 197
      Align = alClient
      AutoFitColWidths = True
      Ctl3D = True
      DataSource = StoreDataModule.SaleStructureDataSource
      FooterColor = clInactiveCaptionText
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
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
          Footers = <
            item
              FieldName = 'OrderID'
              ValueType = fvtCount
            end>
          Title.Caption = #8470
          Width = 28
        end
        item
          EditButtons = <>
          FieldName = 'ProductID'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Width = 54
        end
        item
          EditButtons = <>
          FieldName = 'StoreID'
          Footers = <>
          Title.Caption = #1055#1072#1088#1090#1080#1103
        end
        item
          EditButtons = <>
          FieldName = 'ProductFullName'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1086#1074#1072#1088#1072
          Width = 262
        end
        item
          DisplayFormat = ',0.00 '#1088
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
        end
        item
          EditButtons = <>
          FieldName = 'Qty'
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
        end
        item
          DisplayFormat = '0.##%'
          EditButtons = <>
          FieldName = 'VATRate'
          Footers = <>
          Title.Caption = #1053#1044#1057
        end
        item
          DisplayFormat = ',0.00 '#1088
          EditButtons = <>
          FieldName = 'AmountVAT'
          Footers = <
            item
              DisplayFormat = ',0.00 '#1088
              FieldName = 'AmountVAT'
              ValueType = fvtSum
            end>
          Title.Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
          Width = 69
        end
        item
          DisplayFormat = ',0.00 '#1088
          EditButtons = <>
          FieldName = 'Amount'
          Footers = <
            item
              DisplayFormat = ',0.00 '#1088
              FieldName = 'Amount'
              ValueType = fvtSum
            end>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 76
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
          Width = 26
        end
        item
          EditButtons = <>
          FieldName = 'RemainQty'
          Footers = <>
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        end
        item
          EditButtons = <>
          FieldName = 'DivisionName'
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076
          Width = 150
        end>
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 746
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
        Cursor = crHandPoint
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' (F2)'
        Caption = 'InsertButton'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = InsertButtonClick
      end
      object EditButton: TToolButton
        Left = 31
        Top = 0
        Cursor = crHandPoint
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
        Cursor = crHandPoint
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
    Width = 748
    Height = 177
    Align = alTop
    TabOrder = 0
    TabStop = True
    OnEnter = Panel1Enter
    OnExit = Panel1Exit
    object Label1: TLabel
      Left = 96
      Top = 18
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
    object Label2: TLabel
      Left = 328
      Top = 17
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
    object Label6: TLabel
      Left = 24
      Top = 117
      Width = 74
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 504
      Top = 19
      Width = 55
      Height = 13
      Caption = #1054#1087#1083#1072#1090#1072' '#1076#1086':'
    end
    object Label5: TLabel
      Left = 56
      Top = 85
      Width = 37
      Height = 13
      Caption = #1062#1077#1085#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 56
      Top = 51
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
    object Label4a: TLabel
      Left = 104
      Top = 51
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5a: TLabel
      Left = 104
      Top = 85
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 24
      Top = 147
      Width = 66
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103':'
    end
    object DBEditEh1: TDBEditEh
      Left = 208
      Top = 16
      Width = 105
      Height = 21
      DataField = 'Number'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 352
      Top = 16
      Width = 104
      Height = 21
      DataField = 'Date'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object DBEditEh4: TDBEditEh
      Left = 112
      Top = 112
      Width = 345
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1055#1086#1083#1091#1095#1072#1090#1077#1083#1103' (F3)'
      DataField = 'CustomerName'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = DBEditEh4EditButtons0Click
        end>
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnKeyDown = DBEditEh4KeyDown
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 568
      Top = 16
      Width = 104
      Height = 21
      DataField = 'PayDate'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 24
      Top = 48
      Width = 21
      Height = 21
      DataField = 'OutDivisionID'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = DBEditEh2EditButtons0Click
        end>
      ReadOnly = True
      TabOrder = 4
      Visible = True
      OnKeyDown = DBEditEh2KeyDown
    end
    object DBEditEh3: TDBEditEh
      Left = 24
      Top = 80
      Width = 21
      Height = 21
      DataField = 'PriceID'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = DBEditEh3EditButtons0Click
        end>
      ReadOnly = True
      TabOrder = 5
      Visible = True
      OnKeyDown = DBEditEh2KeyDown
    end
    object DBEditEh5: TDBEditEh
      Left = 112
      Top = 144
      Width = 345
      Height = 21
      DataField = 'Note'
      DataSource = StoreDataModule.SaleOrderDataSource
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 400
    Width = 748
    Height = 40
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      748
      40)
    object OKButton: TButton
      Left = 584
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
      Left = 664
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
