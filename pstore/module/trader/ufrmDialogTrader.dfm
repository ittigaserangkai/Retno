inherited frmDialogTrader: TfrmDialogTrader
  Left = 387
  Top = 168
  Caption = 'frmDialogTrader'
  ClientHeight = 425
  ClientWidth = 490
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 506
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 490
    Height = 369
    ExplicitWidth = 490
    ExplicitHeight = 369
    object lbl1: TLabel
      Left = 9
      Top = 70
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 10
      Top = 94
      Width = 27
      Height = 16
      Caption = 'Name'
    end
    object lbl3: TLabel
      Left = 10
      Top = 118
      Width = 39
      Height = 16
      Caption = 'Address'
    end
    object lbl4: TLabel
      Left = 10
      Top = 166
      Width = 70
      Height = 16
      Caption = 'Phone Number'
    end
    object lbl5: TLabel
      Left = 10
      Top = 190
      Width = 59
      Height = 16
      Caption = 'Fax Number'
    end
    object lbl6: TLabel
      Left = 10
      Top = 142
      Width = 77
      Height = 16
      Caption = 'Contact Person'
    end
    object lbl7: TLabel
      Left = 10
      Top = 214
      Width = 29
      Height = 16
      Caption = 'NPWP'
    end
    object lbl8: TLabel
      Left = 10
      Top = 240
      Width = 50
      Height = 16
      Caption = 'Lead Time'
    end
    object lbl9: TLabel
      Left = 10
      Top = 264
      Width = 84
      Height = 16
      Caption = 'Term Of Payment'
    end
    object lbl10: TLabel
      Left = 141
      Top = 240
      Width = 24
      Height = 16
      Caption = 'Days'
    end
    object lbl11: TLabel
      Left = 141
      Top = 263
      Width = 24
      Height = 16
      Caption = 'Days'
    end
    object lbl12: TLabel
      Left = 10
      Top = 312
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object bvl1: TBevel
      Left = 2
      Top = 2
      Width = 486
      Height = 9
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 488
    end
    object lbl13: TLabel
      Left = 10
      Top = 48
      Width = 90
      Height = 16
      Caption = 'Member Code [F5]'
    end
    object lblComboGrid: TLabel
      Left = 9
      Top = 288
      Width = 53
      Height = 16
      Caption = 'Tipe Bayar'
    end
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 25
      Height = 16
      Caption = 'Jenis'
    end
    object lbl14: TLabel
      Left = 205
      Top = 265
      Width = 60
      Height = 16
      Caption = 'Credit Limit'
    end
    object edtCode: TEdit
      Left = 105
      Top = 70
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = edtCodeKeyPress
    end
    object edtName: TEdit
      Left = 105
      Top = 94
      Width = 368
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 4
      OnKeyPress = edtNameKeyPress
    end
    object edtAddress: TEdit
      Left = 105
      Top = 118
      Width = 369
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 5
      OnKeyPress = edtAddressKeyPress
    end
    object edtContactPerson: TEdit
      Left = 105
      Top = 142
      Width = 169
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 6
      OnKeyPress = edtContactPersonKeyPress
    end
    object edtTelp: TEdit
      Left = 105
      Top = 166
      Width = 168
      Height = 22
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 7
      OnKeyPress = edtTelpKeyPress
    end
    object edtFax: TEdit
      Left = 105
      Top = 190
      Width = 168
      Height = 22
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 8
      OnKeyPress = edtFaxKeyPress
    end
    object edtNPWP: TEdit
      Left = 105
      Top = 214
      Width = 168
      Height = 22
      Ctl3D = False
      MaxLength = 32
      ParentCtl3D = False
      TabOrder = 9
      OnKeyPress = edtNPWPKeyPress
    end
    object intedtLeadtime: TcxCurrencyEdit
      Left = 105
      Top = 238
      TabOrder = 10
      Width = 30
    end
    object intedtTOP: TcxCurrencyEdit
      Left = 105
      Top = 262
      TabOrder = 11
      OnExit = intedtTOPExit
      OnKeyPress = intedtTOPKeyPress
      Width = 30
    end
    object edtDesc: TEdit
      Left = 105
      Top = 313
      Width = 369
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
      OnKeyPress = edtDescKeyPress
    end
    object edtMemberName: TEdit
      Left = 220
      Top = 45
      Width = 255
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = edtNameKeyPress
    end
    object edtMemberCode: TEdit
      Left = 105
      Top = 45
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
      OnKeyUp = edtMemberCodeKeyUp
    end
    object cbpTipeByr: TcxExtLookupComboBox
      Left = 105
      Top = 286
      TabOrder = 13
      Width = 120
    end
    object edtTipeByar: TcxButtonEdit
      Left = 313
      Top = 200
      Properties.Buttons = <
        item
        end>
      TabOrder = 14
      Text = '0'
      Visible = False
      OnKeyUp = edtTipeByarKeyUp
      Width = 112
    end
    object cbJenis: TComboBox
      Left = 105
      Top = 18
      Width = 112
      Height = 24
      BevelInner = bvNone
      BevelKind = bkFlat
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'TRADER'
      Items.Strings = (
        'TRADER'
        'ASSGROS')
    end
    object edtCreditLimit: TcxCurrencyEdit
      Left = 272
      Top = 264
      TabOrder = 12
      OnExit = intedtTOPExit
      Width = 121
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 369
    Width = 490
    ExplicitTop = 369
    ExplicitWidth = 490
    inherited pnlFooter: TPanel
      Width = 490
      ExplicitWidth = 490
      inherited btnClose: TcxButton
        Left = 413
        ExplicitLeft = 413
      end
      inherited btnSave: TcxButton
        Left = 310
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 310
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 490
      ExplicitWidth = 490
      inherited lbCTRLEnter: TLabel
        Left = 315
        ExplicitLeft = 315
      end
      inherited lbEscape: TLabel
        Left = 406
        ExplicitLeft = 406
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
