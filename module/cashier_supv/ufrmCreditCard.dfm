inherited frmCreditCard: TfrmCreditCard
  Left = 257
  Top = 223
  Caption = 'Credit Card And Discount'
  ClientHeight = 324
  ClientWidth = 703
  OldCreateOrder = True
  ExplicitWidth = 719
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 703
    Height = 235
    BorderWidth = 0
    ExplicitWidth = 703
    ExplicitHeight = 179
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 701
      Height = 233
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 701
      ExplicitHeight = 177
      ClientRectBottom = 232
      ClientRectRight = 700
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 699
        ExplicitHeight = 175
        inherited cxGrid: TcxGrid
          Width = 699
          Height = 231
          ExplicitWidth = 699
          ExplicitHeight = 175
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 703
    ExplicitWidth = 703
    inherited lblFilterData: TcxLabel
      Left = 349
      ExplicitLeft = 349
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 410
      ExplicitLeft = 410
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 526
      ExplicitLeft = 526
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 621
      ExplicitLeft = 621
    end
    inherited lblsdFilter: TcxLabel
      Left = 502
      ExplicitLeft = 502
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 268
    Width = 703
    ExplicitTop = 268
    ExplicitWidth = 703
    inherited pnlFooter: TPanel
      Width = 703
      ExplicitWidth = 703
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
        Left = 626
        Action = actClose
        ExplicitLeft = 626
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 703
      ExplicitWidth = 703
      inherited lbEscape: TLabel
        Left = 629
        ExplicitLeft = 629
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
