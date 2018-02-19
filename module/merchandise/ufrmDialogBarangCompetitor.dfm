inherited frmDialogBarangCompetitor: TfrmDialogBarangCompetitor
  Left = 196
  Top = 223
  Caption = 'frmDialogBarangCompetitor'
  ClientHeight = 334
  ClientWidth = 474
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 490
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 474
    Height = 278
    ExplicitWidth = 476
    ExplicitHeight = 304
    object lbl1: TLabel
      Left = 11
      Top = 18
      Width = 85
      Height = 16
      Caption = 'Competitor Code'
    end
    object lbl3: TLabel
      Left = 26
      Top = 85
      Width = 67
      Height = 16
      Caption = 'Product Code'
    end
    object bvl1: TBevel
      Left = 10
      Top = 68
      Width = 455
      Height = 9
      Shape = bsTopLine
    end
    object lbl4: TLabel
      Left = 39
      Top = 141
      Width = 56
      Height = 16
      Caption = 'Convertion'
    end
    object lbl5: TLabel
      Left = 8
      Top = 169
      Width = 86
      Height = 16
      Caption = 'Selling Price Conv'
    end
    object lbl6: TLabel
      Left = 70
      Top = 197
      Width = 23
      Height = 16
      Caption = 'UOM'
    end
    object lbl7: TLabel
      Left = 149
      Top = 142
      Width = 7
      Height = 16
      Caption = '%'
    end
    object lbl8: TLabel
      Left = 35
      Top = 42
      Width = 60
      Height = 16
      Caption = 'Survey date'
    end
    object lbl9: TLabel
      Left = 35
      Top = 114
      Width = 58
      Height = 16
      Caption = 'Selling Price'
    end
    object edtcompttCode: TEdit
      Left = 100
      Top = 14
      Width = 51
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = '01'
      OnChange = edtcompttCodeChange
    end
    object chkAddMore: TCheckBox
      Left = 8
      Top = 220
      Width = 121
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Add More'
      Checked = True
      State = cbChecked
      TabOrder = 7
      ExplicitTop = 246
    end
    object edtProductName: TEdit
      Left = 192
      Top = 84
      Width = 266
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object cbbUOM: TComboBox
      Left = 100
      Top = 194
      Width = 106
      Height = 24
      BevelKind = bkSoft
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 8
      Text = 'Pilih Satuan...'
      Items.Strings = (
        'Pilih Satuan...'
        'CRT'
        'PCS'
        'BAL')
    end
    object curedtPriceConv: TcxCurrencyEdit
      Left = 100
      Top = 167
      TabOrder = 6
      Width = 105
    end
    object dtSurvey: TcxDateEdit
      Left = 100
      Top = 40
      TabOrder = 1
      Width = 134
    end
    object curedtSellPrice: TcxCurrencyEdit
      Left = 100
      Top = 112
      TabOrder = 4
      Width = 105
    end
    object curedtConvert: TcxCurrencyEdit
      Left = 164
      Top = 140
      TabOrder = 5
      Width = 105
    end
    object edtProductCode: TEdit
      Left = 100
      Top = 84
      Width = 85
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = '8737723'
      OnChange = edtProductCodeChange
    end
    object cbpCompetitor_old: TcxExtLookupComboBox
      Left = 308
      Top = 39
      TabOrder = 9
      Visible = False
      Width = 103
    end
    object cbpCompetitor: TcxExtLookupComboBox
      Left = 153
      Top = 14
      TabOrder = 10
      Width = 258
    end
    object fedtConvert: TcxCurrencyEdit
      Left = 100
      Top = 140
      ParentFont = False
      TabOrder = 11
      Width = 45
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 278
    Width = 474
    ExplicitTop = 304
    ExplicitWidth = 476
    inherited pnlFooter: TPanel
      Width = 474
      ExplicitWidth = 476
      inherited btnClose: TcxButton
        Left = 397
        Action = actCancel
        ExplicitLeft = 399
      end
      inherited btnSave: TcxButton
        Left = 294
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 296
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 474
      ExplicitWidth = 476
    end
  end
end
