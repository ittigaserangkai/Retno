inherited frmSupplierType: TfrmSupplierType
  Top = 282
  Caption = 'Supplier Type'
  ClientHeight = 336
  ClientWidth = 542
  OldCreateOrder = True
  ExplicitWidth = 558
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 542
    Height = 247
    ExplicitWidth = 542
    ExplicitHeight = 247
    inherited pgcBrowse: TcxPageControl
      Width = 520
      Height = 225
      ExplicitWidth = 520
      ExplicitHeight = 225
      ClientRectBottom = 225
      ClientRectRight = 520
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 520
        ExplicitHeight = 225
        inherited cxGrid: TcxGrid
          Width = 520
          Height = 225
          ExplicitWidth = 520
          ExplicitHeight = 225
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 542
    ExplicitWidth = 542
    inherited lblFilterData: TcxLabel
      Left = 188
      ExplicitLeft = 188
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 249
      ExplicitLeft = 249
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 365
      ExplicitLeft = 365
    end
    inherited btnSearch: TcxButton
      Left = 460
      ExplicitLeft = 460
    end
    inherited lblsdFilter: TcxLabel
      Left = 341
      ExplicitLeft = 341
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 280
    Width = 542
    ExplicitTop = 280
    ExplicitWidth = 542
    inherited pnlFooter: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited btnClose: TcxButton
        Left = 465
        Action = actClose
        ExplicitLeft = 465
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
      Width = 542
      ExplicitWidth = 542
      inherited lbl5: TLabel
        Left = 468
        ExplicitLeft = 468
      end
    end
  end
end
