inherited frmDialogRekening: TfrmDialogRekening
  Left = 532
  Top = 170
  Caption = 'Account'
  ClientHeight = 313
  ClientWidth = 476
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 492
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 476
    Height = 257
    ExplicitWidth = 478
    ExplicitHeight = 283
    object lbl1: TLabel
      Left = 16
      Top = 16
      Width = 69
      Height = 16
      Caption = 'Account Code'
    end
    object lbl2: TLabel
      Left = 16
      Top = 40
      Width = 71
      Height = 16
      Caption = 'Account Name'
    end
    object lbl3: TLabel
      Left = 16
      Top = 64
      Width = 70
      Height = 16
      Caption = 'Account Level'
    end
    object lbl4: TLabel
      Left = 16
      Top = 88
      Width = 102
      Height = 16
      Caption = 'Account Description'
    end
    object lbl5: TLabel
      Left = 16
      Top = 139
      Width = 105
      Height = 16
      Caption = 'Account Parent Code'
    end
    object lbl6: TLabel
      Left = 16
      Top = 112
      Width = 67
      Height = 16
      Caption = 'Account Type'
    end
    object lblGroup: TLabel
      Left = 16
      Top = 171
      Width = 74
      Height = 16
      Caption = 'Account Group'
    end
    object chkIsDebet: TCheckBox
      Left = 16
      Top = 196
      Width = 145
      Height = 17
      Caption = 'Normal Balance Is Debet'
      TabOrder = 4
      OnKeyUp = chkIsDebetKeyUp
    end
    object chkIsLeaf: TCheckBox
      Left = 16
      Top = 220
      Width = 97
      Height = 17
      Caption = 'Is Detail'
      TabOrder = 5
    end
    object edtRekCode: TEdit
      Left = 144
      Top = 16
      Width = 121
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      OnKeyUp = edtRekCodeKeyUp
    end
    object edtRekName: TEdit
      Left = 144
      Top = 40
      Width = 313
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyUp = edtRekNameKeyUp
    end
    object edtDescription: TEdit
      Left = 144
      Top = 88
      Width = 313
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnKeyUp = edtDescriptionKeyUp
    end
    object cmbAccountType: TComboBox
      Left = 144
      Top = 112
      Width = 145
      Height = 24
      TabOrder = 3
    end
    object chkbs: TRadioButton
      Left = 152
      Top = 168
      Width = 113
      Height = 25
      Caption = 'Balance sheet'
      TabOrder = 6
    end
    object chkpl: TRadioButton
      Left = 280
      Top = 173
      Width = 113
      Height = 17
      Caption = 'Profit Loss'
      TabOrder = 7
    end
    object intedtLevel: TcxCurrencyEdit
      Left = 144
      Top = 63
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(,0)'
      TabOrder = 8
      Width = 57
    end
    object edbParentCode: TcxButtonEdit
      Left = 144
      Top = 138
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 9
      Width = 145
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 257
    Width = 476
    ExplicitTop = 283
    ExplicitWidth = 478
    inherited pnlFooter: TPanel
      Width = 476
      ExplicitWidth = 478
      inherited btnClose: TcxButton
        Left = 394
        ExplicitLeft = 396
      end
      inherited btnSave: TcxButton
        Left = 307
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 309
      end
    end
    inherited pnlSortCut: TPanel
      Width = 476
      ExplicitWidth = 478
      inherited lbl4: TLabel
        Left = 311
        ExplicitLeft = 313
      end
      inherited lbl5: TLabel
        Left = 386
        ExplicitLeft = 388
      end
    end
  end
end
