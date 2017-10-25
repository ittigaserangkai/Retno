inherited frmDialogCostumerVoucher: TfrmDialogCostumerVoucher
  Left = 330
  Top = 231
  Caption = 'frmDialogCostumerVoucher'
  ClientHeight = 238
  ClientWidth = 367
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 383
  ExplicitHeight = 277
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 367
    Height = 182
    ExplicitWidth = 369
    ExplicitHeight = 208
    object lbl1: TLabel
      Left = 23
      Top = 48
      Width = 78
      Height = 16
      Caption = 'Customer Name'
    end
    object lbl2: TLabel
      Left = 23
      Top = 77
      Width = 77
      Height = 16
      Caption = 'Contact Person'
    end
    object lbl3: TLabel
      Left = 23
      Top = 138
      Width = 39
      Height = 16
      Caption = 'Address'
    end
    object lbl4: TLabel
      Left = 23
      Top = 107
      Width = 70
      Height = 16
      Caption = 'Phone Number'
    end
    object Label1: TLabel
      Left = 23
      Top = 20
      Width = 69
      Height = 16
      Caption = 'Voucher Code'
    end
    object edtName: TEdit
      Left = 115
      Top = 46
      Width = 175
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
      Text = 'edtName'
      OnKeyPress = edtNameKeyPress
    end
    object edtContact: TEdit
      Left = 115
      Top = 75
      Width = 140
      Height = 22
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 2
      Text = 'edtContact'
      OnKeyPress = edtContactKeyPress
    end
    object edtAddress: TEdit
      Left = 115
      Top = 136
      Width = 232
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 4
      Text = 'edtAddress'
      OnKeyPress = edtAddressKeyPress
    end
    object edtPhone: TEdit
      Left = 115
      Top = 105
      Width = 140
      Height = 22
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 3
      Text = 'edtPhone'
      OnKeyPress = edtPhoneKeyPress
    end
    object edtCode: TEdit
      Left = 115
      Top = 18
      Width = 72
      Height = 22
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 0
      Text = 'edtCode'
      OnKeyPress = edtCodeKeyPress
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 182
    Width = 367
    ExplicitTop = 208
    ExplicitWidth = 369
    inherited pnlFooter: TPanel
      Width = 367
      ExplicitWidth = 369
      inherited btnClose: TcxButton
        Left = 214
        Action = actCancel
        ExplicitLeft = 216
      end
      inherited btnSave: TcxButton
        Left = 121
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 123
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 291
        Action = actPrint
        ExplicitLeft = 293
      end
    end
    inherited pnlSortCut: TPanel
      Width = 367
      ExplicitWidth = 369
      inherited lbCTRLEnter: TLabel
        Left = 192
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 283
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 116
        Height = 15
      end
    end
  end
end
