inherited frmDialogUnit: TfrmDialogUnit
  Left = 227
  Top = 112
  Caption = 'frmDialogUnit'
  ClientHeight = 507
  ClientWidth = 852
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnClose = FormClose
  ExplicitTop = -151
  ExplicitWidth = 868
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 852
    Height = 451
    ExplicitWidth = 852
    ExplicitHeight = 451
    object lblCode: TLabel
      Left = 76
      Top = 12
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object lblName: TLabel
      Left = 202
      Top = 12
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object lblDescription: TLabel
      Left = 43
      Top = 38
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Description'
    end
    object lblAddress: TLabel
      Left = 62
      Top = 142
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Address'
    end
    object lblAppType: TLabel
      Left = 20
      Top = 64
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Application Type'
    end
    object Label5: TLabel
      Left = 30
      Top = 90
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Company Root'
    end
    object lblRegion: TLabel
      Left = 68
      Top = 168
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'Region'
    end
    object Label7: TLabel
      Left = 62
      Top = 194
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Propinsi'
    end
    object Label8: TLabel
      Left = 48
      Top = 220
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Kabupaten'
    end
    object Label9: TLabel
      Left = 289
      Top = 168
      Width = 23
      Height = 16
      Alignment = taRightJustify
      Caption = 'Type'
    end
    object Label10: TLabel
      Left = 72
      Top = 272
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = 'Phone'
    end
    object Label12: TLabel
      Left = 297
      Top = 220
      Width = 15
      Height = 16
      Alignment = taRightJustify
      Caption = 'Zip'
    end
    object Label13: TLabel
      Left = 24
      Top = 246
      Width = 77
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contact Person'
    end
    object Label14: TLabel
      Left = 294
      Top = 272
      Width = 18
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fax'
    end
    object Label15: TLabel
      Left = 287
      Top = 246
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Email'
    end
    object Label16: TLabel
      Left = 44
      Top = 298
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Parent Unit'
    end
    object Label18: TLabel
      Left = 23
      Top = 116
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'Corporate Type'
    end
    object lblNPWP: TLabel
      Left = 74
      Top = 324
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp'
    end
    object lblNPWPName: TLabel
      Left = 44
      Top = 350
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp Name'
    end
    object lblNPWPAddress: TLabel
      Left = 33
      Top = 376
      Width = 68
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp Address'
    end
    object lblNPWPRegDate: TLabel
      Left = 26
      Top = 402
      Width = 75
      Height = 16
      Alignment = taRightJustify
      Caption = 'Npwp Reg Date'
    end
    object rgTipeUnit: TRadioGroup
      Left = 456
      Top = 131
      Width = 161
      Height = 89
      Caption = 'Tipe Unit'
      ItemIndex = 1
      Items.Strings = (
        'HO'
        'Store'
        'Warehouse')
      TabOrder = 22
    end
    object grpAuthority: TGroupBox
      Left = 456
      Top = 222
      Width = 161
      Height = 81
      Caption = 'Authority'
      TabOrder = 23
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
        Top = 47
        Width = 105
        Height = 17
        Caption = 'Goods Receiving'
        TabOrder = 1
      end
    end
    object chkActive: TCheckBox
      Left = 386
      Top = 12
      Width = 57
      Height = 17
      Caption = 'Active'
      TabOrder = 2
      OnClick = chkActiveClick
    end
    object edCode: TcxTextEdit
      Left = 107
      Top = 8
      TabOrder = 0
      Width = 78
    end
    object edNama: TcxTextEdit
      Left = 235
      Top = 8
      TabOrder = 1
      Width = 146
    end
    object edDesciption: TcxTextEdit
      Left = 107
      Top = 34
      TabOrder = 3
      Width = 330
    end
    object edAddress: TcxTextEdit
      Left = 107
      Top = 138
      TabOrder = 7
      Width = 331
    end
    object edRegisterNPWP: TcxDateEdit
      Left = 107
      Top = 398
      TabOrder = 21
      Width = 147
    end
    object cbbAppType: TcxExtLookupComboBox
      Left = 107
      Top = 60
      TabOrder = 4
      Width = 145
    end
    object cbbCompany: TcxExtLookupComboBox
      Left = 107
      Top = 86
      TabOrder = 5
      Width = 145
    end
    object cbbCorporateType: TcxExtLookupComboBox
      Left = 107
      Top = 112
      TabOrder = 6
      Width = 145
    end
    object cbbParentUnit: TcxExtLookupComboBox
      Left = 107
      Top = 294
      TabOrder = 17
      Width = 145
    end
    object edContactPerson: TcxTextEdit
      Left = 107
      Top = 242
      TabOrder = 13
      Width = 145
    end
    object edEmail: TcxTextEdit
      Left = 317
      Top = 242
      TabOrder = 14
      Width = 121
    end
    object edRegion: TcxTextEdit
      Left = 107
      Top = 164
      TabOrder = 8
      Width = 145
    end
    object edType: TcxTextEdit
      Left = 317
      Top = 164
      TabOrder = 9
      Width = 121
    end
    object edPhone: TcxTextEdit
      Left = 107
      Top = 268
      TabOrder = 15
      Width = 145
    end
    object edFax: TcxTextEdit
      Left = 317
      Top = 268
      TabOrder = 16
      Width = 121
    end
    object edZIP: TcxTextEdit
      Left = 317
      Top = 216
      TabOrder = 12
      Width = 121
    end
    object cbbPropinsi: TcxExtLookupComboBox
      Left = 107
      Top = 190
      TabOrder = 10
      Width = 145
    end
    object cbbKabupaten: TcxExtLookupComboBox
      Left = 107
      Top = 216
      TabOrder = 11
      Width = 145
    end
    object edNPWPAddress: TcxTextEdit
      Left = 107
      Top = 372
      TabOrder = 20
      Width = 331
    end
    object edNPWPName: TcxTextEdit
      Left = 107
      Top = 346
      TabOrder = 19
      Width = 331
    end
    object edNPWP: TcxTextEdit
      Left = 107
      Top = 320
      TabOrder = 18
      Width = 145
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 451
    Width = 852
    ExplicitTop = 451
    ExplicitWidth = 852
    inherited pnlFooter: TPanel
      Width = 852
      ExplicitWidth = 852
      inherited btnClose: TcxButton
        Left = 775
        Action = actCancel
        ExplicitLeft = 775
      end
      inherited btnSave: TcxButton
        Left = 682
        Action = actSave
        ExplicitLeft = 682
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 852
      ExplicitWidth = 852
      inherited lbCTRLEnter: TLabel
        Left = 677
        Height = 15
        ExplicitLeft = 677
      end
      inherited lbEscape: TLabel
        Left = 768
        Height = 15
        ExplicitLeft = 768
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 296
    Top = 72
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
