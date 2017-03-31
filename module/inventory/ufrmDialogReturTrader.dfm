inherited frmDialogReturTrader: TfrmDialogReturTrader
  Left = 135
  Top = 66
  Caption = 'Dialog Retur Assgros'
  ClientHeight = 481
  ClientWidth = 797
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 813
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 797
    Height = 425
    ExplicitWidth = 799
    ExplicitHeight = 451
    inherited cxGrid: TcxGrid
      Top = 105
      Width = 793
      Height = 230
      TabOrder = 2
      ExplicitTop = 105
      ExplicitWidth = 795
      ExplicitHeight = 256
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 793
      Height = 103
      Align = alTop
      BevelWidth = 2
      Color = clWhite
      TabOrder = 0
      ExplicitWidth = 795
      DesignSize = (
        793
        103)
      object lbl1: TLabel
        Left = 208
        Top = 15
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object lbl2: TLabel
        Left = 191
        Top = 41
        Width = 64
        Height = 16
        Caption = 'Kode Assgros'
      end
      object lbl3: TLabel
        Left = 192
        Top = 65
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lbl4: TLabel
        Left = 398
        Top = 12
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object edtKodeTrader: TcxButtonEdit
        Left = 262
        Top = 38
        Properties.Buttons = <>
        TabOrder = 2
        Text = '0'
        OnExit = edtKodeTraderExit
        OnKeyPress = edtKodeTraderKeyPress
        Width = 126
      end
      object edtTradername: TEdit
        Left = 392
        Top = 37
        Width = 257
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object dtTanggal: TcxDateEdit
        Left = 446
        Top = 11
        TabOrder = 1
        Width = 121
      end
      object edtketerangan: TEdit
        Left = 262
        Top = 62
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtNoBukti: TEdit
        Left = 262
        Top = 12
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object btnRandom: TcxButton
        Left = 702
        Top = 5
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Anchors = [akRight, akBottom]
        Caption = 'Random'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF663333
          6633336633336633336633336633336633336633336633336633336633336633
          33663333663333FF00FFFF00FF60606060606060606060606060606060606060
          6060606060606060606060606060606060606060606060000000FF00FFD78300
          FFCACC993300D4E3FFD4E3FFD4D4FFD4E3FFD4D4FFD4E3FFD4D4FFD4D4FF9933
          00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF606060FFFFFF606060FFFFFFFF00FFD78300
          FFE2B4993300D4E3FFCC9999CC9999CC9999CC9999CC9999CC9999D4D4FF9933
          00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
          FFCACC993300D4E3FFD4E3FFD4E3FFD4E3FFD4D4FFD4E3FFD4D4FFD4E3FF9933
          00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
          FFE2B4993300F0D4FFCC9999CC9999CC9999CC9999CC9999CC9999D4D4FF9933
          00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
          FFCACC993300D4E3FFF0D4FFD4E3FFD4E3FFD4E3FFD4E3FFD4D4FFD4E3FF9933
          00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
          FFE2B4FFCACC993300993300993300993300993300993300993300993300CC99
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF60606060606060606060
          6060606060606060606060606060FF00FFFF00FF606060FFFFFFFF00FFD78300
          FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC99CC9999CC99
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF606060FFFFFFFF00FFD78300
          FFE2B4FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC99CC99
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
          FFCACCFFCC99FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
          FFE2B4FFCACC606060404040404040404040404040404040404040FFCC99CC99
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF60606060606060606060
          6060606060606060606060FF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
          FFCACCFFCC99606060DCDCDCDCDCDCBFBFBF9F9F9FBFBFBF7F7F7F404040FFCC
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF606060FF00FFFF00FF606060FFFFFFFF00FFD78300
          FFE2B4FFCACC606060DCDCDCFFFFFFDCDCDCBFBFBF9F9F9FBFBFBF404040CC99
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFFF
          00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFD78300
          FFCACCFFCC99606060DCDCDCFFFFFFDCDCDCDCDCDCBFBFBF9F9F9F404040CC99
          99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFFF
          00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFD78300
          D78300D78300D78300D78300D78300D78300D78300D78300D78300D78300D783
          00D78300FF00FFFF00FFFF00FF60606060606060606060606060606060606060
          6060606060606060606060606060606060606060FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF}
        TabOrder = 5
        Visible = False
        OnClick = btnRandomClick
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 335
      Width = 793
      Height = 88
      Align = alBottom
      TabOrder = 1
      Visible = False
      ExplicitTop = 361
      ExplicitWidth = 795
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
      object lblAddRow: TcxLabel
        Left = 72
        Top = 66
        Cursor = crHandPoint
        Caption = 'Add Row   (Ctrl + T)'
        ParentFont = False
        OnClick = lblAddRowClick
      end
      object lblRemoveRow: TcxLabel
        Left = 211
        Top = 66
        Caption = 'Remove Row  (Ctrl + R)'
        ParentFont = False
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
    Top = 425
    Width = 797
    ExplicitTop = 451
    ExplicitWidth = 799
    inherited pnlFooter: TPanel
      Width = 797
      ExplicitWidth = 799
      inherited btnClose: TcxButton
        Left = 720
        Action = actCancel
        ExplicitLeft = 722
      end
      inherited btnSave: TcxButton
        Left = 627
        Action = actSave
        ExplicitLeft = 629
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 550
        ExplicitLeft = 552
      end
    end
    inherited pnlSortCut: TPanel
      Width = 797
      ExplicitWidth = 799
      inherited lbCTRLEnter: TLabel
        Left = 622
        Height = 15
        ExplicitLeft = 610
      end
      inherited lbEscape: TLabel
        Left = 713
        Height = 15
        ExplicitLeft = 704
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 546
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
