object ReportRemainsForm: TReportRemainsForm
  Left = 301
  Top = 256
  BorderStyle = bsDialog
  Caption = 'ReportRemainsForm'
  ClientHeight = 220
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    325
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 305
    Height = 161
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 31
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 88
    Width = 34
    Height = 13
    Caption = #1057#1082#1083#1072#1076':'
  end
  object Label3: TLabel
    Left = 32
    Top = 142
    Width = 31
    Height = 13
    Caption = #1062#1077#1085#1099':'
  end
  object CancelButton: TButton
    Left = 241
    Top = 189
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 158
    Top = 189
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 88
    Top = 24
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 56
    Width = 129
    Height = 17
    Caption = #1055#1086' '#1074#1089#1077#1084' '#1089#1082#1083#1072#1076#1072#1084
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object DBEditEh2: TDBEditEh
    Left = 88
    Top = 80
    Width = 209
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1089#1082#1083#1072#1076#1072' (F3)'
    DataField = 'DivisionName'
    DataSource = StoreDataModule.DivisionSelectDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    Enabled = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBEditEh3: TDBEditEh
    Left = 88
    Top = 136
    Width = 155
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1054#1090#1087#1091#1089#1082#1085#1099#1093' '#1094#1077#1085' (F3)'
    DataField = 'PriceName'
    DataSource = StoreDataModule.TypePriceDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh3EditButtons0Click
      end>
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnKeyDown = DBEditEh3KeyDown
  end
  object CheckBox2: TCheckBox
    Left = 32
    Top = 112
    Width = 129
    Height = 17
    Caption = #1041#1077#1079' '#1094#1077#1085
    TabOrder = 6
    OnClick = CheckBox2Click
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet2
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 8
    Top = 176
    ReportForm = {18000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = ReportDataModule.CategoryQuery
    Left = 48
    Top = 176
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = ReportDataModule.RemainsQuery
    Left = 88
    Top = 176
  end
end
