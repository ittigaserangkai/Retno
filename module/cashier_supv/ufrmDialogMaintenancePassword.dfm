inherited frmDialogMaintenancePassword: TfrmDialogMaintenancePassword
  Left = 249
  Top = 151
  Caption = 'frmDialogMaintenancePassword'
  ClientHeight = 222
  ClientWidth = 316
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 332
  ExplicitHeight = 261
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 316
    Height = 166
    ExplicitWidth = 316
    ExplicitHeight = 166
    object lbl1: TLabel
      Left = 20
      Top = 15
      Width = 52
      Height = 16
      Caption = 'Cashier ID'
    end
    object lbl2: TLabel
      Left = 20
      Top = 40
      Width = 46
      Height = 16
      Caption = 'Full Name'
    end
    object lbl3: TLabel
      Left = 20
      Top = 65
      Width = 26
      Height = 16
      Caption = 'Level'
    end
    object lbl4: TLabel
      Left = 20
      Top = 92
      Width = 46
      Height = 16
      Caption = 'Password'
    end
    object edtUserName: TEdit
      Left = 112
      Top = 15
      Width = 65
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = edtUserNameKeyPress
    end
    object edtFullname: TEdit
      Left = 112
      Top = 40
      Width = 169
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbbLevel: TComboBox
      Left = 112
      Top = 65
      Width = 169
      Height = 24
      BevelKind = bkSoft
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'Pilih...'
      Items.Strings = (
        'Kasir'
        'Supervisor')
    end
    object edtPasswd: TEdit
      Left = 112
      Top = 92
      Width = 137
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = '*'
      TabOrder = 3
    end
    object chkStatus: TCheckBox
      Left = 112
      Top = 124
      Width = 73
      Height = 17
      Caption = 'Is Active'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 166
    Width = 316
    ExplicitTop = 166
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
        OnClick = btnDeleteClick
      end
      inherited btnPrint: TcxButton
        Left = 162
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
