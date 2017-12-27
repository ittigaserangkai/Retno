inherited frmDialogProdukJasa: TfrmDialogProdukJasa
  Caption = 'frmDialogProdukJasa'
  ClientHeight = 283
  ClientWidth = 524
  ExplicitWidth = 540
  ExplicitHeight = 322
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 524
    Height = 227
    ExplicitHeight = 348
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 520
      Height = 86
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 530
      object lblCode: TLabel
        Left = 16
        Top = 9
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Code'
      end
      object lblName: TLabel
        Left = 16
        Top = 34
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Name'
      end
      object lblOwner: TLabel
        Left = 16
        Top = 63
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Owner'
      end
      object edtCode: TEdit
        Tag = 1
        Left = 110
        Top = 7
        Width = 77
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtName: TEdit
        Tag = 1
        Left = 110
        Top = 32
        Width = 400
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 128
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtOwner: TEdit
        Tag = 1
        Left = 110
        Top = 57
        Width = 400
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 88
      Width = 520
      Height = 97
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 550
      object lblDefaultPrice: TLabel
        Left = 16
        Top = 34
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Default Price'
      end
      object lblTipeBarang: TLabel
        Left = 16
        Top = 59
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Tipe Barang'
      end
      object lblPajak: TLabel
        Left = 276
        Top = 59
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Pajak'
      end
      object edtDefaultPrice: TEdit
        Tag = 1
        Left = 110
        Top = 31
        Width = 196
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 64
        ParentCtl3D = False
        TabOrder = 0
      end
      object chkBKP: TCheckBox
        Left = 110
        Top = 6
        Width = 97
        Height = 17
        Caption = 'BKP'
        TabOrder = 1
      end
      object cxLookUpTipeBarang: TcxExtLookupComboBox
        Left = 109
        Top = 56
        TabOrder = 2
        Width = 145
      end
      object cxLookUpPajak: TcxExtLookupComboBox
        Left = 365
        Top = 56
        TabOrder = 3
        Width = 145
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 185
      Width = 520
      Height = 40
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 550
      object lblRekCredit: TLabel
        Left = 276
        Top = 9
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Rek Credit'
      end
      object lblRekDebet: TLabel
        Left = 16
        Top = 9
        Width = 87
        Height = 16
        AutoSize = False
        Caption = 'Rek Debet'
      end
      object cxLookupRekCredit: TcxExtLookupComboBox
        Left = 365
        Top = 6
        TabOrder = 0
        Width = 145
      end
      object cxLookupRekDebet: TcxExtLookupComboBox
        Left = 109
        Top = 6
        TabOrder = 1
        Width = 145
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 227
    Width = 524
    inherited pnlFooter: TPanel
      Width = 524
      inherited btnClose: TcxButton
        Left = 447
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 354
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 277
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 524
      inherited lbCTRLEnter: TLabel
        Left = 349
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 440
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 273
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 440
    Top = 96
  end
end
