object SaleProperSelectForm: TSaleProperSelectForm
  Left = 332
  Top = 200
  BorderStyle = bsDialog
  Caption = 'SaleProperSelectForm'
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
  object CancelButton: TButton
    Left = 133
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 50
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 201
    Height = 65
    ItemIndex = 1
    Items.Strings = (
      #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072
      #1058#1086#1074#1072#1088#1085#1099#1081' '#1095#1077#1082)
    TabOrder = 0
  end
end
