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
    ExplicitHeight = 293
    inherited cxGrid: TcxGrid
      Width = 601
      Height = 327
      ExplicitLeft = 11
      ExplicitTop = 11
      ExplicitWidth = 601
      ExplicitHeight = 271
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
      ExplicitTop = 1
      ExplicitHeight = 31
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 328
      ExplicitLeft = 328
      ExplicitTop = 5
      ExplicitHeight = 23
    end
    inherited lblsdFilter: TcxLabel
      Left = 599
      ExplicitLeft = 599
      ExplicitTop = 1
      ExplicitHeight = 31
      AnchorY = 17
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 423
      ExplicitLeft = 423
      ExplicitTop = 5
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 518
      ExplicitLeft = 518
      ExplicitTop = 3
      ExplicitHeight = 27
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 382
    Width = 623
    ExplicitTop = 326
    ExplicitWidth = 623
    inherited pnlFooter: TPanel
      Width = 623
      ExplicitLeft = -1
      ExplicitTop = 18
      ExplicitWidth = 623
      inherited btnClose: TcxButton
        Left = 546
        Action = actClose
        ExplicitLeft = 546
        ExplicitTop = 4
      end
      inherited btnAdd: TcxButton
        Action = actAdd
        ExplicitTop = 4
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        ExplicitTop = 4
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 623
      ExplicitWidth = 623
      inherited lbl1: TLabel
        ExplicitLeft = 5
      end
      inherited lbl2: TLabel
        ExplicitLeft = 88
      end
      inherited lbl5: TLabel
        Left = 549
        ExplicitLeft = 587
        ExplicitTop = 2
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstBank: TActionList
    Left = 544
    Top = 8
    object actAddBank: TAction
      Caption = 'Add'
      OnExecute = actAddBankExecute
    end
    object actEditBank: TAction
      Caption = 'Edit'
      OnExecute = actEditBankExecute
    end
    object actDeleteBank: TAction
      Caption = 'Delete'
      OnExecute = actDeleteBankExecute
    end
    object actRefreshBank: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshBankExecute
    end
  end
end
