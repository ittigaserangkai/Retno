inherited frmCostCenter: TfrmCostCenter
  Caption = 'frmCostCenter'
  ClientHeight = 335
  ClientWidth = 755
  ExplicitTop = 8
  ExplicitWidth = 771
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 755
    Height = 246
    ExplicitWidth = 755
    ExplicitHeight = 246
    inherited pgcBrowse: TcxPageControl
      Width = 733
      Height = 224
      ExplicitWidth = 733
      ExplicitHeight = 224
      ClientRectBottom = 223
      ClientRectRight = 732
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Width = 733
          Height = 224
          ExplicitWidth = 733
          ExplicitHeight = 224
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 755
    ExplicitWidth = 755
    inherited lblFilterData: TcxLabel
      Left = 401
      Enabled = False
      ExplicitLeft = 401
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 462
      Enabled = False
      ExplicitLeft = 493
      ExplicitHeight = 24
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 578
      Enabled = False
      ExplicitLeft = 588
      ExplicitHeight = 21
    end
    inherited btnSearch: TcxButton
      Left = 673
      ExplicitLeft = 706
      ExplicitTop = 4
      ExplicitHeight = 25
    end
    inherited lblsdFilter: TcxLabel
      Left = 554
      Enabled = False
      ExplicitLeft = 554
      AnchorY = 17
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
        Left = 673
        Action = actClose
        ExplicitLeft = 673
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
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
