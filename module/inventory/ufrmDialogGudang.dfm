inherited frmDialogGudang: TfrmDialogGudang
  Left = 300
  Top = 152
  Caption = 'frmDialogGudang'
  ClientHeight = 337
  ClientWidth = 514
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 530
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 514
    Height = 281
    ExplicitWidth = 421
    ExplicitHeight = 251
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 281
    Width = 514
    ExplicitTop = 251
    ExplicitWidth = 421
    inherited pnlFooter: TPanel
      Width = 514
      ExplicitWidth = 421
      inherited btnClose: TcxButton
        Left = 437
        Action = actCancel
        ExplicitLeft = 344
      end
      inherited btnSave: TcxButton
        Left = 344
        Action = actSave
        ExplicitLeft = 251
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 514
      ExplicitWidth = 421
      inherited lbCTRLEnter: TLabel
        Left = 336
        Width = 88
        Height = 15
        Caption = ' Ctrl-Enter [Save]'
        ExplicitLeft = 285
        ExplicitWidth = 88
      end
      inherited lbEscape: TLabel
        Left = 430
        Height = 15
        ExplicitLeft = 328
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 424
    Top = 112
  end
end
