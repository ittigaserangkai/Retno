inherited frmDialogPOFromTrader: TfrmDialogPOFromTrader
  Left = 210
  Top = 92
  Caption = 'frmDialogPOFromTrader'
  ClientHeight = 498
  ClientWidth = 774
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 790
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 774
    Height = 442
    ExplicitWidth = 774
    ExplicitHeight = 442
    inherited cxGrid: TcxGrid
      Top = 137
      Width = 770
      Height = 244
      TabOrder = 1
      ExplicitTop = 137
      ExplicitWidth = 770
      ExplicitHeight = 244
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 770
      Height = 135
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 7
        Top = 32
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lbl2: TLabel
        Left = 7
        Top = 56
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lbl3: TLabel
        Left = 7
        Top = 104
        Width = 40
        Height = 16
        Caption = 'Trader *'
      end
      object lbl7: TLabel
        Left = 7
        Top = 79
        Width = 59
        Height = 16
        Caption = 'Trader Type'
      end
      object lbl4: TLabel
        Left = 464
        Top = 32
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl5: TLabel
        Left = 464
        Top = 56
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object lbl8: TLabel
        Left = 573
        Top = 58
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl10: TLabel
        Left = 573
        Top = 82
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl9: TLabel
        Left = 464
        Top = 80
        Width = 26
        Height = 16
        Caption = 'T.O.P'
      end
      object lbl6: TLabel
        Left = 464
        Top = 104
        Width = 41
        Height = 16
        Caption = 'Total PO'
      end
      object lbl12: TLabel
        Left = 237
        Top = 58
        Width = 54
        Height = 16
        Caption = 'Tipe Harga'
      end
      object lblIsMember: TLabel
        Left = 237
        Top = 34
        Width = 63
        Height = 16
        Caption = 'Tipe Member'
        Visible = False
      end
      object Label1: TLabel
        Left = 464
        Top = 8
        Width = 52
        Height = 16
        Caption = 'Sisa Plafon'
      end
      object dtTgl: TcxDateEdit
        Left = 71
        Top = 56
        TabOrder = 3
        OnKeyPress = dtTglKeyPress
        OnKeyUp = dtTglKeyUp
        Width = 146
      end
      object edtTraderName: TEdit
        Left = 161
        Top = 105
        Width = 296
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        Text = 'ASSGROS ASSALAM BARU'
        OnKeyPress = edtTraderNameKeyPress
      end
      object edtStatus: TEdit
        Left = 528
        Top = 32
        Width = 121
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'Open'
      end
      object edtLeadTime: TEdit
        Left = 528
        Top = 56
        Width = 41
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        Text = '3'
      end
      object edtTOP: TEdit
        Left = 528
        Top = 80
        Width = 41
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
        Text = '7'
      end
      object edtPONo: TEdit
        Left = 71
        Top = 32
        Width = 145
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtTraderType: TEdit
        Left = 303
        Top = 32
        Width = 122
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        Text = 'AG001'
        Visible = False
      end
      object curredtTotalPO: TcxCurrencyEdit
        Left = 528
        Top = 104
        TabStop = False
        TabOrder = 12
        Width = 121
      end
      object cbbTraderType: TComboBox
        Left = 71
        Top = 79
        Width = 146
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        OnChange = cbbTraderTypeChange
        OnKeyUp = cbbTraderTypeKeyUp
      end
      object chkAppend: TCheckBox
        Left = 8
        Top = 8
        Width = 241
        Height = 17
        Caption = 'Append Product(s) into Existing PO'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Visible = False
        OnClick = chkAppendClick
      end
      object cbTipeHarga: TComboBox
        Left = 303
        Top = 56
        Width = 122
        Height = 24
        BevelKind = bkFlat
        Style = csDropDownList
        TabOrder = 8
        OnChange = cbTipeHargaChange
        OnKeyUp = cbTipeHargaKeyUp
      end
      object btnImportCSV: TButton
        Left = 337
        Top = 80
        Width = 89
        Height = 25
        Caption = 'Import CSV'
        ImageIndex = 37
        Images = DMClient.imgListButton
        TabOrder = 6
        OnClick = btnImportCSVClick
      end
      object edtplafon: TcxCurrencyEdit
        Left = 528
        Top = 8
        TabStop = False
        TabOrder = 11
        Width = 121
      end
      object edttampung: TcxCurrencyEdit
        Left = 632
        Top = 56
        TabStop = False
        TabOrder = 13
        Visible = False
        Width = 121
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 381
      Width = 770
      Height = 59
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 3
      object lbl11: TLabel
        Left = 8
        Top = 4
        Width = 77
        Height = 18
        Caption = 'Kode Barang'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQty: TLabel
        Left = 416
        Top = 9
        Width = 19
        Height = 16
        Caption = 'Qty'
        Visible = False
      end
      object lblHarga: TLabel
        Left = 488
        Top = 7
        Width = 30
        Height = 16
        Caption = 'Harga'
        Visible = False
      end
      object edtKodeBarang: TEdit
        Left = 91
        Top = 4
        Width = 254
        Height = 24
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object edtQty: TcxCurrencyEdit
        Left = 440
        Top = 4
        ParentFont = False
        TabOrder = 2
        Visible = False
        Width = 41
      end
      object cbbUom: TComboBox
        Left = 347
        Top = 4
        Width = 60
        Height = 24
        BevelInner = bvNone
        BevelKind = bkFlat
        Style = csDropDownList
        TabOrder = 1
      end
      object edtBarang: TEdit
        Left = 91
        Top = 30
        Width = 550
        Height = 24
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object edtHarga: TcxCurrencyEdit
        Left = 523
        Top = 5
        TabOrder = 3
        Visible = False
        OnKeyPress = edtHargaKeyPress
        Width = 118
      end
    end
    object lblDeleteRow: TcxLabel
      Left = 7
      Top = 413
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      Caption = 'Delete Row [Ctrl-R]'
      ParentFont = False
      Transparent = True
      OnClick = lblDeleteRowClick
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 442
    Width = 774
    ExplicitTop = 442
    ExplicitWidth = 774
    inherited pnlFooter: TPanel
      Width = 774
      ExplicitWidth = 774
      inherited btnClose: TcxButton
        Left = 697
        Action = actCancel
        ExplicitLeft = 697
      end
      inherited btnSave: TcxButton
        Left = 604
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 604
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 527
        Action = actPrint
        ExplicitLeft = 527
      end
    end
    inherited pnlSortCut: TPanel
      Width = 774
      ExplicitWidth = 774
      inherited lbCTRLEnter: TLabel
        Left = 599
        Height = 15
        ExplicitLeft = 599
      end
      inherited lbEscape: TLabel
        Left = 690
        Height = 15
        ExplicitLeft = 690
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 523
        Height = 15
        ExplicitLeft = 523
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 528
    Top = 176
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
