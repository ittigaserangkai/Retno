inherited frmBank: TfrmBank
  Left = 284
  Top = 210
  Caption = 'Bank'
  ClientHeight = 438
  ClientWidth = 623
  OldCreateOrder = True
  ExplicitTop = -23
  ExplicitWidth = 639
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 623
    Height = 349
    ExplicitWidth = 623
    ExplicitHeight = 349
    inherited cxGrid: TcxGrid
      Width = 601
      Height = 327
      ExplicitWidth = 601
      ExplicitHeight = 327
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
      Left = 267
      ExplicitLeft = 267
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 328
      ExplicitLeft = 328
    end
    inherited lblsdFilter: TcxLabel
      Left = 420
      ExplicitLeft = 429
      ExplicitTop = 7
      AnchorY = 17
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 446
      ExplicitLeft = 423
    end
    inherited btnSearch: TcxButton
      Left = 541
      ExplicitLeft = 518
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
      inherited btnClose: TcxButton
        Left = 546
        Action = actClose
        ExplicitLeft = 546
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 623
      ExplicitWidth = 623
      inherited lbl5: TLabel
        Left = 549
        ExplicitLeft = 549
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
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
