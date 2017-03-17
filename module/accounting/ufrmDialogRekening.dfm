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
    ExplicitWidth = 476
    ExplicitHeight = 257
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
      Width = 74
      Height = 16
      Caption = 'Account Group'
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
      TabOrder = 3
      OnKeyUp = chkIsDebetKeyUp
    end
    object chkIsLeaf: TCheckBox
      Left = 16
      Top = 220
      Width = 97
      Height = 17
      Caption = 'Is Detail'
      TabOrder = 4
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
    object chkbs: TRadioButton
      Left = 144
      Top = 168
      Width = 113
      Height = 25
      Caption = 'Balance sheet'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object chkpl: TRadioButton
      Left = 275
      Top = 172
      Width = 113
      Height = 17
      Caption = 'Profit Loss'
      TabOrder = 6
    end
    object dbParentCode: TcxExtLookupComboBox
      Left = 144
      Top = 138
      TabOrder = 7
      Width = 145
    end
    object intedtLevel: TcxSpinEdit
      Left = 144
      Top = 63
      TabOrder = 8
      Width = 52
    end
    object dbAccountGroup: TcxExtLookupComboBox
      Left = 144
      Top = 112
      TabOrder = 9
      Width = 145
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 257
    Width = 476
    ExplicitTop = 257
    ExplicitWidth = 476
    inherited pnlFooter: TPanel
      Width = 476
      ExplicitWidth = 476
      inherited btnClose: TcxButton
        Left = 399
        Action = actCancel
        ExplicitLeft = 399
      end
      inherited btnSave: TcxButton
        Left = 306
        Action = actSave
        ExplicitLeft = 306
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        Visible = False
      end
    end
    inherited pnlSortCut: TPanel
      Width = 476
      ExplicitWidth = 476
      inherited lbCTRLEnter: TLabel
        Left = 301
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 392
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
        Visible = False
        ExplicitLeft = 3
        ExplicitTop = 2
        ExplicitHeight = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      Enabled = False
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
