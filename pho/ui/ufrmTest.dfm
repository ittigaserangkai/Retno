object frmTest: TfrmTest
  Left = 0
  Top = 0
  Caption = 'Test Form'
  ClientHeight = 399
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 16
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 97
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 104
    Width = 529
    Height = 287
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton3: TcxButton
    Left = 178
    Top = 24
    Width = 75
    Height = 25
    Caption = 'View'
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object cxTextEdit1: TcxTextEdit
    Left = 376
    Top = 16
    TabOrder = 4
    Text = 'cxTextEdit1'
    Width = 121
  end
  object cxTextEdit2: TcxTextEdit
    Left = 376
    Top = 43
    TabOrder = 5
    Text = 'cxTextEdit1'
    Width = 121
  end
  object DataSource1: TDataSource
    Left = 240
    Top = 288
  end
end
