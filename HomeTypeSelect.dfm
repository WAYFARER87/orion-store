object HomeTypeSelectForm: THomeTypeSelectForm
  Left = 332
  Top = 200
  BorderStyle = bsDialog
  Caption = 'HomeTypeSelectForm'
  ClientHeight = 128
  ClientWidth = 225
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
  OnKeyDown = FormKeyDown
  DesignSize = (
    225
    128)
  PixelsPerInch = 96
  TextHeight = 13
  object CancelButton: TButton
    Left = 141
    Top = 92
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 58
    Top = 92
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 209
    Height = 73
    ItemIndex = 0
    Items.Strings = (
      #1056#1072#1089#1093#1086#1076
      #1055#1088#1080#1093#1086#1076)
    TabOrder = 2
  end
end
