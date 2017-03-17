inherited frmUnit: TfrmUnit
  Left = 163
  Top = 152
  Caption = 'Store Unit'
  ClientHeight = 397
  ClientWidth = 771
  OldCreateOrder = True
  ExplicitWidth = 787
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 771
    Height = 308
    BorderWidth = 2
    ExplicitWidth = 771
    ExplicitHeight = 308
    inherited pgcBrowse: TcxPageControl
      Left = 3
      Top = 3
      Width = 765
      Height = 302
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 765
      ExplicitHeight = 302
      ClientRectBottom = 301
      ClientRectRight = 764
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 763
        ExplicitHeight = 300
        inherited cxGrid: TcxGrid
          Width = 763
          Height = 300
          ExplicitWidth = 763
          ExplicitHeight = 300
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 771
    ExplicitWidth = 771
    inherited lblHeader: TLabel
      Width = 62
      Caption = 'UNIT STORE'
      ExplicitWidth = 62
    end
    inherited lblFilterData: TcxLabel
      Left = 417
      ExplicitLeft = 417
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 478
      ExplicitLeft = 478
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 594
      ExplicitLeft = 594
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 689
      ExplicitLeft = 689
    end
    inherited lblsdFilter: TcxLabel
      Left = 570
      ExplicitLeft = 570
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 341
    Width = 771
    ExplicitTop = 341
    ExplicitWidth = 771
    inherited pnlFooter: TPanel
      Width = 771
      ExplicitWidth = 771
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
        Left = 694
        Action = actClose
        ExplicitLeft = 694
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 771
      ExplicitWidth = 771
      inherited lbEscape: TLabel
        Left = 697
        ExplicitLeft = 697
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
