inherited frmGoodsReceiving: TfrmGoodsReceiving
  Left = 209
  Top = 125
  Caption = 'Goods Receiving'
  ClientHeight = 492
  ClientWidth = 784
  OldCreateOrder = True
  ExplicitWidth = 800
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 784
    Height = 436
    ExplicitWidth = 784
    ExplicitHeight = 436
    inherited cxGrid: TcxGrid
      Top = 126
      Width = 780
      Height = 244
      TabOrder = 2
    end
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
        Left = 556
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
      object btn1: TcxButton
        Left = 163
        Top = 2
        Width = 45
        Height = 25
        Caption = 'F2'
        OptionsImage.ImageIndex = 26
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 1
        OnEnter = btn1Enter
        OnExit = btn1Exit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = btn1Click
      end
      object dtDatePO: TcxDateEdit
        Left = 270
        Top = 4
        TabOrder = 2
        Width = 90
      end
      object dtDateSO: TcxDateEdit
        Left = 270
        Top = 27
        TabOrder = 4
        Width = 90
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
      object dtDateDO: TcxDateEdit
        Left = 270
        Top = 50
        TabOrder = 6
        Width = 90
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
      object jvcuredtSubTotal: TcxCurrencyEdit
        Left = 670
        Top = 3
        TabOrder = 14
        Width = 99
      end
      object jvcuredtPPN: TcxCurrencyEdit
        Left = 670
        Top = 49
        TabOrder = 16
        Width = 99
      end
      object jvcuredtPPNBM: TcxCurrencyEdit
        Left = 670
        Top = 72
        TabOrder = 17
        Width = 99
      end
      object jvcuredtDiscount: TcxCurrencyEdit
        Left = 670
        Top = 26
        TabOrder = 15
        Width = 99
      end
      object jvcuredtTotalBeli: TcxCurrencyEdit
        Left = 670
        Top = 95
        TabOrder = 18
        Width = 99
      end
      object edtjfBonus: TcxCurrencyEdit
        Left = 550
        Top = 4
        TabOrder = 9
        Width = 51
      end
      object edtjfTotalColie: TcxCurrencyEdit
        Left = 430
        Top = 27
        TabOrder = 8
        Width = 51
      end
      object edtjfRecvBonus: TcxCurrencyEdit
        Left = 550
        Top = 27
        TabOrder = 10
        Width = 51
      end
      object edtjfTotalOrder: TcxCurrencyEdit
        Left = 430
        Top = 4
        TabOrder = 7
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 51
      end
      object btn2: TcxButton
        Left = 221
        Top = 95
        Width = 148
        Height = 27
        Caption = 'Check List NP (Ctrl-D)'
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 19
        Visible = False
        OnEnter = btn2Enter
        OnExit = btn2Exit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btn2Click
      end
      object btnCetakNP: TcxButton
        Left = 376
        Top = 95
        Width = 89
        Height = 27
        Caption = 'NP (Ctrl-P)'
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 20
        Visible = False
        OnEnter = btnCetakNPEnter
        OnExit = btnCetakNPExit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btn2Click
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 370
      Width = 780
      Height = 64
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 314
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
      object edtjfDisc1: TcxCurrencyEdit
        Left = 64
        Top = 35
        TabOrder = 1
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 39
      end
      object edtjfDisc2: TcxCurrencyEdit
        Left = 159
        Top = 35
        TabOrder = 2
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 39
      end
      object jvcuredtNilaiDisc: TcxCurrencyEdit
        Left = 258
        Top = 35
        TabOrder = 3
        Width = 82
      end
      object jvcuredtTotalDisc: TcxCurrencyEdit
        Left = 403
        Top = 35
        TabOrder = 4
        Width = 164
      end
      object jvcuredtSellPrice: TcxCurrencyEdit
        Left = 693
        Top = 34
        TabOrder = 5
        Visible = False
        Width = 93
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 436
    Width = 784
    inherited pnlFooter: TPanel
      Width = 784
      inherited btnClose: TcxButton
        Left = 707
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 614
        Action = actSave
        ExplicitLeft = 524
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 784
      inherited lbCTRLEnter: TLabel
        Left = 609
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 700
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
