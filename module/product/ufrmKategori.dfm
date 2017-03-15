inherited frmKategori: TfrmKategori
  Caption = 'frmKategori'
  ClientHeight = 424
  ClientWidth = 627
  ExplicitTop = 8
  ExplicitWidth = 643
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 627
    Height = 335
    ExplicitWidth = 627
    ExplicitHeight = 335
    inherited pgcBrowse: TcxPageControl
      Width = 605
      Height = 313
      ExplicitWidth = 605
      ExplicitHeight = 313
      ClientRectBottom = 312
      ClientRectRight = 604
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 603
        ExplicitHeight = 311
        inherited cxGrid: TcxGrid
          Width = 603
          Height = 311
          ExplicitWidth = 603
          ExplicitHeight = 311
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 627
    ExplicitWidth = 627
    inherited lblFilterData: TcxLabel
      Left = 273
      ExplicitLeft = 273
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 334
      ExplicitLeft = 334
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 450
      ExplicitLeft = 450
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 545
      ExplicitLeft = 545
    end
    inherited lblsdFilter: TcxLabel
      Left = 426
      ExplicitLeft = 426
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 368
    Width = 627
    ExplicitTop = 368
    ExplicitWidth = 627
    inherited pnlFooter: TPanel
      Width = 627
      ExplicitWidth = 627
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
        Left = 550
        Action = actClose
        ExplicitLeft = 550
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 627
      ExplicitWidth = 627
      inherited lbEscape: TLabel
        Left = 553
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 544
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
