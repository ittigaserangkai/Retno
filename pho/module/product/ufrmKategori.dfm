inherited frmKategori: TfrmKategori
  Caption = 'frmKategori'
  ClientHeight = 424
  ClientWidth = 627
  ExplicitWidth = 643
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 627
    Height = 335
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 605
      Height = 313
      ExplicitWidth = 102
      ClientRectBottom = 313
      ClientRectRight = 605
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 102
        ExplicitHeight = 292
        inherited cxGrid: TcxGrid
          Width = 605
          Height = 313
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 102
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 627
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 273
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 334
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 450
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 545
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 426
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 368
    Width = 627
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 627
      ExplicitWidth = 124
      inherited btnClose: TcxButton
        Left = 550
        Action = actClose
        ExplicitLeft = 47
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
      Width = 627
      ExplicitWidth = 124
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 553
        Height = 17
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
