inherited frmDialogUnit: TfrmDialogUnit
  Left = 227
  Top = 112
  Caption = 'frmDialogUnit'
  ClientHeight = 501
  ClientWidth = 648
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 664
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 648
    Height = 445
    ExplicitWidth = 648
    ExplicitHeight = 445
    object lbl1: TLabel
      Left = 76
      Top = 10
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object Lbl2: TLabel
      Left = 74
      Top = 31
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object lbl3: TLabel
      Left = 43
      Top = 53
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Description'
    end
    object Label2: TLabel
      Left = 61
      Top = 74
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Address'
    end
    object Label4: TLabel
      Left = 20
      Top = 95
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Application Type'
    end
    object Label5: TLabel
      Left = 29
      Top = 116
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Company Root'
    end
    object Label6: TLabel
      Left = 67
      Top = 158
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'Region'
    end
    object Label7: TLabel
      Left = 61
      Top = 241
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Propinsi'
    end
    object Label8: TLabel
      Left = 47
      Top = 262
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Kabupaten'
    end
    object Label9: TLabel
      Left = 77
      Top = 179
      Width = 23
      Height = 16
      Alignment = taRightJustify
      Caption = 'Type'
    end
    object Label10: TLabel
      Left = 71
      Top = 199
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = 'Phone'
    end
    object Label12: TLabel
      Left = 207
      Top = 221
      Width = 15
      Height = 16
      Alignment = taRightJustify
      Caption = 'Zip'
    end
    object Label13: TLabel
      Left = 23
      Top = 283
      Width = 77
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contact Person'
    end
    object Label14: TLabel
      Left = 82
      Top = 220
      Width = 18
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fax'
    end
    object Label15: TLabel
      Left = 292
      Top = 284
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Email'
    end
    object Label16: TLabel
      Left = 43
      Top = 305
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Parent Unit'
    end
    object Label17: TLabel
      Left = 48
      Top = 328
      Width = 48
      Height = 16
      Alignment = taRightJustify
      Caption = 'Child Unit'
    end
    object Label18: TLabel
      Left = 22
      Top = 137
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'Corporate Type'
    end
    object Label19: TLabel
      Left = 72
      Top = 348
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp'
    end
    object Label20: TLabel
      Left = 44
      Top = 369
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp Name'
    end
    object Label21: TLabel
      Left = 32
      Top = 388
      Width = 68
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp Address'
    end
    object Label22: TLabel
      Left = 38
      Top = 414
      Width = 180
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp Register Date (DD/MM/YYYY)'
    end
    object Label3: TLabel
      Left = 261
      Top = 412
      Width = 6
      Height = 16
      Alignment = taRightJustify
      Caption = '/'
    end
    object Label11: TLabel
      Left = 308
      Top = 411
      Width = 6
      Height = 16
      Alignment = taRightJustify
      Caption = '/'
    end
    object edtUnitCode: TEdit
      Left = 104
      Top = 10
      Width = 89
      Height = 22
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = edtUnitCodeKeyPress
    end
    object edtUnitName: TEdit
      Left = 104
      Top = 31
      Width = 209
      Height = 22
      Ctl3D = False
      MaxLength = 64
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtUnitDesc: TEdit
      Left = 104
      Top = 52
      Width = 321
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtUntInfoAddress: TEdit
      Left = 104
      Top = 73
      Width = 321
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 3
    end
    object edtUnitAppNm: TEdit
      Left = 160
      Top = 94
      Width = 233
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 28
    end
    object edtUnitCompNm: TEdit
      Left = 160
      Top = 115
      Width = 233
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 29
    end
    object edtUnitRegnNm: TEdit
      Left = 160
      Top = 157
      Width = 233
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 30
    end
    object edtUnitPropNm: TEdit
      Left = 160
      Top = 241
      Width = 265
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 27
    end
    object edtUnitKabNm: TEdit
      Left = 160
      Top = 262
      Width = 265
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 31
    end
    object edtUnitPhone: TEdit
      Left = 104
      Top = 199
      Width = 121
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 9
    end
    object edtUnitFax: TEdit
      Left = 104
      Top = 220
      Width = 89
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 10
    end
    object edtUnitZip: TEdit
      Left = 230
      Top = 220
      Width = 89
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 11
    end
    object edtUnitContact: TEdit
      Left = 104
      Top = 283
      Width = 185
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 14
    end
    object edtUnitEmail: TEdit
      Left = 320
      Top = 283
      Width = 137
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 15
    end
    object edtUnitChildID: TEdit
      Left = 104
      Top = 325
      Width = 49
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 17
    end
    object edtUntInfoNpwpID: TEdit
      Left = 104
      Top = 346
      Width = 129
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 18
    end
    object edtUntInfoNpwpNm: TEdit
      Left = 104
      Top = 367
      Width = 209
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 19
    end
    object edtUntInfoNpwpAdr: TEdit
      Left = 104
      Top = 388
      Width = 329
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 20
    end
    object edtUntInfoNpwpRegsD: TEdit
      Left = 224
      Top = 409
      Width = 33
      Height = 22
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 21
      OnKeyPress = edtUntInfoNpwpRegsDKeyPress
    end
    object edtUntInfoCompTypeNm: TEdit
      Left = 160
      Top = 136
      Width = 233
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 32
    end
    object edtUnitTypeNm: TEdit
      Left = 160
      Top = 178
      Width = 233
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 33
    end
    object edtUntInfoNpwpRegsM: TEdit
      Left = 271
      Top = 409
      Width = 33
      Height = 22
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 22
      OnKeyPress = edtUntInfoNpwpRegsMKeyPress
    end
    object edtUntInfoNpwpRegsY: TEdit
      Left = 318
      Top = 409
      Width = 33
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 23
      OnKeyPress = edtUntInfoNpwpRegsYKeyPress
    end
    object edtUnitParentNm: TEdit
      Left = 153
      Top = 304
      Width = 224
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 34
    end
    object edtUnitChildNm: TEdit
      Left = 152
      Top = 325
      Width = 225
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 35
    end
    object rgTipeUnit: TRadioGroup
      Left = 464
      Top = 120
      Width = 161
      Height = 89
      Caption = 'Tipe Unit'
      ItemIndex = 1
      Items.Strings = (
        'HO'
        'Store'
        'Warehouse')
      TabOrder = 26
    end
    object grpAuthority: TGroupBox
      Left = 464
      Top = 208
      Width = 161
      Height = 81
      Caption = 'Authority'
      TabOrder = 25
      object chkAllowPO: TCheckBox
        Left = 16
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Purchase Order'
        TabOrder = 0
      end
      object chkAllowGR: TCheckBox
        Left = 16
        Top = 48
        Width = 105
        Height = 17
        Caption = 'Goods Receiving'
        TabOrder = 1
      end
    end
    object chkActive: TCheckBox
      Left = 464
      Top = 296
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 24
      OnClick = chkActiveClick
    end
    object edtUnitAppID: TcxButtonEdit
      Left = 103
      Top = 94
      Properties.Buttons = <
        item
        end>
      Properties.OnButtonClick = edtUnitAppIDPropertiesButtonClick
      TabOrder = 4
      Text = '0'
      OnKeyDown = edtUnitAppIDKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 58
    end
    object edtUnitCompID: TcxButtonEdit
      Left = 103
      Top = 115
      Properties.Buttons = <
        item
        end>
      Properties.OnButtonClick = edtUnitCompIDPropertiesButtonClick
      TabOrder = 5
      Text = '0'
      OnKeyDown = edtUnitCompIDKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 58
    end
    object edtUntInfoCompTypeID: TcxButtonEdit
      Left = 103
      Top = 136
      Properties.Buttons = <
        item
        end>
      Properties.OnButtonClick = edtUntInfoCompTypeIDPropertiesButtonClick
      TabOrder = 6
      Text = '0'
      OnKeyDown = edtUntInfoCompTypeIDKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 58
    end
    object edtUnitRegnID: TcxButtonEdit
      Left = 103
      Top = 156
      Properties.Buttons = <
        item
        end>
      TabOrder = 7
      Text = '0'
      OnKeyDown = edtUnitRegnIDKeyDown
      OnKeyPress = edtUnitRegnIDKeyPress
      Width = 58
    end
    object edtUnitTypeID: TcxButtonEdit
      Left = 103
      Top = 176
      Properties.Buttons = <
        item
        end>
      TabOrder = 8
      Text = '0'
      OnKeyDown = edtUnitTypeIDKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 58
    end
    object edtUnitPropId: TcxButtonEdit
      Left = 103
      Top = 240
      Properties.Buttons = <
        item
        end>
      TabOrder = 12
      Text = '0'
      OnKeyDown = edtUnitPropIdKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 58
    end
    object edtUnitKabID: TcxButtonEdit
      Left = 103
      Top = 260
      Properties.Buttons = <
        item
        end>
      TabOrder = 13
      Text = '0'
      OnKeyDown = edtUnitAppIDKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 58
    end
    object edtUnitParentID: TcxButtonEdit
      Left = 103
      Top = 303
      Properties.Buttons = <
        item
        end>
      TabOrder = 16
      Text = '0'
      OnKeyDown = edtUnitAppIDKeyDown
      OnKeyPress = edtUnitAppIDKeyPress
      Width = 51
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 445
    Width = 648
    ExplicitTop = 445
    ExplicitWidth = 648
    inherited pnlFooter: TPanel
      Width = 648
      ExplicitWidth = 648
      inherited btnClose: TcxButton
        Left = 571
        ExplicitLeft = 571
      end
      inherited btnSave: TcxButton
        Left = 468
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 468
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 648
      ExplicitWidth = 648
      inherited lbl4: TLabel
        Left = 468
        Height = 15
        ExplicitLeft = 468
      end
      inherited lbl5: TLabel
        Left = 567
        Height = 15
        ExplicitLeft = 567
      end
      inherited lbl3: TLabel
        Height = 15
      end
    end
  end
end
