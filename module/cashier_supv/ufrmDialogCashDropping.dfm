inherited frmDialogCashDropping: TfrmDialogCashDropping
  Left = 344
  Top = 221
  ActiveControl = edtCashDrop
  Caption = 'frmDialogCashDropping'
  ClientHeight = 177
  ClientWidth = 316
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 332
  ExplicitHeight = 216
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 316
    Height = 121
    ExplicitWidth = 316
    ExplicitHeight = 121
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
      Width = 72
      Height = 16
      Caption = 'Cash Dropping'
    end
    object lbl4: TLabel
      Left = 16
      Top = 8
      Width = 23
      Height = 16
      Caption = 'Time'
    end
    object edtPOSCode: TEdit
      Left = 93
      Top = 32
      Width = 65
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      Text = '01'
    end
    object edtCashierID: TEdit
      Left = 93
      Top = 57
      Width = 81
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      Text = '0001'
    end
    object edtCashDrop1: TcxCurrencyEdit
      Left = 269
      Top = 82
      TabOrder = 1
      Visible = False
      Width = 121
    end
    object edtCashDrop: TcxCurrencyEdit
      Left = 92
      Top = 81
      TabOrder = 3
      Width = 157
    end
    object edtTime: TcxTimeEdit
      Left = 93
      Top = 6
      EditValue = 0
      TabOrder = 4
      Width = 76
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 121
    Width = 316
    ExplicitTop = 121
    ExplicitWidth = 316
    inherited pnlFooter: TPanel
      Width = 316
      ExplicitWidth = 316
      inherited btnClose: TcxButton
        Left = 239
        Action = actCancel
        ExplicitLeft = 239
      end
      inherited btnSave: TcxButton
        Left = 70
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 70
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        Visible = False
      end
      inherited btnPrint: TcxButton
        Left = 162
        Visible = False
      end
    end
    inherited pnlSortCut: TPanel
      Width = 316
      ExplicitWidth = 316
      inherited lbCTRLEnter: TLabel
        Left = -42
        Height = 15
        ExplicitLeft = -42
      end
      inherited lbEscape: TLabel
        Left = 232
        Height = 15
        ExplicitLeft = 232
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 156
        ExplicitLeft = 156
      end
    end
  end
end
