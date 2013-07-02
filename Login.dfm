object LoginForm: TLoginForm
  Left = 354
  Top = 241
  BorderStyle = bsDialog
  Caption = 'LoginForm'
  ClientHeight = 228
  ClientWidth = 392
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
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 376
    Height = 50
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 20
    Top = 25
    Width = 71
    Height = 13
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093' :'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 64
    Width = 376
    Height = 121
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 20
    Top = 82
    Width = 79
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' :'
  end
  object Label3: TLabel
    Left = 20
    Top = 106
    Width = 44
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100' :'
  end
  object Label4: TLabel
    Left = 20
    Top = 129
    Width = 31
    Height = 13
    Caption = #1056#1086#1083#1100' :'
  end
  object CancelButton: TButton
    Left = 309
    Top = 193
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    TabStop = False
    OnClick = CancelButtonClick
  end
  object ConnectButton: TButton
    Left = 223
    Top = 193
    Width = 75
    Height = 25
    Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100#1089#1103
    TabOrder = 1
    TabStop = False
    OnClick = ConnectButtonClick
  end
  object DBNameEditEh: TDBEditEh
    Left = 112
    Top = 24
    Width = 257
    Height = 21
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBNameEditEhEditButtons0Click
      end>
    TabOrder = 2
    Visible = True
    OnKeyDown = DBNameEditEhKeyDown
  end
  object UserNameEditEh: TDBEditEh
    Left = 112
    Top = 80
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object PasswordEditEh: TDBEditEh
    Left = 112
    Top = 104
    Width = 177
    Height = 21
    EditButtons = <>
    PasswordChar = '*'
    TabOrder = 4
    Visible = True
  end
  object RoleNameEditEh: TDBEditEh
    Left = 112
    Top = 128
    Width = 177
    Height = 21
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object SavePasswodCheckBox: TCheckBox
    Left = 19
    Top = 160
    Width = 174
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100'?'
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      #1041#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' InterBase (*.gdb, *.ib)|*.gdb; *.ib|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|' +
      '*.*'
    Left = 8
    Top = 179
  end
end
