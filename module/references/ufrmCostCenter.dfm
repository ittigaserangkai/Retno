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
    inherited pgcBrowse: TcxPageControl
      Width = 733
      Height = 224
      ExplicitWidth = 733
      ExplicitHeight = 224
      ClientRectBottom = 223
      ClientRectRight = 732
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 731
        ExplicitHeight = 222
        inherited cxGrid: TcxGrid
          Width = 731
          Height = 222
          ExplicitWidth = 731
          ExplicitHeight = 222
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 755
    ExplicitWidth = 755
    inherited lblHeader: TLabel
      Width = 122
      Caption = 'MASTER COST CENTER'
      ExplicitWidth = 122
    end
    inherited lblFilterData: TcxLabel
      Left = 401
      Enabled = False
      ExplicitLeft = 401
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 462
      Enabled = False
      ExplicitLeft = 462
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 578
      Enabled = False
      ExplicitLeft = 578
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 673
      ExplicitLeft = 673
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
        Left = 678
        Action = actClose
        ExplicitLeft = 678
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 755
      ExplicitWidth = 755
      inherited lbEscape: TLabel
        Left = 681
        Height = 17
        ExplicitLeft = 681
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
