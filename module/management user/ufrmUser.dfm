inherited frmUser: TfrmUser
  ClientHeight = 394
  ClientWidth = 687
  ExplicitWidth = 703
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 687
    Height = 305
    ExplicitWidth = 687
    ExplicitHeight = 305
    inherited pgcBrowse: TcxPageControl
      Width = 685
      Height = 303
      ExplicitWidth = 685
      ExplicitHeight = 303
      ClientRectBottom = 302
      ClientRectRight = 684
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 683
        inherited cxGrid: TcxGrid
          Width = 683
          Height = 301
          ExplicitWidth = 683
          ExplicitHeight = 301
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 687
    ExplicitWidth = 687
    inherited lblFilterData: TcxLabel
      Left = 333
      ExplicitLeft = 333
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 394
      ExplicitLeft = 394
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 510
      ExplicitLeft = 510
    end
    inherited btnSearch: TcxButton
      Left = 605
      ExplicitLeft = 605
    end
    inherited lblsdFilter: TcxLabel
      Left = 486
      ExplicitLeft = 486
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 338
    Width = 687
    ExplicitTop = 338
    ExplicitWidth = 687
    inherited pnlFooter: TPanel
      Width = 687
      ExplicitWidth = 687
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
        Left = 610
        Action = actClose
        ExplicitLeft = 610
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 687
      ExplicitWidth = 687
      inherited lbEscape: TLabel
        Left = 613
        Height = 17
        ExplicitLeft = 613
      end
    end
  end
end
