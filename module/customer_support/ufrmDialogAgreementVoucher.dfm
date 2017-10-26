inherited frmDialogAgreementVoucher: TfrmDialogAgreementVoucher
  Left = 382
  Top = 199
  Caption = 'Dialog Agreement Voucher'
  ClientHeight = 259
  ClientWidth = 302
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 318
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 302
    Height = 203
    ExplicitWidth = 304
    ExplicitHeight = 229
    object lbl1: TLabel
      Left = 25
      Top = 25
      Width = 70
      Height = 16
      Caption = 'Agreement No'
    end
    object lbl2: TLabel
      Left = 25
      Top = 52
      Width = 37
      Height = 16
      Caption = 'Tanggal'
    end
    object lbl3: TLabel
      Left = 25
      Top = 80
      Width = 24
      Height = 16
      Caption = 'Total'
    end
    object lbl4: TLabel
      Left = 25
      Top = 164
      Width = 62
      Height = 16
      Caption = 'Jatuh Tempo'
    end
    object lbl5: TLabel
      Left = 25
      Top = 108
      Width = 33
      Height = 16
      Caption = 'Diskon'
    end
    object lbl6: TLabel
      Left = 25
      Top = 136
      Width = 95
      Height = 16
      Caption = 'Tot. Setelah Diskon'
    end
    object Label1: TLabel
      Left = 274
      Top = 108
      Width = 7
      Height = 16
      Caption = '%'
    end
    object edtNo: TEdit
      Left = 132
      Top = 22
      Width = 149
      Height = 22
      Ctl3D = False
      MaxLength = 32
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = edtNoKeyPress
    end
    object dtDate: TcxDateEdit
      Left = 132
      Top = 49
      TabOrder = 1
      OnKeyPress = edtNoKeyPress
      Width = 90
    end
    object dtDueDate: TcxDateEdit
      Left = 132
      Top = 161
      TabOrder = 5
      OnKeyPress = edtNoKeyPress
      Width = 90
    end
    object jvcuredtTotal: TcxCurrencyEdit
      Left = 132
      Top = 77
      TabOrder = 2
      OnExit = curredtDiscExit
      Width = 149
    end
    object curredtTotAfterDisc: TcxCurrencyEdit
      Left = 132
      Top = 133
      TabOrder = 4
      Width = 149
    end
    object curredtDisc: TcxCurrencyEdit
      Left = 132
      Top = 105
      TabOrder = 3
      OnExit = curredtDiscExit
      Width = 136
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 203
    Width = 302
    ExplicitTop = 229
    ExplicitWidth = 304
    inherited pnlFooter: TPanel
      Width = 302
      ExplicitWidth = 304
      inherited btnClose: TcxButton
        Left = 149
        Action = actCancel
        ExplicitLeft = 151
      end
      inherited btnSave: TcxButton
        Left = 56
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 58
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 226
        Action = actPrint
        ExplicitLeft = 228
      end
    end
    inherited pnlSortCut: TPanel
      Width = 302
      ExplicitWidth = 304
      inherited lbCTRLEnter: TLabel
        Left = 127
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 218
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 51
        Height = 15
      end
    end
  end
end
