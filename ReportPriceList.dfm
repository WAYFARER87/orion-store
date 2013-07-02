object ReportPriceListForm: TReportPriceListForm
  Left = 393
  Top = 217
  BorderStyle = bsDialog
  Caption = 'ReportPriceListForm'
  ClientHeight = 169
  ClientWidth = 233
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
  DesignSize = (
    233
    169)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 217
    Height = 121
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 101
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object CancelButton: TButton
    Left = 149
    Top = 138
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 66
    Top = 138
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 24
    Width = 121
    Height = 17
    Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 56
    Width = 137
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1074#1072#1088' '#1089' '#1086#1089#1090#1072#1090#1082#1072#1084#1080' '#1073#1086#1083#1100#1096#1077
    TabOrder = 3
    WordWrap = True
    OnClick = CheckBox2Click
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 168
    Top = 60
    Width = 49
    Height = 21
    DecimalPlaces = 0
    Enabled = False
    EditButton.Style = ebsUpDownEh
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 100.000000000000000000
    TabOrder = 4
    Value = 0.000000000000000000
    Visible = True
  end
  object DBEditEh1: TDBEditEh
    Left = 64
    Top = 96
    Width = 153
    Height = 21
    DataField = 'PriceName'
    DataSource = StoreDataModule.TypePriceDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 5
    Visible = True
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 144
    Top = 16
    ReportForm = {18000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = ReportDataModule.PriceListQuery
    Left = 184
    Top = 16
  end
end
