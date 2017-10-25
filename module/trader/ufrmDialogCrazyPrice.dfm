inherited frmDialogCrazyPrice: TfrmDialogCrazyPrice
  Caption = 'Dialog Crazy Price'
  ClientHeight = 457
  ClientWidth = 818
  ExplicitWidth = 834
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 818
    Height = 401
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 401
    Width = 818
    inherited pnlFooter: TPanel
      Width = 818
      inherited btnClose: TcxButton
        Left = 741
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 648
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 571
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 818
      inherited lbCTRLEnter: TLabel
        Left = 643
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 734
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 567
        Height = 15
      end
    end
  end
end
