inherited frmSubGroup: TfrmSubGroup
  Caption = 'Data Sub Group'
  ClientHeight = 395
  ClientWidth = 668
  ExplicitTop = 8
  ExplicitWidth = 684
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 668
    Height = 306
    ExplicitWidth = 668
    ExplicitHeight = 306
    inherited pgcBrowse: TcxPageControl
      Width = 646
      Height = 284
      ExplicitWidth = 646
      ExplicitHeight = 284
      ClientRectBottom = 283
      ClientRectRight = 645
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 644
        ExplicitHeight = 282
        inherited cxGrid: TcxGrid
          Width = 644
          Height = 282
          ExplicitWidth = 644
          ExplicitHeight = 282
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 668
    ExplicitWidth = 668
    inherited lblFilterData: TcxLabel
      Left = 314
      ExplicitLeft = 314
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 375
      ExplicitLeft = 375
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 491
      ExplicitLeft = 491
    end
    inherited btnSearch: TcxButton
      Left = 586
      ExplicitLeft = 586
    end
    inherited lblsdFilter: TcxLabel
      Left = 467
      ExplicitLeft = 467
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 339
    Width = 668
    ExplicitTop = 339
    ExplicitWidth = 668
    inherited pnlFooter: TPanel
      Width = 668
      ExplicitWidth = 668
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
        Left = 591
        Action = actClose
        ExplicitLeft = 591
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 668
      ExplicitWidth = 668
      inherited lbEscape: TLabel
        Left = 594
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
