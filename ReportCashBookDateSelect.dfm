object ReportCashBookDateSelectForm: TReportCashBookDateSelectForm
  Left = 332
  Top = 200
  BorderStyle = bsDialog
  Caption = 'ReportCashBookDateSelectForm'
  ClientHeight = 111
  ClientWidth = 217
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
    217
    111)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 201
    Height = 65
    Shape = bsFrame
  end
  object CancelButton: TButton
    Left = 133
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 50
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 56
    Top = 32
    Width = 121
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
  end
end
