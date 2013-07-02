object ProductItemForm: TProductItemForm
  Left = 313
  Top = 182
  Width = 473
  Height = 315
  Caption = 'ProductItemForm'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 457
    Height = 237
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 449
        Height = 209
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 24
        Top = 20
        Width = 22
        Height = 13
        Caption = #1050#1086#1076':'
      end
      object Label2: TLabel
        Left = 24
        Top = 53
        Width = 44
        Height = 13
        Caption = #1040#1088#1090#1080#1082#1091#1083':'
      end
      object Label3: TLabel
        Left = 24
        Top = 86
        Width = 79
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Label4: TLabel
        Left = 24
        Top = 119
        Width = 56
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      end
      object Label5: TLabel
        Left = 24
        Top = 152
        Width = 80
        Height = 13
        Caption = #1045#1076'. '#1048#1079#1084#1077#1088#1077#1085#1080#1103':'
      end
      object Label6: TLabel
        Left = 24
        Top = 183
        Width = 96
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086' '#1074' '#1091#1087#1072#1082#1086#1074#1082#1077':'
      end
      object DBEditEh1: TDBEditEh
        Left = 128
        Top = 13
        Width = 105
        Height = 21
        DataField = 'ProductID'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <>
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object DBEditEh2: TDBEditEh
        Left = 128
        Top = 45
        Width = 297
        Height = 21
        DataField = 'Article'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object DBEditEh3: TDBEditEh
        Left = 128
        Top = 78
        Width = 297
        Height = 21
        DataField = 'ProductName'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object DBEditEh4: TDBEditEh
        Left = 128
        Top = 111
        Width = 249
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1050#1072#1090#1077#1075#1086#1088#1080#1080' (F3)'
        DataField = 'CategoryName'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <
          item
            Hint = #1042#1099#1073#1086#1088' '#1050#1072#1090#1077#1075#1086#1088#1080#1080' (F3)'
            Style = ebsEllipsisEh
            OnClick = DBEditEh4EditButtons0Click
          end
          item
            Hint = #1054#1095#1080#1089#1090#1082#1072' '#1087#1086#1083#1103' (F8)'
            Style = ebsMinusEh
            OnClick = DBEditEh4EditButtons1Click
          end>
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnKeyDown = DBEditEh4KeyDown
      end
      object DBEditEh5: TDBEditEh
        Left = 128
        Top = 144
        Width = 137
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' (F3)'
        DataField = 'MeasureName'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBEditEh5EditButtons0Click
          end
          item
            Style = ebsMinusEh
            OnClick = DBEditEh5EditButtons1Click
          end>
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        Visible = True
        OnKeyDown = DBEditEh5KeyDown
      end
      object DBNumberEditEh1: TDBNumberEditEh
        Left = 128
        Top = 176
        Width = 121
        Height = 21
        DataField = 'Pack'
        DataSource = StoreDataModule.ProductDataSource
        EditButton.Visible = True
        EditButtons = <>
        TabOrder = 5
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 449
        Height = 209
        Align = alClient
        Shape = bsFrame
      end
      object Label8: TLabel
        Left = 16
        Top = 56
        Width = 39
        Height = 13
        Caption = #1057#1090#1088#1072#1085#1072':'
      end
      object Label7: TLabel
        Left = 16
        Top = 24
        Width = 82
        Height = 13
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
      end
      object DBEditEh6: TDBEditEh
        Left = 128
        Top = 17
        Width = 305
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103' (F3)'
        DataField = 'ProducerName'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBEditEh6EditButtons0Click
          end
          item
            Style = ebsMinusEh
            OnClick = DBEditEh6EditButtons1Click
          end>
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnKeyDown = DBEditEh6KeyDown
      end
      object DBEditEh7: TDBEditEh
        Left = 128
        Top = 49
        Width = 305
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1057#1090#1088#1072#1085#1099' '#1087#1088#1086#1080#1079#1074#1086#1089#1090#1074#1072' (F3)'
        DataField = 'CountryName'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = DBEditEh7EditButtons0Click
          end
          item
            Style = ebsMinusEh
            OnClick = DBEditEh7EditButtons1Click
          end>
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnKeyDown = DBEditEh7KeyDown
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      object Label9: TLabel
        Left = 16
        Top = 16
        Width = 66
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103':'
      end
      object DBMemo1: TDBMemo
        Left = 0
        Top = 36
        Width = 449
        Height = 173
        Align = alBottom
        DataField = 'Description'
        DataSource = StoreDataModule.ProductDataSource
        TabOrder = 0
      end
      object DBEditEh8: TDBEditEh
        Left = 120
        Top = 9
        Width = 321
        Height = 21
        TabStop = False
        DataField = 'Note'
        DataSource = StoreDataModule.ProductDataSource
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 237
    Width = 457
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      457
      40)
    object OKButton: TButton
      Left = 299
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object CancelButton: TButton
      Left = 382
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
