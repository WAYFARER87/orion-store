object ReportCirculateSelectForm: TReportCirculateSelectForm
  Left = 368
  Top = 207
  BorderStyle = bsDialog
  Caption = 'ReportCirculateSelectForm'
  ClientHeight = 136
  ClientWidth = 321
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
    321
    136)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 305
    Height = 89
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 47
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
  object Label2: TLabel
    Left = 168
    Top = 48
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object CancelButton: TButton
    Left = 237
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
    Left = 154
    Top = 105
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 48
    Top = 40
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
  end
  object DBDateTimeEditEh2: TDBDateTimeEditEh
    Left = 192
    Top = 40
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
end
