inherited frmDialogCompany: TfrmDialogCompany
  Caption = 'frmDialogCompany'
  PixelsPerInch = 96
  TextHeight = 16
  inherited footerDialogMaster: TfraFooterDialog3Button
    inherited pnlFooter: TPanel
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      inherited lbCTRLEnter: TLabel
        Height = 15
      end
      inherited lbEscape: TLabel
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
end
