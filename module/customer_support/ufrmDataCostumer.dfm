inherited frmDataCostumer: TfrmDataCostumer
  Caption = 'frmDataCostumer'
  ClientHeight = 383
  ClientWidth = 603
  OldCreateOrder = True
  ExplicitWidth = 619
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 603
    Height = 294
    ExplicitWidth = 569
    ExplicitHeight = 238
    inherited pgcBrowse: TcxPageControl
      Width = 601
      Height = 292
      ExplicitWidth = 547
      ExplicitHeight = 216
      ClientRectBottom = 291
      ClientRectRight = 600
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 545
        ExplicitHeight = 214
        inherited cxGrid: TcxGrid
          Width = 579
          Height = 270
          ExplicitWidth = 545
          ExplicitHeight = 214
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 603
    ExplicitWidth = 603
    inherited lblFilterData: TcxLabel
      Left = 249
      ExplicitLeft = 249
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 310
      ExplicitLeft = 276
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 426
      ExplicitLeft = 392
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 521
      ExplicitLeft = 487
    end
    inherited lblsdFilter: TcxLabel
      Left = 402
      ExplicitLeft = 402
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 327
    Width = 603
    ExplicitTop = 327
    ExplicitWidth = 569
    inherited pnlFooter: TPanel
      Width = 603
      ExplicitWidth = 569
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
        Left = 526
        Action = actClose
        ExplicitLeft = 492
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 603
      ExplicitWidth = 569
      inherited lbEscape: TLabel
        Left = 529
        ExplicitLeft = 529
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
