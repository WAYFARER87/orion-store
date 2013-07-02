object SQLMonitor: TSQLMonitor
  Left = 543
  Top = 134
  Width = 735
  Height = 491
  Caption = 'SQL Monitor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 719
    Height = 414
    Align = alClient
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 719
    Height = 19
    Panels = <>
  end
  object IBSQLMonitor1: TIBSQLMonitor
    OnSQL = IBSQLMonitor1SQL
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    Left = 624
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 536
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object MenuSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = MenuSaveClick
      end
      object MenuClear: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        OnClick = MenuClearClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 624
    Top = 56
  end
end
