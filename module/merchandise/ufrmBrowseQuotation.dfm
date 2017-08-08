inherited frmBrowseQuotation: TfrmBrowseQuotation
  Caption = 'frmBrowseQuotation'
  ClientHeight = 383
  ClientWidth = 722
  ExplicitWidth = 738
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 722
    Height = 294
    ExplicitWidth = 124
    ExplicitHeight = 294
    inherited pgcBrowse: TcxPageControl
      Width = 720
      Height = 292
      ExplicitWidth = 122
      ExplicitHeight = 292
      ClientRectBottom = 291
      ClientRectRight = 719
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 120
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 718
          Height = 290
          ExplicitWidth = 120
          ExplicitHeight = 290
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 722
    ExplicitWidth = 722
    inherited lblFilterData: TcxLabel
      Left = 312
      Caption = 'Filter Effective Date'
      Visible = True
      ExplicitLeft = 312
      ExplicitWidth = 114
      Width = 114
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 429
      Visible = True
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 545
      Visible = True
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 640
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 521
      Visible = True
      ExplicitLeft = 521
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 327
    Width = 722
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 722
      ExplicitWidth = 124
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
        Left = 645
        Action = actClose
        ExplicitLeft = 47
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 722
      ExplicitWidth = 124
      inherited lbEscape: TLabel
        Left = 648
        ExplicitLeft = 648
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
