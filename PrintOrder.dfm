object PrintOrderForm: TPrintOrderForm
  Left = 359
  Top = 215
  BorderStyle = bsDialog
  Caption = 'PrintOrderForm'
  ClientHeight = 141
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    267
    141)
  PixelsPerInch = 96
  TextHeight = 13
  object CancelButton: TButton
    Left = 183
    Top = 107
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object PrintButton: TButton
    Left = 100
    Top = 107
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 1
    OnClick = PrintButtonClick
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 249
    Height = 90
    TabOrder = 2
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 152
    Top = 24
    ReportForm = {18000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = StoreDataModule.SaleStructureDataSet
    Left = 216
    Top = 23
  end
end
