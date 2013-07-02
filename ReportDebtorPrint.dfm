object ReportDebtorPrintForm: TReportDebtorPrintForm
  Left = 663
  Top = 218
  BorderStyle = bsDialog
  Caption = 'ReportDebtorPrintForm'
  ClientHeight = 130
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
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 217
    Height = 81
    Shape = bsFrame
  end
  object CancelButton: TButton
    Left = 149
    Top = 99
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 66
    Top = 99
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 40
    Width = 121
    Height = 17
    Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1099#1081' '#1086#1090#1095#1077#1090
    TabOrder = 0
  end
  object frReport1: TfrReport
    Dataset = DebtorDBDataSet
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 144
    Top = 16
    ReportForm = {18000000}
  end
  object DebtorDBDataSet: TfrDBDataSet
    DataSet = ReportDataModule.DebtorQuery
    Left = 184
    Top = 16
  end
  object DebtorOrderDBDataSet: TfrDBDataSet
    DataSet = ReportDataModule.DebtorOrderQuery
    Left = 184
    Top = 56
  end
end
