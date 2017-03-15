inherited frmMerchandise: TfrmMerchandise
  Caption = 'frmMerchandise'
  ClientHeight = 375
  ClientWidth = 652
  ExplicitWidth = 668
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 652
    Height = 286
    ExplicitTop = 33
    ExplicitWidth = 652
    ExplicitHeight = 286
    inherited pgcBrowse: TcxPageControl
      Width = 630
      Height = 264
      ExplicitWidth = 630
      ExplicitHeight = 264
      ClientRectBottom = 263
      ClientRectRight = 629
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 628
        ExplicitHeight = 262
        inherited cxGrid: TcxGrid
          Width = 628
          Height = 262
          ExplicitWidth = 628
          ExplicitHeight = 262
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 652
    ExplicitWidth = 652
    inherited lblFilterData: TcxLabel
      Left = 298
      ExplicitLeft = 298
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 359
      ExplicitLeft = 359
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 475
      ExplicitLeft = 475
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 570
      ExplicitLeft = 570
    end
    inherited lblsdFilter: TcxLabel
      Left = 451
      ExplicitLeft = 451
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 319
    Width = 652
    ExplicitTop = 319
    ExplicitWidth = 652
    inherited pnlFooter: TPanel
      Width = 652
      ExplicitWidth = 652
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
        Left = 575
        Action = actClose
        ExplicitLeft = 575
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 652
      ExplicitWidth = 652
      inherited lbEscape: TLabel
        Left = 578
        Height = 17
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
