inherited frmDialogShift: TfrmDialogShift
  Left = 380
  Top = 260
  Caption = 'frmDialogShift'
  ClientHeight = 241
  ClientWidth = 309
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 325
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 309
    Height = 185
    ExplicitWidth = 309
    ExplicitHeight = 185
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
    Top = 185
    Width = 309
    ExplicitTop = 185
    ExplicitWidth = 309
    inherited pnlFooter: TPanel
      Width = 309
      ExplicitWidth = 309
      inherited btnClose: TcxButton
        Left = 232
        Action = actCancel
        ExplicitLeft = 232
      end
      inherited btnSave: TcxButton
        Left = 63
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 63
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 155
        ExplicitLeft = 155
      end
    end
    inherited pnlSortCut: TPanel
      Width = 309
      ExplicitWidth = 309
      inherited lbCTRLEnter: TLabel
        Left = -49
        Height = 15
        ExplicitLeft = -49
      end
      inherited lbEscape: TLabel
        Left = 225
        Height = 15
        ExplicitLeft = 225
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 149
        ExplicitLeft = 149
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
