inherited frmBankAccDialog: TfrmBankAccDialog
  Left = 362
  Top = 172
  Caption = 'frmBankAccDialog'
  ClientHeight = 251
  ClientWidth = 283
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 283
    Height = 195
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 195
    Width = 283
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
