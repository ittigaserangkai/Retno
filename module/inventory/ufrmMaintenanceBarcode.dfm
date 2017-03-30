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
    ExplicitWidth = 635
    inherited lblHeader: TLabel
      Width = 131
      Caption = 'MAINTENANCE BARCODE'
      ExplicitWidth = 131
    end
    inherited lblFilterData: TcxLabel
      Left = 281
      ExplicitLeft = 281
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
      ExplicitLeft = 434
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
        ExplicitLeft = 561
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
end
