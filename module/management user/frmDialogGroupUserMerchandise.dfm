inherited frmMasterDialog2: TfrmMasterDialog2
  Left = 261
  Top = 73
  Caption = 'frmMasterDialog2'
  ClientHeight = 358
  ClientWidth = 331
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 331
    Height = 302
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 302
    Width = 331
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
