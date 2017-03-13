inherited frmMerk: TfrmMerk
  Caption = 'frmMerk'
  ClientHeight = 370
  ClientWidth = 651
  ExplicitWidth = 667
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 651
    Height = 281
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 629
      Height = 259
      ExplicitWidth = 102
      ClientRectBottom = 259
      ClientRectRight = 629
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 102
        ExplicitHeight = 292
        inherited cxGrid: TcxGrid
          Width = 629
          Height = 259
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 102
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 651
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 297
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 358
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 474
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 569
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 450
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 314
    Width = 651
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 651
      ExplicitWidth = 124
      inherited btnClose: TcxButton
        Left = 574
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
      Width = 651
      ExplicitWidth = 124
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 577
        Height = 17
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
