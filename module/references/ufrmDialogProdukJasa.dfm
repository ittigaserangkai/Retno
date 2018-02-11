inherited frmDialogProdukJasa: TfrmDialogProdukJasa
  Caption = 'frmDialogProdukJasa'
  ClientHeight = 309
  ClientWidth = 524
  ExplicitWidth = 540
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 524
    Height = 253
    ExplicitWidth = 524
    ExplicitHeight = 253
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 520
      Height = 86
      Align = alTop
      TabOrder = 0
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
      ExplicitLeft = 4
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
        Left = 288
        Top = 59
        Width = 53
        Height = 16
        AutoSize = False
        Caption = 'Pajak'
      end
      object chkBKP: TCheckBox
        Left = 110
        Top = 6
        Width = 97
        Height = 17
        Caption = 'BKP'
        TabOrder = 0
      end
      object cxLookUpTipeBarang: TcxExtLookupComboBox
        Left = 109
        Top = 59
        TabOrder = 2
        Width = 145
      end
      object cxLookUpPajak: TcxExtLookupComboBox
        Left = 347
        Top = 56
        TabOrder = 3
        Width = 163
      end
      object crDefaultPrice: TcxCurrencyEdit
        Left = 109
        Top = 29
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 1
        Width = 145
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 185
      Width = 520
      Height = 66
      Align = alTop
      TabOrder = 2
      object lblRekCredit: TLabel
        Left = 16
        Top = 39
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
        Left = 109
        Top = 36
        TabOrder = 1
        Width = 401
      end
      object cxLookupRekDebet: TcxExtLookupComboBox
        Left = 109
        Top = 6
        TabOrder = 0
        Width = 401
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 253
    Width = 524
    ExplicitTop = 253
    ExplicitWidth = 524
    inherited pnlFooter: TPanel
      Width = 524
      ExplicitWidth = 524
      inherited btnClose: TcxButton
        Left = 447
        Action = actCancel
        ExplicitLeft = 447
      end
      inherited btnSave: TcxButton
        Left = 354
        Action = actSave
        ExplicitLeft = 354
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 277
        Action = actPrint
        ExplicitLeft = 277
      end
    end
    inherited pnlSortCut: TPanel
      Width = 524
      ExplicitWidth = 524
      inherited lbCTRLEnter: TLabel
        Left = 349
        Height = 15
        ExplicitLeft = 349
      end
      inherited lbEscape: TLabel
        Left = 440
        Height = 15
        ExplicitLeft = 440
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 273
        Height = 15
        ExplicitLeft = 273
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 440
    Top = 96
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
