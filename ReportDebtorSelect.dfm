object ReportDebtorSelectForm: TReportDebtorSelectForm
  Left = 368
  Top = 207
  BorderStyle = bsDialog
  Caption = 'ReportDebtorSelectForm'
  ClientHeight = 136
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
    136)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 217
    Height = 89
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 32
    Top = 30
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object CancelButton: TButton
    Left = 149
    Top = 105
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 66
    Top = 105
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 64
    Width = 137
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1087#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1077
    TabOrder = 1
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
end
