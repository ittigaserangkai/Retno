inherited frmOutlet: TfrmOutlet
  Left = 268
  Top = 262
  Caption = 'Sales Outlet'
  ClientHeight = 336
  ClientWidth = 613
  OldCreateOrder = True
  ExplicitWidth = 629
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 613
    Height = 247
    ExplicitWidth = 537
    ExplicitHeight = 191
    inherited pgcBrowse: TcxPageControl
      Width = 591
      Height = 225
      ExplicitWidth = 515
      ExplicitHeight = 169
      ClientRectBottom = 225
      ClientRectRight = 591
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 515
        ExplicitHeight = 169
        inherited cxGrid: TcxGrid
          Width = 591
          Height = 225
          ExplicitWidth = 515
          ExplicitHeight = 169
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 613
    ExplicitWidth = 537
    inherited lblFilterData: TcxLabel
      Left = 259
      ExplicitLeft = 183
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 320
      ExplicitLeft = 244
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 436
      ExplicitLeft = 360
    end
    inherited btnSearch: TcxButton
      Left = 531
      ExplicitLeft = 455
    end
    inherited lblsdFilter: TcxLabel
      Left = 412
      ExplicitLeft = 336
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 280
    Width = 613
    ExplicitTop = 280
    ExplicitWidth = 537
    inherited pnlFooter: TPanel
      Width = 613
      ExplicitWidth = 537
      inherited btnClose: TcxButton
        Left = 536
        Action = actClose
        ExplicitLeft = 460
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 613
      ExplicitWidth = 537
      inherited lbl5: TLabel
        Left = 539
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
