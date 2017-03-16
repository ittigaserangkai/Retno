inherited frmSysParmCompTemp1: TfrmSysParmCompTemp1
  Left = 627
  Top = 316
  Caption = 'frmSysParmCompTemp'
  ClientHeight = 345
  ClientWidth = 543
  OldCreateOrder = True
  ExplicitWidth = 559
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 543
    Height = 259
    ExplicitWidth = 120
    ExplicitHeight = 247
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 521
      Height = 237
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 144
      ExplicitTop = 128
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridViewSysParamComp: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewSysParamComp
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 543
    ExplicitWidth = 120
  end
  inline frftr5btn1: TfraFooter5Button
    Left = 0
    Top = 289
    Width = 543
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 543
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 461
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        OnClick = actaddExecute
      end
      inherited btnUpdate: TcxButton
        OnClick = acteditExecute
      end
      inherited btnDelete: TcxButton
        OnClick = actdelExecute
      end
      inherited btnRefresh: TcxButton
        Left = 252
        OnClick = actrefreshExecute
        ExplicitLeft = 252
      end
    end
    inherited pnlSortCut: TPanel
      Width = 543
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 453
        ExplicitLeft = 452
      end
    end
  end
  object actlst1: TActionList
    Left = 444
    Top = 4
    object actadd: TAction
      Caption = 'actadd'
      OnExecute = actaddExecute
    end
    object actedit: TAction
      Caption = 'actedit'
      OnExecute = acteditExecute
    end
    object actdel: TAction
      Caption = 'actdel'
      OnExecute = actdelExecute
    end
    object actrefresh: TAction
      Caption = 'actrefresh'
      OnExecute = actrefreshExecute
    end
  end
end
