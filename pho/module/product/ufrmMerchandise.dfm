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
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 630
      Height = 264
      ExplicitWidth = 102
      ClientRectBottom = 264
      ClientRectRight = 630
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 102
        ExplicitHeight = 292
        inherited cxGrid: TcxGrid
          Width = 630
          Height = 264
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 102
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 652
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 298
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 359
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 475
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 570
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 451
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 319
    Width = 652
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 652
      ExplicitWidth = 124
      inherited btnClose: TcxButton
        Left = 575
        Action = actClose
        ExplicitLeft = 47
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
      Width = 652
      ExplicitWidth = 124
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 578
        Height = 17
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
