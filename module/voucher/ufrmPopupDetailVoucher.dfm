inherited frmPopupDetailVoucher: TfrmPopupDetailVoucher
  Left = 355
  Top = 201
  Caption = 'Detail Voucher'
  ClientHeight = 397
  ClientWidth = 403
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 419
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 403
    Height = 341
    BevelInner = bvNone
    BorderWidth = 10
    ExplicitWidth = 329
    ExplicitHeight = 341
    inherited cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 381
      Height = 319
      ExplicitLeft = 11
      ExplicitTop = 11
      ExplicitWidth = 307
      ExplicitHeight = 319
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 341
    Width = 403
    ExplicitTop = 341
    ExplicitWidth = 329
    inherited pnlFooter: TPanel
      Width = 403
      ExplicitWidth = 329
      inherited btnClose: TcxButton
        Left = 250
        Action = actCancel
        Caption = 'Close'
        ExplicitLeft = 176
      end
      inherited btnSave: TcxButton
        Left = 157
        Action = actSave
        Visible = False
        ExplicitLeft = 83
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 327
        Action = actPrint
        ExplicitLeft = 253
      end
    end
    inherited pnlSortCut: TPanel
      Width = 403
      ExplicitWidth = 329
      inherited lbCTRLEnter: TLabel
        Left = 228
        Height = 15
        ExplicitLeft = 154
      end
      inherited lbEscape: TLabel
        Left = 319
        Height = 15
        ExplicitLeft = 245
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 152
        Height = 15
        ExplicitLeft = 78
      end
    end
  end
end
