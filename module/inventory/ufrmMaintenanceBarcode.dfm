inherited frmMaintenanceBarcode: TfrmMaintenanceBarcode
  Left = 239
  Top = 87
  Caption = 'Maintenance Barcode'
  ClientHeight = 479
  ClientWidth = 635
  KeyPreview = True
  OldCreateOrder = True
  ExplicitWidth = 651
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 635
    Height = 390
    ExplicitWidth = 636
    ExplicitHeight = 332
    inherited pgcBrowse: TcxPageControl
      Top = 212
      Width = 613
      Height = 167
      TabOrder = 1
      ExplicitTop = 212
      ExplicitWidth = 614
      ExplicitHeight = 109
      ClientRectBottom = 166
      ClientRectRight = 612
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 612
        ExplicitHeight = 107
        inherited cxGrid: TcxGrid
          Width = 611
          Height = 165
          ExplicitWidth = 612
          ExplicitHeight = 107
        end
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 613
      Height = 201
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 614
      object lbl1: TLabel
        Left = 9
        Top = 14
        Width = 50
        Height = 16
        Caption = 'PLU CODE'
      end
      object lblPrice: TLabel
        Left = 346
        Top = 116
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Caption = 'PRICE'
      end
      object lbl3: TLabel
        Left = 9
        Top = 63
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Caption = 'BARCODE'
      end
      object Label1: TLabel
        Left = 9
        Top = 170
        Width = 74
        Height = 16
        Alignment = taRightJustify
        Caption = 'BARCODE TYPE'
      end
      object lbl4: TLabel
        Left = 286
        Top = 41
        Width = 88
        Height = 16
        Alignment = taRightJustify
        Caption = 'PRICE SCORE OUT'
      end
      object lbl5: TLabel
        Left = 9
        Top = 117
        Width = 55
        Height = 16
        Alignment = taRightJustify
        Caption = 'SUB GROUP'
      end
      object lbl6: TLabel
        Left = 11
        Top = 143
        Width = 51
        Height = 16
        Alignment = taRightJustify
        Caption = 'CATEGORY'
      end
      object Uom: TLabel
        Left = 9
        Top = 38
        Width = 23
        Height = 16
        Caption = 'UOM'
      end
      object Label2: TLabel
        Left = 9
        Top = 87
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Caption = 'NEW BARCODE'
        Color = 15198183
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 346
        Top = 143
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Caption = 'OUTLET'
      end
      object edtProductCode: TEdit
        Left = 96
        Top = 12
        Width = 69
        Height = 22
        Hint = 'TEKAN F5 UNTUK LOOKUP'
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyUp = edtProductCodeKeyUp
      end
      object edtProductName: TEdit
        Left = 167
        Top = 12
        Width = 373
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtBarcodeOld: TEdit
        Left = 96
        Top = 62
        Width = 93
        Height = 22
        Hint = 'TEKAN ENTER UNTUK LOOKUP DATA'
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyUp = edtBarcodeOldKeyUp
      end
      object BarcodeSize: TComboBox
        Left = 96
        Top = 164
        Width = 437
        Height = 24
        BevelKind = bkFlat
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        OnChange = BarcodeSizeChange
        Items.Strings = (
          'PRICE TAG'
          'BARCODE WITH PLU, SUBGROUP AND UOM'
          'BARCODE WITH PLU, SUBGRUP AND DESCRIPTION'
          'BARCODE WITH PLU AND SUBGRUP'
          'BARCODE WITH PLU, CATEGORY AND PRICE')
      end
      object edtCategoryID: TEdit
        Left = 96
        Top = 139
        Width = 49
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
      end
      object edtSubGroupID: TEdit
        Left = 96
        Top = 114
        Width = 49
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
      end
      object curredtPrice: TcxCurrencyEdit
        Left = 391
        Top = 115
        TabOrder = 6
        Width = 121
      end
      object curredtPriceScoreOut: TcxCurrencyEdit
        Left = 385
        Top = 39
        TabOrder = 7
        Width = 121
      end
      object edtUomID: TEdit
        Left = 96
        Top = 36
        Width = 69
        Height = 22
        Hint = 'TEKAN F5 UNTUK LOOKUP'
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyUp = edtUomIDKeyUp
      end
      object edtUomNm: TEdit
        Left = 167
        Top = 36
        Width = 69
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object edtBarcodeNew: TEdit
        Left = 96
        Top = 86
        Width = 93
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtSubGroupNm: TEdit
        Left = 147
        Top = 114
        Width = 177
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object edtCategoryNm: TEdit
        Left = 147
        Top = 139
        Width = 177
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 13
      end
      object edtOutletID: TEdit
        Left = 391
        Top = 139
        Width = 57
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 14
      end
      object edtOutletNm: TEdit
        Left = 451
        Top = 139
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 15
      end
      object chkUpdate: TCheckBox
        Left = 213
        Top = 64
        Width = 105
        Height = 17
        Caption = 'Update Barcode'
        TabOrder = 3
        OnClick = chkUpdateClick
      end
      object btnUpBarCode: TcxButton
        Left = 216
        Top = 84
        Width = 75
        Height = 25
        Action = actUpdateBarcode
        TabOrder = 16
      end
      object btnSearchPO: TcxButton
        Left = 392
        Top = 84
        Width = 89
        Height = 25
        Action = actRefresh
        TabOrder = 17
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 635
    ExplicitWidth = 636
    inherited lblHeader: TLabel
      Width = 131
      Caption = 'MAINTENANCE BARCODE'
      ExplicitWidth = 131
    end
    inherited lblFilterData: TcxLabel
      Left = 281
      ExplicitLeft = 282
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 342
      ExplicitLeft = 343
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 458
      ExplicitLeft = 459
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 553
      ExplicitLeft = 554
    end
    inherited lblsdFilter: TcxLabel
      Left = 434
      ExplicitLeft = 435
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 423
    Width = 635
    ExplicitTop = 365
    ExplicitWidth = 636
    inherited pnlFooter: TPanel
      Width = 635
      ExplicitWidth = 636
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
        Left = 558
        Action = actClose
        ExplicitLeft = 559
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 635
      ExplicitWidth = 636
      inherited lbCTRLC: TLabel
        Caption = 'CTRL-D [CLEAR]'
      end
      inherited lbCTRLE: TLabel
        Caption = 'CTRL-R [REMOVE]'
      end
      inherited lbEscape: TLabel
        Left = 561
        Height = 17
        ExplicitLeft = 562
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      Caption = '&Clear'
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      Caption = '&Remove'
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
    inherited actRefresh: TAction
      Caption = '&Search PO'
      ImageIndex = 18
    end
    object actDeleteRow: TAction
      Caption = 'actDeleteRow'
      OnExecute = actDeleteRowExecute
    end
    object actUpdateBarcode: TAction
      Caption = 'Update'
      ImageIndex = 10
      OnExecute = actUpdateBarcodeExecute
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 558
    Top = 11
  end
  object udsBarcode: TfrxUserDataSet
    UserName = 'udsBarcode'
    OnCheckEOF = udsBarcodeCheckEOF
    OnFirst = udsBarcodeFirst
    OnNext = udsBarcodeNext
    OnPrior = udsBarcodePrior
    Left = 557
    Top = 98
  end
  object frxrprtReport1: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39442.448408159700000000
    ReportOptions.LastChange = 39941.376333912000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure BarCode1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Barcode1.Text := <barcode>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxrprtReport1GetValue
    Left = 560
    Top = 50
    Datasets = <
      item
        DataSet = udsBarcode
        DataSetName = 'udsBarcode'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 43.000000000000000000
      PaperHeight = 25.000000000000000000
      PaperSize = 256
      HGuides.Strings = (
        '98,26778')
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 162.519790000000000000
        DataSet = udsBarcode
        DataSetName = 'udsBarcode'
        RowCount = 0
        object BarCode1: TfrxBarCodeView
          Left = 10.838590000000000000
          Top = 17.677180000000000000
          Width = 128.000000000000000000
          Height = 41.133890000000000000
          BarType = bcCode39
          HAlign = haCenter
          Rotation = 0
          ShowText = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object nama_barang: TfrxMemoView
          Left = 9.779530000000000000
          Top = 53.031540000000010000
          Width = 125.228510000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[nama_barang]')
          ParentFont = False
        end
        object plu: TfrxMemoView
          Left = 10.118120000000000000
          Top = 1.000000000000000000
          Width = 128.504020000000000000
          Height = 16.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Fill.BackColor = clWhite
          HAlign = haCenter
          Memo.UTF8W = (
            '[plu]')
          ParentFont = False
        end
        object kat: TfrxMemoView
          Left = 139.842610000000000000
          Top = 17.897650000000000000
          Width = 18.897650000000000000
          Height = 61.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            '[kat]')
          ParentFont = False
          Rotation = 270
          VAlign = vaCenter
        end
        object harga: TfrxMemoView
          Left = 102.631330000000000000
          Top = 40.354360000000000000
          Width = 33.920000000000000000
          Height = 18.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            '[harga]')
          ParentFont = False
        end
        object Rp: TfrxMemoView
          Left = 10.338590000000000000
          Top = 40.133890000000000000
          Width = 20.640000000000000000
          Height = 16.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Rp. ')
          ParentFont = False
        end
      end
    end
  end
end
