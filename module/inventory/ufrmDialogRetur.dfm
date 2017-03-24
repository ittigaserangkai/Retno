inherited frmDialogRetur: TfrmDialogRetur
  Left = 334
  Top = 142
  Caption = 'Dialog Retur Supplier'
  ClientHeight = 510
  ClientWidth = 672
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 688
  ExplicitHeight = 549
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 672
    Height = 454
    ExplicitWidth = 672
    ExplicitHeight = 454
    inherited cxGrid: TcxGrid
      Top = 142
      Width = 668
      Height = 222
      TabOrder = 2
      ExplicitTop = 142
      ExplicitWidth = 668
      ExplicitHeight = 222
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 668
      Height = 140
      Align = alTop
      BevelWidth = 2
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 13
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object lbl2: TLabel
        Left = 8
        Top = 63
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object lbl3: TLabel
        Left = 8
        Top = 88
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lbl4: TLabel
        Left = 248
        Top = 13
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object Suplier: TLabel
        Left = 8
        Top = 38
        Width = 33
        Height = 16
        Caption = 'Suplier'
      end
      object Label1: TLabel
        Left = 8
        Top = 113
        Width = 85
        Height = 16
        Caption = 'No PO Konsinyasi'
        Visible = False
      end
      object edtMerchandisekode: TcxButtonEdit
        Left = 112
        Top = 60
        Properties.Buttons = <>
        TabOrder = 4
        Text = '0'
        OnExit = edtMerchandisekodeExit
        OnKeyPress = edtMerchandisekodeKeyPress
        Width = 126
      end
      object edtmerchandisename: TEdit
        Left = 240
        Top = 60
        Width = 257
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object dtTanggal: TcxDateEdit
        Left = 296
        Top = 10
        TabOrder = 1
        Width = 121
      end
      object edtketerangan: TEdit
        Left = 112
        Top = 85
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
      end
      object edtsuplier: TcxButtonEdit
        Left = 112
        Top = 35
        Properties.Buttons = <>
        TabOrder = 2
        Text = '0'
        OnExit = edtsuplierExit
        OnKeyPress = edtsuplierKeyPress
        Width = 126
      end
      object edtnamasuplier: TEdit
        Left = 240
        Top = 35
        Width = 257
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtNoBukti: TEdit
        Left = 112
        Top = 10
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNoPO: TcxButtonEdit
        Left = 112
        Top = 110
        Properties.Buttons = <>
        TabOrder = 7
        Text = '0'
        Visible = False
        OnKeyPress = edtNoPOKeyPress
        Width = 126
      end
      object btnClearPO: TButton
        Left = 240
        Top = 109
        Width = 75
        Height = 25
        Caption = 'Clear PO'
        TabOrder = 8
        Visible = False
        OnClick = btnClearPOClick
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 364
      Width = 668
      Height = 88
      Align = alBottom
      TabOrder = 1
      Visible = False
      object Barang: TLabel
        Left = 16
        Top = 10
        Width = 35
        Height = 16
        Caption = 'Barang'
      end
      object Satuan: TLabel
        Left = 16
        Top = 37
        Width = 34
        Height = 16
        Caption = 'Satuan'
      end
      object JvLabel1: TcxLabel
        Left = 72
        Top = 66
        Cursor = crHandPoint
        Caption = 'Add Row   (Ctrl + T)'
        ParentFont = False
        Transparent = True
        OnClick = JvLabel1Click
      end
      object lblRemoveRow: TcxLabel
        Left = 211
        Top = 66
        Caption = 'Remove Row  (Ctrl + R)'
        ParentFont = False
        Transparent = True
        OnClick = lblRemoveRowClick
      end
      object edtKodeBarang: TcxButtonEdit
        Tag = 1
        Left = 72
        Top = 10
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        OnExit = edtKodeBarangExit
        Width = 105
      end
      object edtNamaBarang: TEdit
        Tag = 1
        Left = 180
        Top = 10
        Width = 225
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtsatuan: TcxButtonEdit
        Tag = 1
        Left = 72
        Top = 37
        Properties.Buttons = <>
        TabOrder = 2
        Text = '0'
        OnExit = edtsatuanExit
        Width = 105
      end
      object edtNamaSatuan: TEdit
        Tag = 1
        Left = 180
        Top = 37
        Width = 225
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 454
    Width = 672
    ExplicitTop = 454
    ExplicitWidth = 672
    inherited pnlFooter: TPanel
      Width = 672
      ExplicitWidth = 672
      inherited btnClose: TcxButton
        Left = 595
        Action = actCancel
        ExplicitLeft = 595
      end
      inherited btnSave: TcxButton
        Left = 502
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 502
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 672
      ExplicitWidth = 672
      inherited lbCTRLEnter: TLabel
        Left = 595
        Width = 72
        Height = 15
        Alignment = taRightJustify
        BiDiMode = bdRightToLeft
        Caption = 'Escape [Close]'
        ParentBiDiMode = False
        ExplicitLeft = 595
        ExplicitWidth = 72
      end
      inherited lbEscape: TLabel
        Left = 510
        Height = 15
        ExplicitLeft = 510
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
end
