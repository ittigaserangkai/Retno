inherited frmDisplayPO: TfrmDisplayPO
  Left = 217
  Top = 91
  Caption = 'Display PO'
  ClientHeight = 486
  ClientWidth = 773
  KeyPreview = True
  OldCreateOrder = True
  ExplicitWidth = 789
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 773
    Height = 397
    BevelInner = bvRaised
    BorderWidth = 0
    ExplicitWidth = 773
    ExplicitHeight = 397
    inherited pgcBrowse: TcxPageControl
      Left = 2
      Top = 126
      Width = 769
      Height = 205
      TabOrder = 2
      ExplicitLeft = 2
      ExplicitTop = 126
      ExplicitWidth = 769
      ExplicitHeight = 149
      ClientRectBottom = 204
      ClientRectRight = 768
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 767
        ExplicitHeight = 147
        inherited cxGrid: TcxGrid
          Width = 767
          Height = 203
          ExplicitWidth = 767
          ExplicitHeight = 147
        end
      end
    end
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 769
      Height = 124
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 17
        Top = 7
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lbl5: TLabel
        Left = 265
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
        Visible = False
      end
      object lbl7: TLabel
        Left = 265
        Top = 28
        Width = 40
        Height = 16
        Caption = 'Date SO'
        Visible = False
      end
      object lbl8: TLabel
        Left = 12
        Top = 73
        Width = 39
        Height = 16
        Caption = 'Supplier'
      end
      object lbl2: TLabel
        Left = 265
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
        Left = 635
        Top = 4
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl13: TLabel
        Left = 661
        Top = 51
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl14: TLabel
        Left = 640
        Top = 73
        Width = 39
        Height = 16
        Caption = 'PPn. BM'
      end
      object lbl12: TLabel
        Left = 636
        Top = 27
        Width = 44
        Height = 16
        Caption = 'Discount'
      end
      object lbl11: TLabel
        Left = 635
        Top = 96
        Width = 44
        Height = 16
        Caption = 'Total Beli'
      end
      object lbl3: TLabel
        Left = 402
        Top = 4
        Width = 57
        Height = 16
        Caption = 'Total Order'
        Visible = False
      end
      object lbl15: TLabel
        Left = 548
        Top = 4
        Width = 29
        Height = 16
        Caption = 'Bonus'
        Visible = False
      end
      object lbl16: TLabel
        Left = 407
        Top = 28
        Width = 51
        Height = 16
        Caption = 'Total Colie'
        Visible = False
      end
      object lbl17: TLabel
        Left = 517
        Top = 28
        Width = 59
        Height = 16
        Caption = 'Recv. Bonus'
        Visible = False
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
      object dtDatePO: TcxDateEdit
        Left = 309
        Top = 4
        TabOrder = 1
        Width = 90
      end
      object dtDateSO: TcxDateEdit
        Left = 309
        Top = 27
        TabOrder = 3
        Visible = False
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
        TabOrder = 2
        Visible = False
      end
      object edtSuplierCode: TEdit
        Left = 55
        Top = 73
        Width = 50
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
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
        TabOrder = 11
      end
      object edtDONo: TEdit
        Left = 55
        Top = 50
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = edtDONoKeyPress
      end
      object dtDateDO: TcxDateEdit
        Left = 309
        Top = 50
        TabOrder = 5
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
        TabOrder = 12
        Text = '0000010029'
        OnKeyPress = edtDONoKeyPress
      end
      object jvcuredtSubTotal: TcxCurrencyEdit
        Left = 684
        Top = 3
        TabOrder = 13
        Width = 99
      end
      object jvcuredtPPN: TcxCurrencyEdit
        Left = 684
        Top = 49
        TabOrder = 15
        Width = 99
      end
      object jvcuredtPPNBM: TcxCurrencyEdit
        Left = 684
        Top = 72
        TabOrder = 16
        Width = 99
      end
      object jvcuredtDiscount: TcxCurrencyEdit
        Left = 684
        Top = 26
        TabOrder = 14
        Width = 99
      end
      object jvcuredtTotalBeli: TcxCurrencyEdit
        Left = 684
        Top = 95
        TabOrder = 17
        Width = 99
      end
      object edtjfBonus: TcxCurrencyEdit
        Left = 581
        Top = 4
        TabOrder = 8
        Visible = False
        Width = 51
      end
      object edtjfTotalColie: TcxCurrencyEdit
        Left = 463
        Top = 27
        TabOrder = 7
        Visible = False
        Width = 51
      end
      object edtjfRecvBonus: TcxCurrencyEdit
        Left = 581
        Top = 27
        TabOrder = 9
        Visible = False
        Width = 51
      end
      object edtjfTotalOrder: TcxCurrencyEdit
        Left = 463
        Top = 4
        TabOrder = 6
        Visible = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 51
      end
      object chkAllUnit: TCheckBox
        Left = 411
        Top = 54
        Width = 97
        Height = 17
        Caption = 'All Unit'
        TabOrder = 18
        Visible = False
      end
      object btnBrowsePoNo: TcxButton
        Left = 162
        Top = 3
        Width = 41
        Height = 25
        Caption = 'F2'
        OptionsImage.ImageIndex = 30
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 19
        OnClick = btnBrowsePoNoClick
      end
      object btnSlipNew: TcxButton
        Left = 210
        Top = 3
        Width = 47
        Height = 25
        Caption = 'Slip'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 20
        OnClick = btnSlipNewClick
      end
      object btnSlip: TcxButton
        Left = 170
        Top = 35
        Width = 47
        Height = 25
        Caption = 'Slip'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 21
        OnClick = btnSlipNewClick
      end
      object btnChekListNp: TcxButton
        Left = 226
        Top = 96
        Width = 151
        Height = 25
        Caption = 'Check List NP (Ctrl-D)'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 22
        OnClick = btnSlipNewClick
      end
      object btnCetakNP: TcxButton
        Left = 386
        Top = 96
        Width = 87
        Height = 25
        Caption = 'NP (Ctrl-P)'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 23
        OnClick = btnSlipNewClick
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 331
      Width = 769
      Height = 64
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 275
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
        Visible = False
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
        Visible = False
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
  inherited pnlHeader: TPanel
    Width = 773
    ExplicitWidth = 773
    inherited lblFilterData: TcxLabel
      Left = 419
      ExplicitLeft = 419
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 480
      ExplicitLeft = 480
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 596
      ExplicitLeft = 596
    end
    inherited btnSearch: TcxButton
      Left = 691
      ExplicitLeft = 691
    end
    inherited lblsdFilter: TcxLabel
      Left = 572
      ExplicitLeft = 572
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 430
    Width = 773
    ExplicitTop = 430
    ExplicitWidth = 773
    inherited pnlFooter: TPanel
      Width = 773
      ExplicitWidth = 773
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 696
        Action = actClose
        ExplicitLeft = 696
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 773
      ExplicitWidth = 773
      inherited lbEscape: TLabel
        Left = 699
      end
    end
  end
end
