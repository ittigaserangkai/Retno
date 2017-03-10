inherited frmCostCenter: TfrmCostCenter
  Caption = 'frmCostCenter'
  ClientHeight = 335
  ClientWidth = 755
  ExplicitWidth = 771
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 755
    Height = 246
    ExplicitWidth = 755
    ExplicitHeight = 246
    inherited cxGrid: TcxGrid
      Width = 733
      Height = 224
      ExplicitWidth = 733
      ExplicitHeight = 224
    end
  end
  inherited pnlHeader: TPanel
    Width = 755
    ExplicitWidth = 755
    inherited lblFilterData: TcxLabel
      Left = 432
      Enabled = False
      ExplicitLeft = 432
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 493
      Enabled = False
      ExplicitLeft = 493
      ExplicitTop = 5
      ExplicitHeight = 24
    end
    inherited lblsdFilter: TcxLabel
      Left = 585
      Enabled = False
      ExplicitLeft = 576
      ExplicitTop = 7
      AnchorY = 17
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 611
      Enabled = False
      ExplicitLeft = 588
      ExplicitTop = 5
    end
    inherited btnSearch: TcxButton
      Left = 706
      ExplicitLeft = 706
      ExplicitTop = 4
      ExplicitHeight = 25
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 279
    Width = 755
    ExplicitTop = 279
    ExplicitWidth = 755
    inherited pnlFooter: TPanel
      Width = 755
      ExplicitWidth = 755
      inherited btnClose: TcxButton
        Left = 673
        Action = actClose
        ExplicitLeft = 673
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
      Width = 755
      ExplicitWidth = 755
      inherited lbl5: TLabel
        Left = 665
        ExplicitLeft = 665
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actRefresh: TAction
      OnExecute = actRefreshExecute
    end
  end
end
