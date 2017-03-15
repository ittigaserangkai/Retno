inherited frmOutlet: TfrmOutlet
  Left = 268
  Top = 262
  Caption = 'Sales Outlet'
  ClientHeight = 336
  ClientWidth = 613
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 629
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 613
    Height = 247
    ExplicitWidth = 613
    ExplicitHeight = 247
    inherited pgcBrowse: TcxPageControl
      Width = 591
      Height = 225
      ExplicitWidth = 591
      ExplicitHeight = 225
      ClientRectBottom = 224
      ClientRectRight = 590
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 589
        ExplicitHeight = 223
        inherited cxGrid: TcxGrid
          Width = 589
          Height = 223
          ExplicitWidth = 589
          ExplicitHeight = 223
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 613
    ExplicitWidth = 613
    inherited lblFilterData: TcxLabel
      Left = 259
      ExplicitLeft = 259
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 320
      ExplicitLeft = 320
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 436
      ExplicitLeft = 436
    end
    inherited btnSearch: TcxButton
      Left = 531
      ExplicitLeft = 531
    end
    inherited lblsdFilter: TcxLabel
      Left = 412
      ExplicitLeft = 412
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 280
    Width = 613
    ExplicitTop = 280
    ExplicitWidth = 613
    inherited pnlFooter: TPanel
      Width = 613
      ExplicitWidth = 613
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
        Left = 536
        Action = actClose
        ExplicitLeft = 536
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 613
      inherited lbEscape: TLabel
        Left = 539
        Height = 17
      end
    end
  end
end
