inherited frmSetupCashManagement: TfrmSetupCashManagement
  Left = 201
  Top = 128
  Width = 671
  Height = 485
  HorzScrollBar.Range = 86
  VertScrollBar.Range = 86
  Caption = 'Setup Cash Management'
  OldCreateOrder = True
  ExplicitWidth = 671
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 655
    Height = 360
    BorderWidth = 8
    ExplicitWidth = 655
    ExplicitHeight = 360
    object pnlTop: TPanel
      Left = 9
      Top = 9
      Width = 637
      Height = 342
      Align = alClient
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 2
        Width = 37
        Height = 16
        Caption = 'Periode'
        Visible = False
      end
      object lbl2: TLabel
        Left = 183
        Top = 2
        Width = 6
        Height = 16
        Caption = '/'
        Visible = False
      end
      object lbl3: TLabel
        Left = 415
        Top = 2
        Width = 63
        Height = 16
        Caption = 'Last Process'
        Visible = False
      end
      object lbl4: TLabel
        Left = 8
        Top = 25
        Width = 81
        Height = 16
        Caption = 'Consolidation To'
      end
      object lbl6: TLabel
        Left = 8
        Top = 46
        Width = 85
        Height = 16
        Caption = 'Acc. Kepala Kasir'
      end
      object lbl7: TLabel
        Left = 8
        Top = 67
        Width = 79
        Height = 16
        Caption = 'Acc. Petty Cash'
      end
      object lbl8: TLabel
        Left = 8
        Top = 88
        Width = 100
        Height = 16
        Caption = 'Acc. Cash In Transit'
      end
      object lbl9: TLabel
        Left = 8
        Top = 109
        Width = 100
        Height = 16
        Caption = 'Acc. Back In Transit'
      end
      object lbl10: TLabel
        Left = 8
        Top = 130
        Width = 93
        Height = 16
        Caption = 'Acc. Suplier Credit'
      end
      object lbl11: TLabel
        Left = 8
        Top = 151
        Width = 77
        Height = 16
        Caption = 'Acc. Konsinyasi'
      end
      object lbl12: TLabel
        Left = 8
        Top = 172
        Width = 81
        Height = 16
        Caption = 'Acc. Contra Bon'
      end
      object lbl13: TLabel
        Left = 8
        Top = 193
        Width = 96
        Height = 16
        Caption = 'Acc. Ps. Tradisional'
      end
      object lbl14: TLabel
        Left = 8
        Top = 214
        Width = 86
        Height = 16
        Caption = 'Acc. Internal Use'
      end
      object lbl15: TLabel
        Left = 8
        Top = 235
        Width = 96
        Height = 16
        Caption = 'Acc. Suplier Bakery'
      end
      object lbl16: TLabel
        Left = 8
        Top = 256
        Width = 73
        Height = 16
        Caption = 'Acc. Distribusi'
      end
      object lbl5: TLabel
        Left = 8
        Top = 277
        Width = 90
        Height = 16
        Caption = 'Acc. PPN Masukan'
      end
      object lbl17: TLabel
        Left = 8
        Top = 298
        Width = 58
        Height = 16
        Caption = 'Acc. PPNBM'
      end
      object lbl18: TLabel
        Left = 8
        Top = 319
        Width = 90
        Height = 16
        Caption = 'Acc. PPN Keluaran'
      end
      object cbbBulan: TComboBox
        Left = 120
        Top = 2
        Width = 56
        Height = 24
        BevelKind = bkSoft
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Visible = False
        OnKeyUp = cbbBulanKeyUp
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
      end
      object medtTahun: TMaskEdit
        Left = 199
        Top = 2
        Width = 33
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        EditMask = '9999;1;_'
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 1
        Text = '    '
        Visible = False
        OnKeyUp = medtTahunKeyUp
      end
      object edtPeriode: TEdit
        Left = 239
        Top = 2
        Width = 153
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
      end
      object dtLastProcess: TcxDateEdit
        Left = 487
        Top = 2
        TabOrder = 3
        Visible = False
        OnKeyUp = dtLastProcessKeyUp
        Width = 145
      end
      object cbpConsolidation: TcxExtLookupComboBox
        Left = 120
        Top = 25
        TabOrder = 4
        OnKeyUp = cbpConsolidationKeyUp
        Width = 121
      end
      object edtConsolidation: TEdit
        Left = 247
        Top = 25
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object edtAccPettyCashDesc: TEdit
        Left = 247
        Top = 67
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
      end
      object edtAccCashInTransitDesc: TEdit
        Left = 247
        Top = 88
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 11
      end
      object edtAccBackInTransitDesc: TEdit
        Left = 247
        Top = 109
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 13
      end
      object edtAccSuplierCreditDesc: TEdit
        Left = 247
        Top = 130
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 15
      end
      object edtAccKonsinyasiDesc: TEdit
        Left = 247
        Top = 151
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 17
      end
      object edtAccKontrabonDesc: TEdit
        Left = 247
        Top = 172
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 19
      end
      object edtAccPsTradisonalDesc: TEdit
        Left = 247
        Top = 193
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 21
      end
      object edtAccInternalUseDesc: TEdit
        Left = 247
        Top = 214
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 23
      end
      object edtAccsuplierBakeryDesc: TEdit
        Left = 247
        Top = 235
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 25
      end
      object edtAccDistribusiDesc: TEdit
        Left = 247
        Top = 256
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 27
      end
      object edtAccKepalaKasirDesc: TEdit
        Left = 247
        Top = 46
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object edtAccKepalaKasir: TEdit
        Left = 120
        Top = 46
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        OnKeyUp = edtAccKepalaKasirKeyUp
      end
      object edtAccPettyCash: TEdit
        Left = 120
        Top = 67
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
        OnKeyUp = edtAccPettyCashKeyUp
      end
      object edtAccCashInTransit: TEdit
        Left = 120
        Top = 88
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        OnKeyUp = edtAccCashInTransitKeyUp
      end
      object edtAccBackInTransit: TEdit
        Left = 120
        Top = 109
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 12
        OnKeyUp = edtAccBackInTransitKeyUp
      end
      object edtAccSuplierCredit: TEdit
        Left = 120
        Top = 130
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 14
        OnKeyUp = edtAccSuplierCreditKeyUp
      end
      object edtAccKonsinyasi: TEdit
        Left = 120
        Top = 151
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 16
        OnKeyUp = edtAccKonsinyasiKeyUp
      end
      object edtAccKontrabon: TEdit
        Left = 120
        Top = 172
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 18
        OnKeyUp = edtAccKontrabonKeyUp
      end
      object edtAccPsTradisional: TEdit
        Left = 120
        Top = 193
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 20
        OnKeyUp = edtAccPsTradisionalKeyUp
      end
      object edtAccInternalUse: TEdit
        Left = 120
        Top = 214
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 22
        OnKeyUp = edtAccInternalUseKeyUp
      end
      object edtAccSuplierBakery: TEdit
        Left = 120
        Top = 235
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 24
        OnKeyUp = edtAccSuplierBakeryKeyUp
      end
      object edtAccDistribusi: TEdit
        Left = 120
        Top = 256
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 26
        OnKeyUp = edtAccDistribusiKeyUp
      end
      object edtPPNMasukan: TEdit
        Left = 120
        Top = 277
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 28
        OnKeyUp = edtPPNMasukanKeyUp
      end
      object edtAccPPNMasukan: TEdit
        Left = 247
        Top = 277
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 29
      end
      object edtPPNBM: TEdit
        Left = 120
        Top = 298
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 30
        OnKeyUp = edtPPNBMKeyUp
      end
      object edtAccPPNBM: TEdit
        Left = 247
        Top = 298
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 31
      end
      object edtPPNKeluaran: TEdit
        Left = 120
        Top = 319
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 32
        OnKeyUp = edtPPNKeluaranKeyUp
      end
      object edtAccPPNKeluaran: TEdit
        Left = 247
        Top = 319
        Width = 385
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 33
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 655
    ExplicitWidth = 655
    inherited lblHeader: TLabel
      Width = 147
      Caption = 'SETUP CASH MANAGEMENT'
      ExplicitWidth = 147
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 390
    Width = 655
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 390
    ExplicitWidth = 655
    inherited pnlFooter: TPanel
      Width = 655
      ExplicitWidth = 655
      DesignSize = (
        655
        35)
      inherited bvlSeparator: TBevel
        Left = 294
        Visible = False
        ExplicitLeft = 294
      end
      inherited btnClose: TcxButton
        Left = 573
        ExplicitLeft = 573
      end
      inherited btnAdd: TcxButton
        Action = actAddSetupCashManagement
      end
      inherited btnUpdate: TcxButton
        Left = 105
        Action = actEditSetupCashManagement
        ExplicitLeft = 105
      end
      inherited btnDelete: TcxButton
        Left = 203
        Width = 73
        Action = actSaveSetupCashManagement
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
        ExplicitLeft = 203
        ExplicitWidth = 73
      end
      inherited btnRefresh: TcxButton
        Left = 320
        Visible = False
        ExplicitLeft = 320
      end
    end
    inherited pnlSortCut: TPanel
      Width = 655
      ExplicitWidth = 655
      DesignSize = (
        655
        21)
      inherited lbl2: TLabel
        Left = 107
        ExplicitLeft = 107
      end
      inherited lbl3: TLabel
        Left = 200
        Width = 81
        Caption = 'Ctrl-Del (Delete)'
        Visible = False
        ExplicitLeft = 200
        ExplicitWidth = 81
      end
      inherited lbl4: TLabel
        Left = 315
        Visible = False
        ExplicitLeft = 315
      end
      inherited lbl5: TLabel
        Left = 565
        ExplicitLeft = 573
      end
    end
  end
  object actlstSetupCashManagement: TActionList
    Left = 579
    Top = 89
    object actAddSetupCashManagement: TAction
      Caption = '&Add'
      OnExecute = actAddSetupCashManagementExecute
    end
    object actEditSetupCashManagement: TAction
      Caption = '&Edit'
      OnExecute = actEditSetupCashManagementExecute
    end
    object actSaveSetupCashManagement: TAction
      Caption = '&Save'
      OnExecute = actSaveSetupCashManagementExecute
    end
  end
end
