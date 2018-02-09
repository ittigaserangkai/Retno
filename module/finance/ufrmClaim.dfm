inherited frmClaim: TfrmClaim
  AlignWithMargins = True
  Caption = 'Claim Faktur'
  ClientHeight = 379
  ClientWidth = 762
  ExplicitWidth = 778
  ExplicitHeight = 418
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 762
    Height = 290
    ExplicitWidth = 762
    ExplicitHeight = 290
    inherited pgcBrowse: TcxPageControl
      Width = 760
      Height = 288
      ExplicitWidth = 760
      ExplicitHeight = 288
      ClientRectBottom = 287
      ClientRectRight = 759
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 758
        ExplicitHeight = 286
        inherited cxGrid: TcxGrid
          Width = 758
          Height = 286
          ExplicitWidth = 758
          ExplicitHeight = 286
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 762
    ExplicitWidth = 762
    inherited lblHeader: TLabel
      Width = 80
      Caption = 'CLAIM FAKTUR'
      ExplicitWidth = 80
    end
    inherited lblFilterData: TcxLabel
      Left = 408
      Visible = True
      ExplicitLeft = 408
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 469
      Visible = True
      ExplicitLeft = 469
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 585
      Visible = True
      ExplicitLeft = 585
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 680
      ExplicitLeft = 680
    end
    inherited lblsdFilter: TcxLabel
      Left = 561
      Visible = True
      ExplicitLeft = 561
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 323
    Width = 762
    ExplicitTop = 323
    ExplicitWidth = 762
    inherited pnlFooter: TPanel
      Width = 762
      ExplicitWidth = 762
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
        Left = 685
        Action = actClose
        ExplicitLeft = 685
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 762
      ExplicitWidth = 762
      inherited lbEscape: TLabel
        Left = 688
        ExplicitLeft = 688
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
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
