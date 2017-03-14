inherited frmDialogMerchandiseGroup: TfrmDialogMerchandiseGroup
  Left = 421
  Top = 118
  Caption = 'frmDialogMerchandiseGroup'
  ClientHeight = 201
  ClientWidth = 395
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 395
    Height = 145
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 145
    Width = 395
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
