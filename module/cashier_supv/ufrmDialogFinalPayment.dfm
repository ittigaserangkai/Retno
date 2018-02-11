inherited frmDialogFinalPayment: TfrmDialogFinalPayment
  Left = 247
  Top = 152
  Caption = 'Update Final Payment'
  ClientHeight = 215
  ClientWidth = 344
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnDestroy = FormDestroy
  ExplicitWidth = 360
  ExplicitHeight = 254
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 344
    Height = 159
    ExplicitWidth = 344
    ExplicitHeight = 159
    object lbl4: TLabel
      Left = 16
      Top = 8
      Width = 23
      Height = 16
      Caption = 'Time'
    end
    object lbl1: TLabel
      Left = 16
      Top = 34
      Width = 47
      Height = 16
      Caption = 'POS Code'
    end
    object lbl2: TLabel
      Left = 16
      Top = 59
      Width = 51
      Height = 16
      Caption = 'Cashier Id'
    end
    object lbl3: TLabel
      Left = 16
      Top = 85
      Width = 68
      Height = 16
      Caption = 'Final Payment'
    end
    object edtPOSCode: TEdit
      Left = 96
      Top = 32
      Width = 82
      Height = 22
      TabStop = False
      Color = 15198183
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtCashierID: TEdit
      Left = 96
      Top = 57
      Width = 82
      Height = 22
      TabStop = False
      Color = 15198183
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtFinPay: TcxCurrencyEdit
      Left = 96
      Top = 82
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 2
      Width = 121
    end
    object edtClock: TcxTimeEdit
      Left = 96
      Top = 5
      EditValue = 0d
      TabOrder = 3
      Width = 81
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 159
    Width = 344
    ExplicitTop = 159
    ExplicitWidth = 344
    inherited pnlFooter: TPanel
      Width = 344
      TabOrder = 1
      ExplicitWidth = 344
      inherited btnClose: TcxButton
        Left = 267
        Action = actCancel
        ExplicitLeft = 267
      end
      inherited btnSave: TcxButton
        Left = 174
        Action = actSave
        ExplicitLeft = 174
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 97
        Action = actPrint
        ExplicitLeft = 97
      end
    end
    inherited pnlSortCut: TPanel
      Width = 344
      TabOrder = 0
      ExplicitWidth = 344
      inherited lbCTRLDel: TLabel [0]
      end
      inherited lbCTRLEnter: TLabel [1]
        Left = 169
        ExplicitLeft = 169
      end
      inherited lbEscape: TLabel [2]
        Left = 260
        ExplicitLeft = 260
      end
      inherited lblCTRLP: TLabel
        Left = 93
        ExplicitLeft = 93
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 240
    Top = 24
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 256
    Top = 88
  end
end
