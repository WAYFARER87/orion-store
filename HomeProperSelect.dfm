object HomeProperSelectForm: THomeProperSelectForm
  Left = 332
  Top = 200
  BorderStyle = bsDialog
  Caption = 'HomeProperSelectForm'
  ClientHeight = 163
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
  OnKeyDown = FormKeyDown
  DesignSize = (
    267
    163)
  PixelsPerInch = 96
  TextHeight = 13
  object CancelButton: TButton
    Left = 183
    Top = 130
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 100
    Top = 130
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
    Width = 249
    Height = 113
    ItemIndex = 3
    Items.Strings = (
      #1048#1079#1083#1080#1096#1082#1080
      #1057#1087#1080#1089#1072#1085#1080#1077
      #1055#1077#1088#1077#1089#1086#1088#1090
      #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077)
    TabOrder = 2
  end
end
