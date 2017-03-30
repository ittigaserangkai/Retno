inherited frmListDailyTransaction: TfrmListDailyTransaction
  Left = 213
  Top = 134
  Caption = 'Listing Daily Transaction'
  ClientHeight = 443
  ClientWidth = 740
  OldCreateOrder = True
  ExplicitWidth = 756
  ExplicitHeight = 482
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 740
    Height = 354
    ExplicitWidth = 740
    ExplicitHeight = 298
    inherited pgcBrowse: TcxPageControl
      Width = 718
      Height = 332
      ExplicitTop = 57
      ExplicitWidth = 718
      ExplicitHeight = 230
      ClientRectBottom = 331
      ClientRectRight = 717
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 716
        ExplicitHeight = 228
        inherited cxGrid: TcxGrid
          Width = 716
          Height = 330
          ExplicitWidth = 716
          ExplicitHeight = 228
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 740
    ExplicitWidth = 740
    inherited lblHeader: TLabel
      Width = 156
      Caption = 'LISTING DAILY TRANSACTION'
      ExplicitWidth = 156
    end
    inherited lblFilterData: TcxLabel
      Left = 386
      Visible = True
      ExplicitLeft = 386
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 447
      Visible = True
      ExplicitLeft = 447
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 563
      ExplicitLeft = 563
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 658
      ExplicitLeft = 658
    end
    inherited lblsdFilter: TcxLabel
      Left = 539
      ExplicitLeft = 539
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 387
    Width = 740
    ExplicitTop = 331
    ExplicitWidth = 740
    inherited pnlFooter: TPanel
      Width = 740
      ExplicitWidth = 740
      inherited btnAdd: TcxButton
        Action = actAdd
        Visible = False
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Visible = False
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 663
        Action = actClose
        ExplicitLeft = 663
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 740
      ExplicitWidth = 740
      inherited lbEscape: TLabel
        Left = 666
        Height = 17
        ExplicitLeft = 666
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
