inherited frmDialogFinalPayment: TfrmDialogFinalPayment
  Left = 247
  Top = 152
  Caption = 'frmDialogFinalPayment'
  ClientHeight = 215
  ClientWidth = 348
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 364
  ExplicitHeight = 254
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 348
    Height = 159
    ExplicitWidth = 348
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
      Top = 32
      Width = 47
      Height = 16
      Caption = 'POS Code'
    end
    object lbl2: TLabel
      Left = 16
      Top = 57
      Width = 51
      Height = 16
      Caption = 'Cashier Id'
    end
    object lbl3: TLabel
      Left = 16
      Top = 82
      Width = 68
      Height = 16
      Caption = 'Final Payment'
    end
    object edtPOSCode: TEdit
      Left = 93
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
      Text = '01'
    end
    object edtCashierID: TEdit
      Left = 93
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
      Text = '0001'
    end
    object edtFinPay: TcxCurrencyEdit
      Left = 96
      Top = 82
      TabOrder = 2
      Width = 121
    end
    object edtClock: TcxTimeEdit
      Left = 96
      Top = 6
      EditValue = 0d
      TabOrder = 3
      Width = 81
    end
    object edtFinPay1: TcxCurrencyEdit
      Left = 248
      Top = 82
      TabOrder = 4
      OnEnter = edtFinPay1Enter
      Width = 57
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 159
    Width = 348
    ExplicitTop = 159
    ExplicitWidth = 348
    inherited pnlFooter: TPanel
      Width = 348
      TabOrder = 1
      ExplicitWidth = 348
      inherited btnClose: TcxButton
        Left = 271
        Action = actCancel
        ExplicitLeft = 271
      end
      inherited btnSave: TcxButton
        Left = 178
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 178
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 101
        ExplicitLeft = 101
      end
    end
    inherited pnlSortCut: TPanel
      Width = 348
      TabOrder = 0
      ExplicitWidth = 348
      inherited lbCTRLEnter: TLabel
        Left = -10
        Height = 15
        ExplicitLeft = -10
      end
      inherited lbEscape: TLabel
        Left = 264
        Height = 15
        ExplicitLeft = 264
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 188
        ExplicitLeft = 188
      end
    end
  end
end
