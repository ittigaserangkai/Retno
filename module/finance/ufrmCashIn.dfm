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
    ExplicitWidth = 691
    ExplicitHeight = 251
    inherited pgcBrowse: TcxPageControl
      Width = 689
      Height = 249
      ExplicitWidth = 689
      ExplicitHeight = 249
      ClientRectBottom = 248
      ClientRectRight = 688
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 687
        ExplicitHeight = 247
        inherited cxGrid: TcxGrid
          Width = 687
          Height = 247
          ExplicitWidth = 687
          ExplicitHeight = 247
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 691
    ExplicitWidth = 691
    inherited lblFilterData: TcxLabel
      Left = 337
      Visible = True
      ExplicitLeft = 337
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 398
      Visible = True
      ExplicitLeft = 398
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 514
      Visible = True
      ExplicitLeft = 514
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 609
      ExplicitLeft = 609
    end
    inherited lblsdFilter: TcxLabel
      Left = 490
      Visible = True
      ExplicitLeft = 490
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 284
    Width = 691
    ExplicitTop = 284
    ExplicitWidth = 691
    inherited pnlFooter: TPanel
      Width = 691
      ExplicitWidth = 691
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
        ExplicitLeft = 614
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 691
      ExplicitWidth = 691
      inherited lbEscape: TLabel
        Left = 617
        Height = 17
        ExplicitLeft = 617
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
