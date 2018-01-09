inherited frmCashIn: TfrmCashIn
  Caption = 'Cash In'
  ClientHeight = 340
  ClientWidth = 691
  ExplicitWidth = 707
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 691
    Height = 251
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 689
      Height = 249
      ExplicitWidth = 118
      ClientRectBottom = 248
      ClientRectRight = 688
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 687
          Height = 247
          ExplicitWidth = 116
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 691
    ExplicitWidth = 120
    inherited lblFilterData: TcxLabel
      Left = 337
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 398
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 514
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 609
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 490
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 284
    Width = 691
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 691
      ExplicitWidth = 120
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
        Left = 614
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 691
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 617
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
