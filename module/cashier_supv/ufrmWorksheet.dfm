inherited frmWorksheet: TfrmWorksheet
  Left = 340
  Caption = 'WORKSHEET REPORT'
  ClientHeight = 478
  ClientWidth = 618
  OldCreateOrder = True
  ExplicitWidth = 634
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 618
    Height = 389
    ExplicitWidth = 618
    ExplicitHeight = 334
    inherited pgcBrowse: TcxPageControl
      Top = 83
      Width = 596
      Height = 295
      ExplicitWidth = 596
      ExplicitHeight = 312
      ClientRectBottom = 294
      ClientRectRight = 595
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 594
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 594
          Height = 293
          ExplicitWidth = 594
          ExplicitHeight = 310
        end
      end
    end
    object pnlButtonUP: TPanel
      Left = 11
      Top = 11
      Width = 596
      Height = 72
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 594
      object rgReportType: TRadioGroup
        Left = 312
        Top = 2
        Width = 121
        Height = 65
        Caption = 'Report Type By'
        ItemIndex = 0
        Items.Strings = (
          'Value'
          'Transaction')
        TabOrder = 0
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 618
    ExplicitWidth = 618
    inherited lblHeader: TLabel
      Width = 110
      Caption = 'WORKSHEET REPORT'
      ExplicitWidth = 110
    end
    inherited lblFilterData: TcxLabel
      Left = 264
      Visible = True
      ExplicitLeft = 264
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 325
      Visible = True
      ExplicitLeft = 325
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 441
      ExplicitLeft = 441
    end
    inherited btnSearch: TcxButton
      Left = 536
      ExplicitLeft = 536
    end
    inherited lblsdFilter: TcxLabel
      Left = 417
      ExplicitLeft = 417
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 422
    Width = 618
    ExplicitTop = 367
    ExplicitWidth = 618
    inherited pnlFooter: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 541
        Action = actClose
        ExplicitLeft = 541
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited lbEscape: TLabel
        Left = 544
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  object dlgSaveFile: TSaveDialog
    Left = 484
    Top = 45
  end
end
