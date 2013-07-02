object ReportCommodityMoneyForm: TReportCommodityMoneyForm
  Left = 368
  Top = 207
  BorderStyle = bsDialog
  Caption = 'ReportCommodityMoneyForm'
  ClientHeight = 184
  ClientWidth = 322
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
    322
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 305
    Height = 137
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 31
    Width = 6
    Height = 13
    Caption = #1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 34
    Height = 13
    Caption = #1057#1082#1083#1072#1076':'
  end
  object Label2: TLabel
    Left = 168
    Top = 31
    Width = 12
    Height = 13
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CancelButton: TButton
    Left = 238
    Top = 153
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 155
    Top = 153
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 48
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
    TabOrder = 2
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
    TabOrder = 3
    Visible = True
    OnKeyDown = DBEditEh2KeyDown
  end
  object DBDateTimeEditEh2: TDBDateTimeEditEh
    Left = 200
    Top = 24
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object CheckBox2: TCheckBox
    Left = 32
    Top = 112
    Width = 209
    Height = 17
    Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1086#1087#1083#1072#1090#1091' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 8
    Top = 120
    ReportForm = {18000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = ReportDataModule.CommodityExpenseQuery
    Left = 40
    Top = 120
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = ReportDataModule.CommodityReceiptQuery
    Left = 40
    Top = 152
  end
  object frReport2: TfrReport
    Dataset = frDBDataSet2
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 8
    Top = 152
    ReportForm = {18000000}
  end
  object frCompositeReport1: TfrCompositeReport
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 8
    Top = 88
    ReportForm = {18000000}
  end
  object frReport3: TfrReport
    Dataset = frDBDataSet3
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 88
    Top = 152
    ReportForm = {18000000}
  end
  object frDBDataSet3: TfrDBDataSet
    DataSet = ReportDataModule.CommodityPaymentQuery
    Left = 120
    Top = 152
  end
end
