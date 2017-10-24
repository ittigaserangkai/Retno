inherited frmDialogCustomerAgreement: TfrmDialogCustomerAgreement
  Left = 382
  Top = 199
  Caption = 'frmDialogCustomerAgreement'
  ClientHeight = 267
  ClientWidth = 413
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 429
  ExplicitHeight = 306
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 413
    Height = 211
    ExplicitWidth = 312
    ExplicitHeight = 216
    object lbl1: TLabel
      Left = 25
      Top = 24
      Width = 70
      Height = 16
      Caption = 'Agreement No'
    end
    object lbl2: TLabel
      Left = 25
      Top = 59
      Width = 24
      Height = 16
      Caption = 'Date'
    end
    object lbl3: TLabel
      Left = 25
      Top = 97
      Width = 24
      Height = 16
      Caption = 'Total'
    end
    object lbl4: TLabel
      Left = 25
      Top = 139
      Width = 46
      Height = 16
      Caption = 'Due Date'
    end
    object edtNo: TEdit
      Left = 108
      Top = 22
      Width = 149
      Height = 22
      MaxLength = 32
      TabOrder = 0
      OnKeyPress = edtNoKeyPress
    end
    object dtDate: TcxDateEdit
      Left = 108
      Top = 57
      TabOrder = 1
      OnKeyPress = edtNoKeyPress
      Width = 90
    end
    object dtDueDate: TcxDateEdit
      Left = 108
      Top = 137
      TabOrder = 3
      OnKeyPress = edtNoKeyPress
      Width = 90
    end
    object jvcuredtTotal: TcxCurrencyEdit
      Left = 108
      Top = 94
      TabOrder = 2
      Width = 149
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 211
    Width = 413
    ExplicitTop = 216
    ExplicitWidth = 312
    inherited pnlFooter: TPanel
      Width = 413
      ExplicitWidth = 312
      inherited btnClose: TcxButton
        Left = 260
        Action = actCancel
        ExplicitLeft = 159
      end
      inherited btnSave: TcxButton
        Left = 167
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 66
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 337
        Action = actPrint
        ExplicitLeft = 236
      end
    end
    inherited pnlSortCut: TPanel
      Width = 413
      ExplicitWidth = 312
      inherited lbCTRLEnter: TLabel
        Left = 238
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 329
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 162
        Height = 15
      end
    end
  end
end
