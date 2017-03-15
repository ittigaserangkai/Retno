inherited frmDialogUser: TfrmDialogUser
  Left = 385
  Top = 245
  Caption = 'frmDialogUser'
  ClientHeight = 356
  ClientWidth = 317
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 333
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 317
    Height = 300
    ExplicitWidth = 319
    ExplicitHeight = 326
    object lbl1: TLabel
      Left = 31
      Top = 16
      Width = 27
      Height = 16
      Caption = 'Login'
    end
    object lbl2: TLabel
      Left = 31
      Top = 47
      Width = 46
      Height = 16
      Caption = 'Password'
    end
    object lbl3: TLabel
      Left = 31
      Top = 78
      Width = 39
      Height = 16
      Caption = 'Confirm'
    end
    object lbl4: TLabel
      Left = 31
      Top = 110
      Width = 46
      Height = 16
      Caption = 'Full Name'
    end
    object lbl5: TLabel
      Left = 31
      Top = 142
      Width = 32
      Height = 16
      Caption = 'Status'
    end
    object lbl6: TLabel
      Left = 31
      Top = 174
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object lbl7: TLabel
      Left = 31
      Top = 206
      Width = 30
      Height = 16
      Caption = 'Group'
    end
    object Label1: TLabel
      Left = 31
      Top = 238
      Width = 65
      Height = 16
      Caption = 'Max Ubah PO'
    end
    object Label2: TLabel
      Left = 31
      Top = 270
      Width = 57
      Height = 16
      Caption = 'Oto Qty SO'
    end
    object edtLogin: TEdit
      Left = 98
      Top = 13
      Width = 192
      Height = 22
      TabOrder = 0
      Text = 'edtLogin'
    end
    object edtPassword: TEdit
      Left = 98
      Top = 44
      Width = 192
      Height = 22
      PasswordChar = '*'
      TabOrder = 1
      Text = 'edtPassword'
    end
    object edtConfirm: TEdit
      Left = 98
      Top = 76
      Width = 192
      Height = 22
      PasswordChar = '*'
      TabOrder = 2
      Text = 'edtConfirm'
    end
    object edtFullName: TEdit
      Left = 98
      Top = 108
      Width = 192
      Height = 22
      TabOrder = 3
      Text = 'edtFullName'
    end
    object cbbStatus: TComboBox
      Left = 98
      Top = 142
      Width = 192
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'Not Active'
      Items.Strings = (
        'Not Active'
        'Active')
    end
    object edtDescription: TEdit
      Left = 98
      Top = 172
      Width = 192
      Height = 22
      TabOrder = 5
      Text = 'edtDescription'
    end
    object cbbGroup: TComboBox
      Left = 98
      Top = 204
      Width = 192
      Height = 24
      Style = csDropDownList
      TabOrder = 6
    end
    object edtUbahPO: TEdit
      Left = 98
      Top = 236
      Width = 192
      Height = 22
      TabOrder = 7
      Text = 'edtDescription'
      OnChange = edtUbahPOChange
      OnKeyPress = edtUbahPOKeyPress
    end
    object cbbOtoQtySo: TComboBox
      Left = 98
      Top = 265
      Width = 143
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 8
      Text = 'Not Active'
      Items.Strings = (
        'Not Active'
        'Active')
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 300
    Width = 317
    ExplicitTop = 326
    ExplicitWidth = 319
    inherited pnlFooter: TPanel
      Width = 317
      ExplicitWidth = 319
      inherited btnClose: TcxButton
        Left = 235
        ExplicitLeft = 237
      end
      inherited btnSave: TcxButton
        Left = 134
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 136
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 317
      ExplicitWidth = 319
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
end
