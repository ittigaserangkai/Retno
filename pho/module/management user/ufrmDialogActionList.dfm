inherited frmDialogActionList: TfrmDialogActionList
  Left = 295
  Top = 166
  Caption = 'frmDialogActionList'
  ClientHeight = 261
  ClientWidth = 370
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 370
    Height = 205
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 205
    Width = 370
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
