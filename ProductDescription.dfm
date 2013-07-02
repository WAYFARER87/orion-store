object ProductDescriptionForm: TProductDescriptionForm
  Left = 348
  Top = 146
  Width = 400
  Height = 289
  Caption = 'ProductDescriptionForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 392
    Height = 55
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object OKButton: TButton
      Left = 301
      Top = 16
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'CloseButton'
      TabOrder = 0
      TabStop = False
      OnClick = OKButtonClick
    end
  end
end
