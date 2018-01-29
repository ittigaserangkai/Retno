inherited frmDOBonus: TfrmDOBonus
  Caption = 'DO Bonus'
  ClientHeight = 417
  ClientWidth = 731
  ExplicitWidth = 747
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 731
    Height = 328
    ExplicitWidth = 731
    ExplicitHeight = 328
    inherited pgcBrowse: TcxPageControl
      Width = 729
      Height = 326
      ExplicitWidth = 729
      ExplicitHeight = 326
      ClientRectBottom = 325
      ClientRectRight = 728
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 727
        ExplicitHeight = 324
        inherited cxGrid: TcxGrid
          Width = 727
          Height = 324
          ExplicitWidth = 727
          ExplicitHeight = 324
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 731
    ExplicitWidth = 731
    inherited lblHeader: TLabel
      Width = 53
      Caption = 'DO Bonus'
      ExplicitWidth = 53
    end
    inherited lblFilterData: TcxLabel
      Left = 377
      Visible = True
      ExplicitLeft = 377
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 438
      Visible = True
      ExplicitLeft = 438
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 554
      Visible = True
      ExplicitLeft = 554
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 649
      ExplicitLeft = 649
    end
    inherited lblsdFilter: TcxLabel
      Left = 530
      Visible = True
      ExplicitLeft = 530
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 361
    Width = 731
    ExplicitTop = 361
    ExplicitWidth = 731
    inherited pnlFooter: TPanel
      Width = 731
      ExplicitWidth = 731
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
        Left = 654
        Action = actClose
        ExplicitLeft = 654
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 731
      ExplicitWidth = 731
      inherited lbEscape: TLabel
        Left = 657
        Height = 17
        ExplicitLeft = 657
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
