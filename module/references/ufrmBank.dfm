inherited frmBank: TfrmBank
  Left = 284
  Top = 210
  Caption = 'Bank'
  ClientHeight = 438
  ClientWidth = 623
  OldCreateOrder = True
  ExplicitWidth = 639
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 623
    Height = 349
    ExplicitWidth = 623
    ExplicitHeight = 349
    inherited pgcBrowse: TcxPageControl
      Width = 621
      Height = 347
      ExplicitWidth = 621
      ExplicitHeight = 347
      ClientRectBottom = 346
      ClientRectRight = 620
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 619
        ExplicitHeight = 345
        inherited cxGrid: TcxGrid
          Width = 619
          Height = 345
          ExplicitWidth = 619
          ExplicitHeight = 345
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 623
    ExplicitWidth = 623
    inherited lblHeader: TLabel
      Width = 69
      Caption = 'Master Bank'
      ExplicitWidth = 69
    end
    inherited lblFilterData: TcxLabel
      Left = 269
      ExplicitLeft = 269
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 330
      ExplicitLeft = 330
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 446
      ExplicitLeft = 446
    end
    inherited btnSearch: TcxButton
      Left = 541
      ExplicitLeft = 541
    end
    inherited lblsdFilter: TcxLabel
      Left = 422
      ExplicitLeft = 422
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 382
    Width = 623
    ExplicitTop = 382
    ExplicitWidth = 623
    inherited pnlFooter: TPanel
      Width = 623
      ExplicitWidth = 623
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
        Left = 546
        Action = actClose
        ExplicitLeft = 546
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 623
      ExplicitWidth = 623
      inherited lbEscape: TLabel
        Left = 549
        Height = 17
        ExplicitLeft = 549
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
