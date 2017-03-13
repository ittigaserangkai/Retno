inherited frmDialogMasterProductNBD: TfrmDialogMasterProductNBD
  Left = 297
  Top = 176
  Caption = 'frmDialogMasterProductNBD'
  ClientWidth = 442
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 458
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 442
    ExplicitWidth = 444
    ExplicitHeight = 258
    object lbl1: TLabel
      Left = 22
      Top = 9
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Product Code'
    end
    object lbl2: TLabel
      Left = 22
      Top = 36
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Name'
    end
    object lbl3: TLabel
      Left = 22
      Top = 61
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Product Type'
    end
    object lbl4: TLabel
      Left = 22
      Top = 90
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'BKP/NON BKP'
    end
    object lbl5: TLabel
      Left = 22
      Top = 144
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'UOM NBD'
    end
    object lbl6: TLabel
      Left = 22
      Top = 166
      Width = 72
      Height = 32
      AutoSize = False
      Caption = 'Price/Periode'#13#10'(Non PPN)'
    end
    object lbl7: TLabel
      Left = 194
      Top = 171
      Width = 11
      Height = 16
      AutoSize = False
      Caption = ' /'
    end
    object lbl8: TLabel
      Left = 22
      Top = 117
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Tax'
    end
    object Label1: TLabel
      Left = 22
      Top = 198
      Width = 72
      Height = 16
      AutoSize = False
      Caption = 'Jumlah'
    end
    object edtCode: TEdit
      Left = 94
      Top = 7
      Width = 270
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 94
      Top = 33
      Width = 270
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtProdTypeName: TEdit
      Left = 194
      Top = 59
      Width = 170
      Height = 22
      TabStop = False
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object cbbBKP: TComboBox
      Left = 94
      Top = 86
      Width = 98
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 1
      ParentCtl3D = False
      TabOrder = 4
      Text = 'BKP'
      OnChange = cbbBKPChange
      Items.Strings = (
        'NON BKP'
        'BKP')
    end
    object cbpUOMNBD: TcxExtLookupComboBox
      Left = 94
      Top = 141
      TabOrder = 6
      Width = 98
    end
    object cbpProdType: TcxExtLookupComboBox
      Left = 94
      Top = 59
      TabOrder = 2
      Width = 98
    end
    object edtPrice: TcxCurrencyEdit
      Left = 94
      Top = 168
      Hint = '"UNIT PRICE non PPN" = DPP'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnEnter = edtPriceEnter
      Width = 98
    end
    object cbpPeriode: TcxExtLookupComboBox
      Left = 208
      Top = 167
      TabOrder = 9
      Width = 81
    end
    object cbpPajak: TcxExtLookupComboBox
      Left = 94
      Top = 114
      TabOrder = 5
      Width = 98
    end
    object edtUOMDesc: TEdit
      Left = 194
      Top = 141
      Width = 170
      Height = 22
      TabStop = False
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 7
    end
    object edJml: TcxCurrencyEdit
      Left = 94
      Top = 195
      TabOrder = 10
      Width = 59
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Width = 442
    ExplicitTop = 258
    ExplicitWidth = 444
    inherited pnlFooter: TPanel
      Width = 442
      ExplicitWidth = 444
      inherited btnClose: TcxButton
        Left = 360
        ExplicitLeft = 362
      end
      inherited btnSave: TcxButton
        Left = 273
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 275
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 442
      ExplicitWidth = 444
      inherited lbl4: TLabel
        Left = 258
        ExplicitLeft = 260
      end
      inherited lbl5: TLabel
        Left = 352
        ExplicitLeft = 354
      end
    end
  end
end
