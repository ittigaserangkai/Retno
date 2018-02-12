inherited frmDialogShift: TfrmDialogShift
  Left = 380
  Top = 260
  Caption = 'frmDialogShift'
  ClientHeight = 237
  ClientWidth = 423
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  ExplicitWidth = 439
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 423
    Height = 181
    ExplicitWidth = 423
    ExplicitHeight = 181
    object lbl1: TLabel
      Left = 30
      Top = 61
      Width = 52
      Height = 16
      Caption = 'Start Time'
    end
    object Label1: TLabel
      Left = 30
      Top = 119
      Width = 44
      Height = 16
      Caption = 'End Time'
    end
    object edtNameShift: TLabeledEdit
      Tag = 1
      Left = 30
      Top = 32
      Width = 104
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 53
      EditLabel.Height = 16
      EditLabel.Caption = 'Shift Name'
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object dtpStart: TDateTimePicker
      Left = 30
      Top = 80
      Width = 102
      Height = 24
      Date = 39316.333333333340000000
      Format = 'HH : mm : ss'
      Time = 39316.333333333340000000
      Kind = dtkTime
      TabOrder = 1
    end
    object dtpEnd: TDateTimePicker
      Left = 30
      Top = 138
      Width = 102
      Height = 24
      Date = 39316.666666666660000000
      Format = 'HH : mm : ss'
      Time = 39316.666666666660000000
      Kind = dtkTime
      TabOrder = 2
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 181
    Width = 423
    ExplicitTop = 181
    ExplicitWidth = 423
    inherited pnlFooter: TPanel
      Width = 423
      ExplicitWidth = 423
      inherited btnClose: TcxButton
        Left = 346
        Action = actCancel
        ExplicitLeft = 346
      end
      inherited btnSave: TcxButton
        Left = 177
        Action = actSave
        ExplicitLeft = 177
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 269
        Action = actPrint
        ExplicitLeft = 269
      end
    end
    inherited pnlSortCut: TPanel
      Width = 423
      ExplicitWidth = 423
      inherited lbCTRLEnter: TLabel
        Left = 65
        ExplicitLeft = 65
      end
      inherited lbEscape: TLabel
        Left = 339
        ExplicitLeft = 339
      end
      inherited lblCTRLP: TLabel
        Left = 263
        ExplicitLeft = 263
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 168
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
