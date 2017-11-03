inherited frmDialogGenerateVoucher: TfrmDialogGenerateVoucher
  Left = 366
  Top = 159
  ActiveControl = dtEndDate
  Caption = 'Generate Voucher'
  ClientHeight = 269
  ClientWidth = 381
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 397
  ExplicitHeight = 308
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 381
    Height = 213
    ExplicitWidth = 268
    ExplicitHeight = 239
    object lbl1: TLabel
      Left = 36
      Top = 60
      Width = 37
      Height = 16
      Caption = 'Tanggal'
    end
    object lbl2: TLabel
      Left = 36
      Top = 86
      Width = 38
      Height = 16
      Caption = 'Nominal'
    end
    object lbl3: TLabel
      Left = 36
      Top = 113
      Width = 59
      Height = 16
      Caption = 'Jml Voucher'
    end
    object lbl4: TLabel
      Left = 36
      Top = 139
      Width = 42
      Height = 16
      Caption = 'Tgl Mulai'
    end
    object lbl5: TLabel
      Left = 36
      Top = 166
      Width = 42
      Height = 16
      Caption = 'Tgl Akhir'
    end
    object lbl6: TLabel
      Left = 36
      Top = 34
      Width = 29
      Height = 16
      Caption = 'Prefix'
    end
    object dtIssuedDate: TcxDateEdit
      Left = 106
      Top = 57
      TabOrder = 1
      Width = 120
    end
    object dtStartDate: TcxDateEdit
      Left = 106
      Top = 136
      TabOrder = 4
      Width = 120
    end
    object dtEndDate: TcxDateEdit
      Left = 106
      Top = 163
      TabOrder = 5
      Width = 120
    end
    object jvcuredtNominal: TcxCurrencyEdit
      Left = 106
      Top = 83
      EditValue = 1.000000000000000000
      TabOrder = 2
      Width = 120
    end
    object intedtQty: TcxCurrencyEdit
      Left = 106
      Top = 110
      EditValue = 0.000000000000000000
      TabOrder = 3
      Width = 120
    end
    object edtPrefix: TEdit
      Left = 106
      Top = 31
      Width = 121
      Height = 22
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDTPREFIX'
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 213
    Width = 381
    ExplicitTop = 239
    ExplicitWidth = 268
    inherited pnlFooter: TPanel
      Width = 381
      ExplicitWidth = 268
      inherited btnClose: TcxButton
        Left = 228
        Action = actCancel
        ExplicitLeft = 115
      end
      inherited btnSave: TcxButton
        Left = 135
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 22
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 305
        Action = actPrint
        ExplicitLeft = 192
      end
    end
    inherited pnlSortCut: TPanel
      Width = 381
      ExplicitWidth = 268
      inherited lbCTRLEnter: TLabel
        Left = 206
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 297
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 130
        Height = 15
      end
    end
  end
end
