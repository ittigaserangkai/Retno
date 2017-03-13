inherited frmSubGroup: TfrmSubGroup
  Caption = 'frmSubGroup'
  ClientHeight = 395
  ClientWidth = 668
  ExplicitWidth = 684
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 668
    Height = 306
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 646
      Height = 284
      ExplicitWidth = 102
      ClientRectBottom = 284
      ClientRectRight = 646
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 102
        ExplicitHeight = 292
        inherited cxGrid: TcxGrid
          Width = 646
          Height = 284
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 102
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 668
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 314
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 375
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 491
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 586
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 467
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 339
    Width = 668
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 668
      ExplicitWidth = 124
      inherited btnClose: TcxButton
        Left = 591
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
      Width = 668
      ExplicitWidth = 124
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 594
        Height = 17
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
