inherited frmReturTrader: TfrmReturTrader
  Left = 307
  Top = 94
  Caption = 'Retur Assgros'
  ClientHeight = 455
  ClientWidth = 759
  ExplicitWidth = 775
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 759
    Height = 366
    ExplicitWidth = 759
    ExplicitHeight = 366
    inherited pgcBrowse: TcxPageControl
      Width = 757
      Height = 364
      ExplicitWidth = 757
      ExplicitHeight = 364
      ClientRectBottom = 363
      ClientRectRight = 756
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 755
        ExplicitHeight = 362
        inherited cxGrid: TcxGrid
          Width = 755
          Height = 362
          ExplicitWidth = 755
          ExplicitHeight = 362
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 759
    ExplicitWidth = 759
    inherited lblHeader: TLabel
      Width = 79
      Caption = 'RETUR TRADER'
      ExplicitWidth = 79
    end
    inherited lblFilterData: TcxLabel
      Left = 405
      Visible = True
      ExplicitLeft = 405
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 466
      Visible = True
      ExplicitLeft = 466
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 582
      Visible = True
      ExplicitLeft = 582
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 677
      ExplicitLeft = 677
    end
    inherited lblsdFilter: TcxLabel
      Left = 558
      Visible = True
      ExplicitLeft = 558
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 399
    Width = 759
    ExplicitTop = 399
    ExplicitWidth = 759
    inherited pnlFooter: TPanel
      Width = 759
      ExplicitWidth = 759
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
        Left = 682
        Action = actClose
        ExplicitLeft = 682
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 759
      ExplicitWidth = 759
      inherited lbEscape: TLabel
        Left = 685
        Height = 17
        ExplicitLeft = 685
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
