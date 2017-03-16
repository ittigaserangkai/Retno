inherited frmDialogAdjustmentProduct: TfrmDialogAdjustmentProduct
  Left = 195
  Top = 116
  Caption = 'Dialog Adjustment Product'
  ClientHeight = 464
  ClientWidth = 664
  OldCreateOrder = True
  ExplicitWidth = 678
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 664
    Height = 408
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 408
    Width = 664
    inherited pnlFooter: TPanel
      inherited btnSave: TcxButton
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
end
