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
    ExplicitWidth = 521
    ExplicitHeight = 225
    inherited pgcBrowse: TcxPageControl
      Width = 615
      Height = 259
      ExplicitWidth = 499
      ExplicitHeight = 203
      ClientRectBottom = 258
      ClientRectRight = 614
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 497
        ExplicitHeight = 201
        inherited cxGrid: TcxGrid
          Width = 613
          Height = 257
          ExplicitWidth = 497
          ExplicitHeight = 201
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 637
    ExplicitWidth = 521
    inherited lblHeader: TLabel
      Width = 114
      Caption = 'DAILY SALES REPORT'
      ExplicitWidth = 114
    end
    inherited lblFilterData: TcxLabel
      Left = 283
      ExplicitLeft = 167
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 344
      ExplicitLeft = 228
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 460
      Visible = True
      ExplicitLeft = 344
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 555
      ExplicitLeft = 439
    end
    inherited lblsdFilter: TcxLabel
      Left = 436
      ExplicitLeft = 320
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 314
    Width = 637
    ExplicitTop = 314
    ExplicitWidth = 521
    inherited pnlFooter: TPanel
      Width = 637
      ExplicitWidth = 521
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
        ExplicitLeft = 444
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 637
      ExplicitWidth = 521
      inherited lbEscape: TLabel
        Left = 563
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
