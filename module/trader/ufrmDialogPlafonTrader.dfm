inherited frmDialogPlafonTrader: TfrmDialogPlafonTrader
  Left = 617
  Top = 214
  Caption = 'Form Master Plafon'
  ClientHeight = 306
  ClientWidth = 496
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 512
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 496
    Height = 250
    ExplicitWidth = 498
    ExplicitHeight = 250
    object lbl1: TLabel
      Left = 9
      Top = 48
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 10
      Top = 76
      Width = 27
      Height = 16
      Caption = 'Name'
    end
    object lbl3: TLabel
      Left = 10
      Top = 99
      Width = 39
      Height = 16
      Caption = 'Address'
    end
    object bvl1: TBevel
      Left = 2
      Top = 2
      Width = 492
      Height = 9
      Align = alTop
      Shape = bsTopLine
      ExplicitWidth = 488
    end
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 25
      Height = 16
      Caption = 'Jenis'
    end
    object lbl4: TLabel
      Left = 10
      Top = 131
      Width = 90
      Height = 16
      Caption = 'Plafon Sebelumnya'
    end
    object lbl5: TLabel
      Left = 10
      Top = 155
      Width = 70
      Height = 16
      Caption = 'Tambah Plafon'
    end
    object lbl6: TLabel
      Left = 10
      Top = 180
      Width = 57
      Height = 16
      Caption = 'Total Plafon'
    end
    object edtCode: TEdit
      Left = 105
      Top = 46
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtName: TEdit
      Left = 105
      Top = 71
      Width = 368
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtAddress: TEdit
      Left = 105
      Top = 97
      Width = 369
      Height = 22
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
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
    object edtPlafonEx: TcxCurrencyEdit
      Left = 106
      Top = 128
      TabOrder = 4
      Width = 129
    end
    object edtplafonin: TcxCurrencyEdit
      Left = 106
      Top = 152
      TabOrder = 5
      OnExit = edtplafoninExit
      OnKeyPress = edtplafoninKeyPress
      Width = 129
    end
    object edtPlafonTot: TcxCurrencyEdit
      Left = 106
      Top = 176
      TabOrder = 6
      Width = 129
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 250
    Width = 496
    ExplicitTop = 250
    ExplicitWidth = 498
    inherited pnlFooter: TPanel
      Width = 496
      ExplicitWidth = 498
      inherited btnClose: TcxButton
        Left = 419
        ExplicitLeft = 421
      end
      inherited btnSave: TcxButton
        Left = 316
        Action = actSave
        ExplicitLeft = 318
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 496
      ExplicitWidth = 498
      inherited lbCTRLEnter: TLabel
        Left = 321
        ExplicitLeft = 321
      end
      inherited lbEscape: TLabel
        Left = 412
        ExplicitLeft = 412
      end
    end
  end
end
