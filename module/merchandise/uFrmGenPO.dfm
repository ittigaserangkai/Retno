inherited frmGenPO: TfrmGenPO
  Left = 84
  Top = 89
  Caption = 'Generate PO'
  ClientHeight = 504
  ClientWidth = 788
  OldCreateOrder = True
  ExplicitWidth = 804
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 788
    Height = 448
    ExplicitWidth = 788
    ExplicitHeight = 448
    inherited cxGrid: TcxGrid
      Top = 161
      Width = 784
      Height = 266
      PopupMenu = pmAgPO
      TabOrder = 1
      ExplicitTop = 161
      ExplicitWidth = 784
      ExplicitHeight = 266
    end
    object pnTop: TPanel
      Left = 2
      Top = 2
      Width = 784
      Height = 159
      Align = alTop
      BevelOuter = bvNone
      Color = 15198183
      TabOrder = 0
      DesignSize = (
        784
        159)
      object bvl1: TBevel
        Left = 0
        Top = 0
        Width = 784
        Height = 65
        Align = alTop
        Shape = bsBottomLine
        ExplicitWidth = 782
      end
      object lbl3: TLabel
        Left = 5
        Top = 5
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object lbl4: TLabel
        Left = 5
        Top = 33
        Width = 76
        Height = 16
        Caption = 'Periode SO dari'
      end
      object lb1: TLabel
        Left = 221
        Top = 33
        Width = 34
        Height = 16
        Caption = 'Sampai'
      end
      object lb2: TLabel
        Left = 5
        Top = 74
        Width = 54
        Height = 16
        Caption = 'Tanggal PO'
      end
      object lb3: TLabel
        Left = 277
        Top = 132
        Width = 17
        Height = 16
        Caption = 'Ket'
      end
      object Label1: TLabel
        Left = 260
        Top = 74
        Width = 38
        Height = 16
        Caption = 'Tipe PO'
      end
      object Label2: TLabel
        Left = 4
        Top = 94
        Width = 50
        Height = 16
        Caption = 'Valid Date'
      end
      object lb5: TLabel
        Left = 444
        Top = 74
        Width = 37
        Height = 16
        Caption = 'Unit GR'
      end
      object Label3: TLabel
        Left = 249
        Top = 98
        Width = 49
        Height = 16
        Caption = 'Alamat GR'
      end
      object lb6: TLabel
        Left = 536
        Top = 74
        Width = 12
        Height = 16
        Caption = 'F5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 645
        Top = 9
        Width = 17
        Height = 16
        Caption = 's/d'
      end
      object cbbMerchanGroup: TComboBox
        Left = 85
        Top = 4
        Width = 308
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnChange = cbbMerchanGroupChange
      end
      object dtTglSOAwal: TcxDateEdit
        Left = 85
        Top = 30
        TabOrder = 2
        Width = 132
      end
      object dtTglSOAkhir: TcxDateEdit
        Left = 261
        Top = 30
        TabOrder = 3
        Width = 132
      end
      object btAmbilSO: TcxButton
        Left = 399
        Top = 2
        Width = 122
        Height = 55
        Cursor = crHandPoint
        Caption = 'Ambil SO [Ctrl + D]'
        OptionsImage.ImageIndex = 26
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btAmbilSOClick
      end
      object dtTglPo: TcxDateEdit
        Left = 85
        Top = 69
        TabOrder = 4
        Width = 132
      end
      object edKet: TEdit
        Left = 309
        Top = 129
        Width = 452
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 12
        Text = 'edKet'
      end
      object cboTipePo: TComboBox
        Left = 309
        Top = 69
        Width = 124
        Height = 24
        Style = csDropDownList
        TabOrder = 5
        OnChange = cboTipePoChange
        Items.Strings = (
          'None'
          'a'
          'b'
          'c'
          'd')
      end
      object dtTglValid: TcxDateEdit
        Left = 128
        Top = 129
        Enabled = False
        TabOrder = 11
        Width = 89
      end
      object chkOtomatis: TCheckBox
        Left = 62
        Top = 96
        Width = 78
        Height = 17
        Caption = 'Otomatis'
        TabOrder = 9
        OnClick = chkOtomatisClick
      end
      object chkManual: TCheckBox
        Left = 62
        Top = 131
        Width = 59
        Height = 17
        Caption = 'Manual'
        TabOrder = 10
        OnClick = chkManualClick
      end
      object edGRAlamat: TEdit
        Left = 309
        Top = 97
        Width = 452
        Height = 22
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
        Text = 'edAlamat'
      end
      object edGRUnitCode: TEdit
        Left = 488
        Top = 69
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        Text = 'edGRUnitCode'
        OnKeyDown = edGRUnitCodeKeyDown
      end
      object edGRUniNama: TEdit
        Left = 552
        Top = 69
        Width = 209
        Height = 22
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
        Text = 'edGRUnitNama'
        OnKeyDown = edGRUnitCodeKeyDown
      end
      object chk714: TCheckBox
        Left = 62
        Top = 112
        Width = 78
        Height = 17
        Caption = '7/14 hari'
        Checked = True
        State = cbChecked
        TabOrder = 13
        OnClick = chk714Click
      end
      object btnAmbilPlu: TcxButton
        Left = 540
        Top = 30
        Width = 221
        Height = 29
        Cursor = crHandPoint
        Caption = 'Periode Pembuatan PLU [Ctrl + G]'
        OptionsImage.ImageIndex = 26
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnAmbilPluClick
      end
      object dtPluFrom: TcxDateEdit
        Left = 541
        Top = 6
        TabOrder = 15
        Width = 100
      end
      object dtPluTo: TcxDateEdit
        Left = 664
        Top = 6
        TabOrder = 16
        Width = 97
      end
    end
    object pnSummary: TPanel
      Left = 2
      Top = 427
      Width = 784
      Height = 19
      Align = alBottom
      Color = clWhite
      TabOrder = 2
      object lbRefreshGroup: TLabel
        Left = 227
        Top = 1
        Width = 125
        Height = 16
        Cursor = crHandPoint
        Alignment = taRightJustify
        Caption = 'Refresh Urutan (Ctrl + G)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        OnClick = lbRefreshGroupClick
      end
      object lbDelRow: TLabel
        Left = 104
        Top = 1
        Width = 112
        Height = 16
        Cursor = crHandPoint
        Caption = 'Remove Item (Ctrl + R)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbDelRowClick
      end
      object lbAddRow: TLabel
        Left = 0
        Top = 1
        Width = 92
        Height = 16
        Cursor = crHandPoint
        Caption = 'Add Item (Ctrl + T)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbAddRowClick
      end
      object lbHint: TLabel
        Left = 754
        Top = 1
        Width = 29
        Height = 17
        Align = alRight
        Alignment = taRightJustify
        Caption = 'lbHint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 16
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 448
    Width = 788
    ExplicitTop = 448
    ExplicitWidth = 788
    inherited pnlFooter: TPanel
      Width = 788
      ExplicitWidth = 788
      inherited btnClose: TcxButton
        Left = 711
        Action = actCancel
        ExplicitLeft = 711
      end
      inherited btnSave: TcxButton
        Left = 552
        Width = 146
        Action = actSave
        Caption = '&Generate && Save'
        PopupMenu = spmn1
        ExplicitLeft = 552
        ExplicitWidth = 146
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 788
      ExplicitWidth = 788
      inherited lbCTRLEnter: TLabel
        Left = 613
        Height = 15
        ExplicitLeft = 613
      end
      inherited lbEscape: TLabel
        Left = 704
        Height = 15
        ExplicitLeft = 704
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  object btnRefresh: TcxButton [2]
    Left = 432
    Top = 473
    Width = 97
    Height = 27
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Show PO'
    OptionsImage.ImageIndex = 28
    OptionsImage.Images = DMClient.imgListButton
    TabOrder = 2
    Visible = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnRefreshClick
  end
  inherited actlstMasterDialog: TActionList
    Top = 16
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object pmAgPO: TPopupMenu
    Left = 684
    Top = 296
    object popAddItem: TMenuItem
      Caption = 'Add Item'
      ShortCut = 16468
      OnClick = popAddItemClick
    end
    object popRemoveItem: TMenuItem
      Caption = 'Remove Item'
      ShortCut = 16466
      OnClick = popRemoveItemClick
    end
    object RefreshUrutanData1: TMenuItem
      Caption = 'Refresh Urutan Data'
      ShortCut = 16455
      OnClick = lbRefreshGroupClick
    end
  end
  object spmn1: TPopupMenu
    OwnerDraw = True
    Left = 560
    Top = 432
    object POGLOBALsatuPOuntuksemuastore1: TMenuItem
      Caption = 'PO GLOBAL (satu PO untuk semua store)'
      OnClick = POGLOBALsatuPOuntuksemuastore1Click
    end
    object POTerpisahPOsatuanuntukmasing2store1: TMenuItem
      Caption = 'PO Detail (PO satuan untuk masing2 store)'
      OnClick = POTerpisahPOsatuanuntukmasing2store1Click
    end
  end
end
