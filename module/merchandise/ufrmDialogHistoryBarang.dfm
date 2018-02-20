inherited frmDialogHistoryBarang: TfrmDialogHistoryBarang
  Caption = 'Dialog History Barang'
  PixelsPerInch = 96
  TextHeight = 16
  inherited footerDialogMaster: TfraFooterDialog3Button
    inherited pnlFooter: TPanel
      inherited btnClose: TcxButton
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Action = actPrint
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
      inherited lblCTRLP: TLabel
        Height = 15
      end
    end
  end
end
