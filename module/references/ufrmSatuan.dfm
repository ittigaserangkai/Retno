inherited frmSatuan: TfrmSatuan
  Left = 223
  Top = 160
  Caption = 'Unit Of Measure'
  ClientHeight = 422
  ClientWidth = 760
  OldCreateOrder = True
  ExplicitTop = -82
  ExplicitWidth = 776
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 760
    Height = 333
    ExplicitWidth = 760
    ExplicitHeight = 333
    inherited pgcBrowse: TcxPageControl
      Width = 758
      Height = 331
      ExplicitWidth = 758
      ExplicitHeight = 331
      ClientRectBottom = 330
      ClientRectRight = 757
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 756
        ExplicitHeight = 329
        inherited cxGrid: TcxGrid
          Width = 756
          Height = 329
          ExplicitWidth = 756
          ExplicitHeight = 329
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 760
    ExplicitWidth = 760
    inherited lblFilterData: TcxLabel
      Left = 406
      ExplicitLeft = 406
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 467
      ExplicitLeft = 467
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 583
      ExplicitLeft = 583
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 678
      ExplicitLeft = 678
    end
    inherited lblsdFilter: TcxLabel
      Left = 559
      ExplicitLeft = 559
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 366
    Width = 760
    ExplicitTop = 366
    ExplicitWidth = 760
    inherited pnlFooter: TPanel
      Width = 760
      ExplicitWidth = 760
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
        Left = 683
        Action = actClose
        ExplicitLeft = 683
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 760
      ExplicitWidth = 760
      inherited lbEscape: TLabel
        Left = 686
        Height = 17
        ExplicitLeft = 686
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
  object actlstSatuan: TActionList
    Left = 488
    Top = 8
    object actAddSatuan: TAction
      Caption = 'Add'
      OnExecute = actAddSatuanExecute
    end
    object actEditSatuan: TAction
      Caption = 'Edit'
      OnExecute = actEditSatuanExecute
    end
    object actDeleteSatuan: TAction
      Caption = 'Delete'
      OnExecute = actDeleteSatuanExecute
    end
    object actRefreshSatuan: TAction
      Caption = 'Refresh'
    end
  end
end
