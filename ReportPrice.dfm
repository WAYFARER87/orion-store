object ReportPriceForm: TReportPriceForm
  Left = 338
  Top = 206
  BorderStyle = bsDialog
  Caption = 'ReportPriceForm'
  ClientHeight = 167
  ClientWidth = 234
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
    234
    167)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 217
    Height = 121
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 101
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object Label2: TLabel
    Left = 16
    Top = 69
    Width = 59
    Height = 13
    Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103':'
  end
  object CancelButton: TButton
    Left = 150
    Top = 136
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = CancelButtonClick
  end
  object OKButton: TButton
    Left = 67
    Top = 136
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 24
    Width = 121
    Height = 17
    Caption = #1041#1086#1083#1100#1096#1086#1081' '#1094#1077#1085#1085#1080#1082
    TabOrder = 2
  end
  object DBEditEh1: TDBEditEh
    Left = 64
    Top = 96
    Width = 153
    Height = 21
    DataField = 'PriceName'
    DataSource = StoreDataModule.TypePriceDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh1EditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 3
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 88
    Top = 64
    Width = 129
    Height = 21
    DataField = 'OrderID'
    DataSource = StoreDataModule.ReportOrderDataSource
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = DBEditEh2EditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 4
    Visible = True
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 144
    Top = 16
    ReportForm = {18000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = ReportDataModule.PriceListQuery
    Left = 184
    Top = 16
  end
end
