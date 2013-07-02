object FirstAidForm: TFirstAidForm
  Left = 323
  Top = 215
  BorderStyle = bsDialog
  Caption = 'FirstAidForm'
  ClientHeight = 213
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    407
    213)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 393
    Height = 169
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 93
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1060#1080#1088#1084#1072':'
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 34
    Height = 13
    Caption = #1057#1082#1083#1072#1076':'
  end
  object Label3: TLabel
    Left = 24
    Top = 112
    Width = 86
    Height = 13
    Caption = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1062#1077#1085#1072':'
  end
  object Label4: TLabel
    Left = 24
    Top = 152
    Width = 122
    Height = 13
    Caption = #1056#1086#1079#1085#1080#1095#1085#1099#1081' '#1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
  end
  object OKButton: TButton
    Left = 246
    Top = 183
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 326
    Top = 183
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object DBEditEh1: TDBEditEh
    Left = 160
    Top = 24
    Width = 225
    Height = 21
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 160
    Top = 64
    Width = 225
    Height = 21
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBEditEh3: TDBEditEh
    Left = 160
    Top = 104
    Width = 225
    Height = 21
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object DBEditEh4: TDBEditEh
    Left = 160
    Top = 144
    Width = 225
    Height = 21
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
end
