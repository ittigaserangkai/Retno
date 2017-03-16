inherited frmDialogGroupUserMerchandise: TfrmDialogGroupUserMerchandise
  Left = 261
  Top = 73
  Caption = 'Input User Divisi'
  ClientHeight = 352
  ClientWidth = 343
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 343
    Height = 296
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 296
    Width = 343
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
