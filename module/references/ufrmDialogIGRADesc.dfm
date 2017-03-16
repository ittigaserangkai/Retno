inherited frmDialogIGRADesc: TfrmDialogIGRADesc
  Left = 364
  Top = 233
  Caption = 'frmDialogIGRADesc'
  ClientHeight = 159
  ClientWidth = 328
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 328
    Height = 103
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 103
    Width = 328
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
