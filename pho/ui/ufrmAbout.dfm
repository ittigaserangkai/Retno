inherited frmAbout: TfrmAbout
  Left = 357
  Top = 260
  Caption = 'About Head Office'
  ClientHeight = 269
  ClientWidth = 272
  Constraints.MaxHeight = 308
  Constraints.MaxWidth = 288
  Constraints.MinHeight = 308
  Constraints.MinWidth = 288
  OldCreateOrder = True
  ExplicitWidth = 288
  ExplicitHeight = 308
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 272
    Height = 213
    ExplicitWidth = 272
    ExplicitHeight = 213
    object lbx2: TcxLabel
      Left = 32
      Top = 96
      Caption = 'lbx2'
    end
    object lbx1: TcxLabel
      Left = 32
      Top = 70
      Caption = 'lbx1'
    end
    object lbx5: TcxLabel
      Left = 32
      Top = 122
      Caption = 'lbx5'
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 213
    Width = 272
    ExplicitTop = 213
    ExplicitWidth = 272
    inherited pnlFooter: TPanel
      Width = 272
      ExplicitWidth = 272
      inherited btnClose: TcxButton
        Left = 190
        Action = actCancel
        ExplicitLeft = 190
      end
      inherited btnSave: TcxButton
        Left = 103
        Action = actSave
        ExplicitLeft = 103
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 272
      ExplicitWidth = 272
    end
  end
end
