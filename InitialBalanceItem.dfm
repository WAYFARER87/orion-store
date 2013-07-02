object InitialBalanceItemForm: TInitialBalanceItemForm
  Left = 192
  Top = 107
  Width = 587
  Height = 250
  Caption = 'InitialBalanceItemForm'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 579
    Height = 173
    Align = alClient
    TabOrder = 0
    TabStop = True
    object Label1: TLabel
      Left = 152
      Top = 20
      Width = 127
      Height = 16
      Caption = #1054#1089#1090#1072#1090#1082#1080' '#1082#1088#1077#1076#1080#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 61
      Width = 47
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 285
      Top = 20
      Width = 19
      Height = 16
      Caption = #1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 96
      Width = 543
      Height = 13
      Caption = 
        #1045#1089#1083#1080' '#1076#1086#1083#1075' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091' > 0, '#1050#1083#1080#1077#1085#1090' '#1076#1086#1083#1078#1077#1085' '#1050#1086#1084#1087#1072#1085#1080#1080'. '#1045#1089#1083#1080' < 0, '#1050#1086#1084#1087 +
        #1072#1085#1080#1103' '#1076#1086#1083#1078#1085#1072' '#1050#1083#1080#1077#1085#1090#1091'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 136
      Width = 87
      Height = 13
      Caption = #1044#1086#1083#1075' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091':'
    end
    object Label6: TLabel
      Left = 248
      Top = 136
      Width = 66
      Height = 13
      Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057':'
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 312
      Top = 16
      Width = 105
      Height = 21
      DataField = 'Date'
      DataSource = StoreDataModule.InitialBalanceDataSource
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 112
      Top = 56
      Width = 345
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1072' (F3)'
      DataField = 'CustomerName'
      DataSource = StoreDataModule.InitialBalanceDataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = DBEditEh1EditButtons0Click
        end>
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnKeyDown = DBEditEh1KeyDown
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 112
      Top = 132
      Width = 105
      Height = 21
      DataField = 'TotalAmount'
      DataSource = StoreDataModule.InitialBalanceDataSource
      DisplayFormat = ',0.00 '#1088
      EditButton.Visible = True
      EditButtons = <>
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 328
      Top = 130
      Width = 113
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1057#1090#1072#1074#1082#1080' '#1053#1044#1057' (F3)'
      DataField = 'VATRate'
      DataSource = StoreDataModule.InitialBalanceDataSource
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = DBEditEh2EditButtons0Click
        end>
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnKeyDown = DBEditEh2KeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 173
    Width = 579
    Height = 43
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      579
      43)
    object OKButton: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object CancelButton: TButton
      Left = 494
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
