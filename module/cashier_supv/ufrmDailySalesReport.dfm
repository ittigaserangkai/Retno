inherited frmDailySalesReport: TfrmDailySalesReport
  Left = 264
  Top = 139
  Caption = 'Daily Sales Report'
  ClientHeight = 370
  ClientWidth = 637
  OldCreateOrder = True
  ExplicitWidth = 653
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 637
    Height = 281
    ExplicitWidth = 637
    ExplicitHeight = 281
    inherited pgcBrowse: TcxPageControl
      Width = 635
      Height = 279
      ExplicitWidth = 635
      ExplicitHeight = 279
      ClientRectBottom = 278
      ClientRectRight = 634
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 633
        ExplicitHeight = 277
        inherited cxGrid: TcxGrid
          Width = 633
          Height = 277
          ExplicitWidth = 633
          ExplicitHeight = 277
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 637
    ExplicitWidth = 637
    inherited lblHeader: TLabel
      Width = 114
      Caption = 'DAILY SALES REPORT'
      ExplicitWidth = 114
    end
    inherited lblFilterData: TcxLabel
      Left = 283
      ExplicitLeft = 283
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 344
      ExplicitLeft = 344
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 460
      Visible = True
      ExplicitLeft = 460
    end
    inherited btnSearch: TcxButton
      Left = 555
      ExplicitLeft = 555
    end
    inherited lblsdFilter: TcxLabel
      Left = 436
      ExplicitLeft = 436
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 314
    Width = 637
    ExplicitTop = 314
    ExplicitWidth = 637
    inherited pnlFooter: TPanel
      Width = 637
      ExplicitWidth = 637
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
        Left = 560
        Action = actClose
        ExplicitLeft = 560
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 637
      ExplicitWidth = 637
      inherited lbEscape: TLabel
        Left = 563
        ExplicitLeft = 563
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
