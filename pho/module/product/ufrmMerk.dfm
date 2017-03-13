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
    ExplicitWidth = 651
    ExplicitHeight = 281
    inherited pgcBrowse: TcxPageControl
      Width = 629
      Height = 259
      ExplicitWidth = 629
      ExplicitHeight = 259
      ClientRectBottom = 259
      ClientRectRight = 629
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 629
        ExplicitHeight = 259
        inherited cxGrid: TcxGrid
          Width = 629
          Height = 259
          ExplicitWidth = 629
          ExplicitHeight = 259
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 651
    ExplicitWidth = 651
    inherited lblFilterData: TcxLabel
      Left = 297
      ExplicitLeft = 297
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 358
      ExplicitLeft = 358
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 474
      ExplicitLeft = 474
    end
    inherited btnSearch: TcxButton
      Left = 569
      ExplicitLeft = 569
    end
    inherited lblsdFilter: TcxLabel
      Left = 450
      ExplicitLeft = 450
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 314
    Width = 651
    ExplicitTop = 314
    ExplicitWidth = 651
    inherited pnlFooter: TPanel
      Width = 651
      ExplicitWidth = 651
      inherited btnClose: TcxButton
        Left = 574
        Action = actClose
        ExplicitLeft = 574
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
      ExplicitWidth = 651
      inherited lbl5: TLabel
        Left = 577
        ExplicitLeft = 577
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
