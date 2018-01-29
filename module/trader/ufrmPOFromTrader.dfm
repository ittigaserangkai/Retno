inherited frmPOFromTrader: TfrmPOFromTrader
  Left = 287
  Top = 181
  Caption = 'PO From Trader/Assgros'
  ClientHeight = 427
  ClientWidth = 905
  OldCreateOrder = True
  ExplicitWidth = 921
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 905
    Height = 338
    ExplicitWidth = 905
    ExplicitHeight = 338
    inherited pgcBrowse: TcxPageControl
      Width = 903
      Height = 336
      ExplicitWidth = 903
      ExplicitHeight = 336
      ClientRectBottom = 335
      ClientRectRight = 902
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 901
        ExplicitHeight = 334
        inherited cxGrid: TcxGrid
          Width = 901
          Height = 334
          ExplicitWidth = 901
          ExplicitHeight = 334
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 905
    ExplicitWidth = 905
    inherited lblFilterData: TcxLabel
      Left = 551
      Visible = True
      ExplicitLeft = 551
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 612
      Visible = True
      ExplicitLeft = 612
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 728
      Visible = True
      ExplicitLeft = 728
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 823
      ExplicitLeft = 823
    end
    inherited lblsdFilter: TcxLabel
      Left = 704
      Visible = True
      ExplicitLeft = 704
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 371
    Width = 905
    ExplicitTop = 371
    ExplicitWidth = 905
    inherited pnlFooter: TPanel
      Width = 905
      ExplicitWidth = 905
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
        Left = 828
        Action = actClose
        ExplicitLeft = 828
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 905
      ExplicitWidth = 905
      inherited lbEscape: TLabel
        Left = 831
        Height = 17
        ExplicitLeft = 831
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
