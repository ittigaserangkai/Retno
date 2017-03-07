inherited frmDeliveryOrder: TfrmDeliveryOrder
  Left = 209
  Top = 125
  Caption = 'Goods Receiving'
  ClientHeight = 492
  ClientWidth = 784
  KeyPreview = True
  OldCreateOrder = True
  ExplicitWidth = 800
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 784
    Height = 462
    BevelInner = bvRaised
    BorderWidth = 0
    ExplicitWidth = 784
    ExplicitHeight = 462
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 780
      Height = 124
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 17
        Top = 4
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lbl5: TLabel
        Left = 226
        Top = 4
        Width = 41
        Height = 16
        Caption = 'Date PO'
      end
      object lbl6: TLabel
        Left = 19
        Top = 27
        Width = 33
        Height = 16
        Caption = 'SO No.'
      end
      object lbl7: TLabel
        Left = 226
        Top = 28
        Width = 40
        Height = 16
        Caption = 'Date SO'
      end
      object lbl8: TLabel
        Left = 12
        Top = 73
        Width = 39
        Height = 16
        Caption = 'Supplier'
      end
      object lbl2: TLabel
        Left = 226
        Top = 50
        Width = 42
        Height = 16
        Caption = 'Date DO'
      end
      object lbl4: TLabel
        Left = 18
        Top = 50
        Width = 35
        Height = 16
        Caption = 'DO No.'
      end
      object lbl9: TLabel
        Left = 37
        Top = 97
        Width = 13
        Height = 16
        Caption = 'NP'
      end
      object lbl10: TLabel
        Left = 621
        Top = 4
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl13: TLabel
        Left = 647
        Top = 51
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl14: TLabel
        Left = 626
        Top = 73
        Width = 39
        Height = 16
        Caption = 'PPn. BM'
      end
      object lbl12: TLabel
        Left = 622
        Top = 27
        Width = 44
        Height = 16
        Caption = 'Discount'
      end
      object lbl11: TLabel
        Left = 621
        Top = 96
        Width = 44
        Height = 16
        Caption = 'Total Beli'
      end
      object lbl3: TLabel
        Left = 369
        Top = 4
        Width = 57
        Height = 16
        Caption = 'Total Order'
      end
      object lbl15: TLabel
        Left = 517
        Top = 4
        Width = 29
        Height = 16
        Caption = 'Bonus'
      end
      object lbl16: TLabel
        Left = 374
        Top = 28
        Width = 51
        Height = 16
        Caption = 'Total Colie'
      end
      object lbl17: TLabel
        Left = 486
        Top = 28
        Width = 59
        Height = 16
        Caption = 'Recv. Bonus'
      end
      object lbl24: TLabel
        Left = 200
        Top = 94
        Width = 18
        Height = 15
        Caption = 'new'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lblStatusPO: TLabel
        Left = 540
        Top = 100
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'lblStatusPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtPONo: TEdit
        Left = 55
        Top = 4
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtPONoChange
        OnKeyPress = edtPONoKeyPress
      end
      object btn1: TsuiButton
        Left = 163
        Top = 2
        Width = 45
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        Caption = 'F2'
        AutoSize = False
        ParentFont = False
        OnEnter = btn1Enter
        OnExit = btn1Exit
        UIStyle = BlueGlass
        TabOrder = 1
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E000000000000000000007F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00
          FF003250003250FF00FFBFBFBFFFFFFFBFBFBF7F7F7F9F9F9F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF7F7F7F7F7F7FFF00FFBFBFBFDCDCDC
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FF003D
          B90033FF0099CC003250BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBF606060003DB90033
          FFB1C7FF0055FF0032507F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF003DB90033FFB1C7
          FF0055FF0033FF0032509F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCDCDCDCDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF003DB90033FFB1C7FF0055
          FF0033FF003250FF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFBFBFBFFFFFFF
          DCDCDCDCDCDCBFBFBFFF9900CC6600CC6600CC6600BFBFBFBFBFBF0055FF0033
          FF003250FF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F
          7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFBFBFBFFFFFFF
          DCDCDCBFBFBFFF9900DE9A3EDE9A3EDE9A3ED78300CC66009F9F9F7F7F7F0032
          50FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFF9900DE9A3EFFCC99FFCC99FFCC99DE9A3ED78300663333003250FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCFF9900FFE2B4FFE2B4FFE2B4FFCC99FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFF9900FFE2B4FFFFDEFFFFFFFFE2B4FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCFF9900DE9A3EFFFFFFFFFFDEFFE2B4FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FDCDCDCFF00FFFF00FFFF
          00FFBFBFBFBFBFBF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFDCDCDCCC6600DE9A3EFFE2B4FFE2B4DE9A3E6633337F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF9F9F9FDCDCDCFFFFFFFF
          FFFFFFFFFF7F7F7FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFFFFFFDCDCDCCC6600663333663333663333BFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF9F9F9F9F9F9F7F
          7F7F7F7F7FFF00FFBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFDCDCDCFFFFFFDCDCDCDCDCDCDCDCDC7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFC0C0C0FFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9F
          9F9F7F7F7F9F9F9FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btn1Click
        ResHandle = 0
      end
      object dtDatePO: TJvDateEdit
        Left = 270
        Top = 4
        Width = 90
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ReadOnly = True
        ShowNullDate = False
        TabOrder = 2
      end
      object dtDateSO: TJvDateEdit
        Left = 270
        Top = 27
        Width = 90
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ReadOnly = True
        ShowNullDate = False
        TabOrder = 4
      end
      object edtSONo: TEdit
        Left = 55
        Top = 27
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtSuplierCode: TEdit
        Left = 55
        Top = 73
        Width = 50
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
        Text = 'ITTS1'
      end
      object edtSuplierName: TEdit
        Left = 106
        Top = 73
        Width = 495
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object edtDONo: TEdit
        Left = 55
        Top = 50
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = edtDONoKeyPress
      end
      object dtDateDO: TJvDateEdit
        Left = 270
        Top = 50
        Width = 90
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ReadOnly = True
        ShowNullDate = False
        TabOrder = 6
      end
      object edtNP: TEdit
        Left = 55
        Top = 96
        Width = 140
        Height = 22
        Color = clBtnFace
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 13
        Text = '0000010029'
        OnKeyPress = edtDONoKeyPress
      end
      object jvcuredtSubTotal: TJvValidateEdit
        Left = 670
        Top = 3
        Width = 99
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 14
      end
      object jvcuredtPPN: TJvValidateEdit
        Left = 670
        Top = 49
        Width = 99
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 16
      end
      object jvcuredtPPNBM: TJvValidateEdit
        Left = 670
        Top = 72
        Width = 99
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 17
      end
      object jvcuredtDiscount: TJvValidateEdit
        Left = 670
        Top = 26
        Width = 99
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 15
      end
      object jvcuredtTotalBeli: TJvValidateEdit
        Left = 670
        Top = 95
        Width = 99
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 18
      end
      object edtjfBonus: TJvValidateEdit
        Left = 550
        Top = 4
        Width = 51
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 9
      end
      object edtjfTotalColie: TJvValidateEdit
        Left = 430
        Top = 27
        Width = 51
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtjfRecvBonus: TJvValidateEdit
        Left = 550
        Top = 27
        Width = 51
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 10
      end
      object edtjfTotalOrder: TJvValidateEdit
        Left = 430
        Top = 4
        Width = 51
        Height = 22
        BiDiMode = bdLeftToRight
        Flat = True
        ParentBiDiMode = False
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 7
      end
      object btn2: TsuiButton
        Left = 221
        Top = 95
        Width = 156
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Check List NP (Ctrl-D)'
        AutoSize = False
        Visible = False
        ParentFont = False
        OnEnter = btn2Enter
        OnExit = btn2Exit
        UIStyle = BlueGlass
        TabOrder = 19
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F404040FF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF606060
          FFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFF
          FFDCDCDC404040FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          606060DCDCDCD78300D78300D78300D78300D78300D78300D78300D78300DCDC
          DC404040FF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF663333
          663333DE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3E4040
          40663333663333FF00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFF00FFB97A00
          FFCC996633336633336633336633336633336633336633336633336633336633
          33CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC997F7F
          7FCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC990033FF0033
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC9900CCFF00CC
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFB97A00
          FFFFDE9933009933009933009933009933009933009933009933009933009933
          00CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFDE9A3E
          B97A00993300FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC999933
          00993300DE9A3EFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FF
          B97A009F9F9FDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBF6060
          60993300FF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFDCDCDCFFFFFFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF6060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FDCDCDCFFFFFFDCDCDCFFFFFFDCDCDC7F7F7F6060606060606060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFFFFFFFDCDCDCBFBFBF9F9F9FFFFFFF606060FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFDCDCDCFFFFFFDCDCDC9F9F9F606060FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btn2Click
        ResHandle = 0
      end
      object btnCetakNP: TsuiButton
        Left = 384
        Top = 95
        Width = 93
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'NP (Ctrl-P)'
        AutoSize = False
        Visible = False
        ParentFont = False
        OnEnter = btnCetakNPEnter
        OnExit = btnCetakNPExit
        UIStyle = BlueGlass
        TabOrder = 20
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F404040FF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF606060
          FFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFF
          FFDCDCDC404040FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          606060DCDCDCD78300D78300D78300D78300D78300D78300D78300D78300DCDC
          DC404040FF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF663333
          663333DE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3E4040
          40663333663333FF00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFF00FFB97A00
          FFCC996633336633336633336633336633336633336633336633336633336633
          33CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC997F7F
          7FCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC990033FF0033
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC9900CCFF00CC
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFB97A00
          FFFFDE9933009933009933009933009933009933009933009933009933009933
          00CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFDE9A3E
          B97A00993300FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC999933
          00993300DE9A3EFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FF
          B97A009F9F9FDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBF6060
          60993300FF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFDCDCDCFFFFFFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF6060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FDCDCDCFFFFFFDCDCDCFFFFFFDCDCDC7F7F7F6060606060606060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFFFFFFFDCDCDCBFBFBF9F9F9FFFFFFF606060FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFDCDCDCFFFFFFDCDCDC9F9F9F606060FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btn2Click
        ResHandle = 0
      end
    end
    inline fraFooter5Button1: TfraFooter5Button
      Left = 2
      Top = 404
      Width = 780
      Height = 56
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 411
      ExplicitWidth = 788
      inherited pnlFooter: TPanel
        Width = 788
        ExplicitWidth = 788
        inherited bvlSeparator: TBevel
          Left = 89
          ExplicitLeft = 89
        end
        inherited btnClose: TsuiButton
          Left = 706
          ExplicitLeft = 706
        end
        inherited btnAdd: TsuiButton
          Caption = 'Save'
          Action = actSaveGoodReceiving
          Glyph.Data = {
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
        end
        inherited btnUpdate: TsuiButton
          Left = 256
          Width = 111
          Caption = 'Cetak Ulang NP'
          Visible = False
          ExplicitLeft = 256
          ExplicitWidth = 111
        end
        inherited btnDelete: TsuiButton
          Left = 414
          Visible = False
          ExplicitLeft = 414
        end
        inherited btnRefresh: TsuiButton
          Left = 97
          Width = 90
          Caption = 'Clear Value'
          Action = actClearGoodReceiving
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFCC6600CC6600500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            CC6600D78300D78300CC6600500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FF606060FF
            FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC6600
            FF9900DE9A3ED78300D78300CC6600500000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FF60
            6060FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFCC6600FFCC99
            FF9900FF9900DE9A3ED78300D78300CC6600500000FF00FFFF00FFFF00FF5000
            00500000500000500000606060FFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF
            00FF606060FFFFFFFF00FFFF00FF606060606060606060606060D78300CC6600
            CC6600FF9900FF9900DE9A3E500000500000500000FF00FFFF00FFFF00FFCC66
            00CC6600CC6600500000606060606060606060FFFFFFFF00FFFF00FF60606060
            6060606060FFFFFFFF00FFFF00FF606060FFFFFFFF00FF606060FF00FFFF00FF
            CC6600FFAA00FF9900FF9900500000FF00FFFF00FFFF00FFFF00FFFF00FFCC66
            00D78300CC6600500000FF00FFFF00FF606060FFFFFFFF00FFFF00FF606060FF
            FFFFFFFFFFFFFFFFFF00FFFF00FF606060FFFFFFFF00FF606060FF00FFFF00FF
            CC6600FFCC99FFAA00FF9900CC6600500000FF00FFFF00FFFF00FFCC6600D783
            00D78300CC6600500000FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FF60
            6060FFFFFFFF00FFFF00FF606060FFFFFFFF00FFFFFFFF606060FF00FFFF00FF
            FF00FFCC6600FFCC99FFAA00FF9900CC6600500000500000500000D78300D783
            00D78300500000FF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF
            00FF606060606060606060FFFFFFFF00FFFF00FF606060FF00FFFF00FFFF00FF
            FF00FFCC6600FFCC99FFCC99FFAA00FF9900CC6600CC6600CC6600DE9A3ED783
            00D78300500000FF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF606060FF00FFFF00FFFF00FF
            FF00FFFF00FFCC6600FFCC99FFCC99FFAA00FF9900FF9900FF9900DE9A3EDE9A
            3E500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFFFFFFFF
            00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF606060FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFCC6600CC6600FFCC99FFAA00FF9900FF9900CC6600CC66
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060606060FF
            FFFFFFFFFFFFFFFFFFFFFF606060606060FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFCC6600CC6600CC6600CC6600FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60
            6060606060606060606060FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ExplicitLeft = 97
          ExplicitWidth = 90
        end
      end
      inherited pnlSortCut: TPanel
        Width = 788
        ExplicitWidth = 788
        inherited lbl1: TLabel
          Left = 10
          Width = 79
          Caption = 'CTRL-S [Simpan]'
          ExplicitLeft = 10
          ExplicitWidth = 79
        end
        inherited lbl2: TLabel
          Left = 95
          Width = 107
          Caption = 'CTRL-F5 [Clear Value]'
          ExplicitLeft = 95
          ExplicitWidth = 107
        end
        inherited lbl3: TLabel
          Left = 254
          Width = 123
          Caption = 'CTRL-C [Cetak Ulang NP]'
          Visible = False
          ExplicitLeft = 254
          ExplicitWidth = 123
        end
        inherited lbl4: TLabel
          Left = 435
          Visible = False
          ExplicitLeft = 435
        end
        inherited lbl5: TLabel
          Left = 698
          ExplicitLeft = 698
        end
      end
    end
    object pnl1: TPanel
      Left = 2
      Top = 126
      Width = 780
      Height = 214
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 5
      Caption = 'pnl1'
      TabOrder = 2
      ExplicitWidth = 788
      ExplicitHeight = 221
      object strgGrid: TAdvStringGrid
        Left = 6
        Top = 6
        Width = 776
        Height = 209
        Cursor = crDefault
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnClick = strgGridClick
        OnKeyPress = strgGridKeyPress
        OnGetCellColor = strgGridGetCellColor
        OnGetAlignment = strgGridGetAlignment
        OnRowChanging = strgGridRowChanging
        OnCanEditCell = strgGridCanEditCell
        OnCellValidate = strgGridCellValidate
        OnGetEditorType = strgGridGetEditorType
        OnGetFloatFormat = strgGridGetFloatFormat
        OnCheckBoxClick = strgGridCheckBoxClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        Bands.PrimaryColor = 14935011
        CellNode.TreeColor = clSilver
        ColumnHeaders.Strings = (
          '')
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 32
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        Grouping.Summary = True
        MaxEditLength = 7
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        ScrollWidth = 16
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SortSettings.Column = 0
        Version = '5.8.0.2'
        ColWidths = (
          32
          40
          106
          64
          64
          47
          74)
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 340
      Width = 780
      Height = 64
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 3
      object lbl18: TLabel
        Left = 15
        Top = 35
        Width = 46
        Height = 16
        Caption = 'Disc.1(%)'
      end
      object lbl19: TLabel
        Left = 110
        Top = 36
        Width = 46
        Height = 16
        Caption = 'Disc.2(%)'
      end
      object lbl20: TLabel
        Left = 348
        Top = 36
        Width = 52
        Height = 16
        Caption = 'Total Disc.'
      end
      object lbl21: TLabel
        Left = 208
        Top = 36
        Width = 49
        Height = 16
        Caption = 'Nilai Disc.'
      end
      object lbl22: TLabel
        Left = 574
        Top = 35
        Width = 114
        Height = 16
        Caption = 'Selling Price After Disc.'
        Visible = False
      end
      object lbl23: TLabel
        Left = 15
        Top = 6
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object edtProductName: TEdit
        Left = 90
        Top = 6
        Width = 614
        Height = 22
        Color = 15198183
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'SOFTEXSAFE & SOFT PANTYLINER 48/20'#39'S (PCS)'
      end
      object edtjfDisc1: TJvValidateEdit
        Left = 64
        Top = 35
        Width = 39
        Height = 22
        BiDiMode = bdLeftToRight
        Flat = True
        ParentBiDiMode = False
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtjfDisc2: TJvValidateEdit
        Left = 159
        Top = 35
        Width = 39
        Height = 22
        BiDiMode = bdLeftToRight
        Flat = True
        ParentBiDiMode = False
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 2
      end
      object jvcuredtNilaiDisc: TJvValidateEdit
        Left = 258
        Top = 35
        Width = 82
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 3
      end
      object jvcuredtTotalDisc: TJvValidateEdit
        Left = 403
        Top = 35
        Width = 164
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 4
      end
      object jvcuredtSellPrice: TJvValidateEdit
        Left = 693
        Top = 34
        Width = 93
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 5
        Visible = False
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 784
    ExplicitWidth = 792
  end
  object actlst1: TActionList
    Left = 624
    object actSaveGoodReceiving: TAction
      Caption = 'Save'
      OnExecute = actSaveGoodReceivingExecute
    end
    object actClearGoodReceiving: TAction
      Caption = 'Clear Value'
      OnExecute = actClearGoodReceivingExecute
    end
  end
end
