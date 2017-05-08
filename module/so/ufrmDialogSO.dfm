inherited frmDialogSO: TfrmDialogSO
  Caption = 'Dialog Suggestion Order'
  ClientHeight = 561
  ClientWidth = 890
  OnDestroy = FormDestroy
  ExplicitWidth = 906
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 890
    Height = 505
    ExplicitWidth = 890
    ExplicitHeight = 505
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 886
      Height = 127
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 73
        Top = 7
        Width = 33
        Height = 16
        Caption = 'No. SO'
      end
      object lbl2: TLabel
        Left = 375
        Top = 7
        Width = 40
        Height = 16
        Caption = 'Date SO'
      end
      object lbl3: TLabel
        Left = 10
        Top = 34
        Width = 96
        Height = 16
        Caption = 'Merchandise Group'
      end
      object lblSuppMerGroup: TLabel
        Left = 318
        Top = 33
        Width = 97
        Height = 16
        Caption = 'Supplier Mer. Group'
      end
      object lblSuppMerGroupOpsional: TLabel
        Left = 620
        Top = 34
        Width = 42
        Height = 16
        Caption = 'Optional'
      end
      object edtNoSO: TEdit
        Left = 110
        Top = 5
        Width = 195
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = '0000812'
      end
      object dtTgl: TcxDateEdit
        Left = 419
        Top = 4
        TabOrder = 1
        Width = 195
      end
      object pnl1: TPanel
        Left = 2
        Top = 91
        Width = 882
        Height = 34
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 15198183
        TabOrder = 5
        object lbl4: TLabel
          Left = 168
          Top = 8
          Width = 296
          Height = 16
          Caption = '(Use this button to add product beyond SO schedulling day)'
        end
        object btnAddOthersProdSO: TcxButton
          Left = 9
          Top = 5
          Width = 153
          Height = 25
          Cursor = crHandPoint
          Action = actAddProd
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 0
        end
        object btnToExcel: TcxButton
          Left = 536
          Top = 4
          Width = 73
          Height = 25
          Cursor = crHandPoint
          Caption = 'To Excel'
          OptionsImage.ImageIndex = 34
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 1
          OnClick = btnToExcelClick
        end
        object btnAddFromPOTrader: TcxButton
          Left = 616
          Top = 4
          Width = 137
          Height = 25
          Cursor = crHandPoint
          Caption = 'Add From PO Trader'
          Enabled = False
          OptionsImage.ImageIndex = 26
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 2
        end
      end
      object btnShow: TcxButton
        Left = 419
        Top = 58
        Width = 195
        Height = 27
        Cursor = crHandPoint
        Action = actGenerate
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 4
      end
      object cxLookupMerchan: TcxExtLookupComboBox
        Left = 110
        Top = 30
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.OnEditValueChanged = cxLookupMerchanPropertiesEditValueChanged
        TabOrder = 2
        Width = 195
      end
      object cxLookupSupplierMerchan: TcxExtLookupComboBox
        Left = 419
        Top = 30
        Properties.OnInitPopup = cxLookupSupplierMerchanPropertiesInitPopup
        TabOrder = 3
        Width = 195
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 129
      Width = 886
      Height = 374
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      object cxGridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        FilterRow.Visible = True
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object clStatus: TcxGridDBColumn
          Caption = '[x]'
          DataBinding.FieldName = 'Checked'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = clStatusPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 35
        end
        object clNo: TcxGridDBColumn
          Caption = 'NO'
          DataBinding.FieldName = 'No'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          OnGetDisplayText = clNoGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Options.Editing = False
          Width = 34
        end
        object clPLU: TcxGridDBColumn
          DataBinding.FieldName = 'PLU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
        end
        object clNamaBarang: TcxGridDBColumn
          Caption = 'NAMA BARANG'
          DataBinding.FieldName = 'NamaBarang'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 72
        end
        object clUOM: TcxGridDBColumn
          DataBinding.FieldName = 'UOM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 55
        end
        object clROP: TcxGridDBColumn
          Caption = 'MIN STOCK'
          DataBinding.FieldName = 'ROP'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object clCurrStock: TcxGridDBColumn
          DataBinding.FieldName = 'STOCK'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 38
        end
        object clLeadTime: TcxGridDBColumn
          Caption = 'LEAD TIME'
          DataBinding.FieldName = 'LeadTime'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 61
        end
        object clADS: TcxGridDBColumn
          DataBinding.FieldName = 'ADS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(0)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 35
        end
        object clMinOrder: TcxGridDBColumn
          Caption = 'MIN ORDER'
          DataBinding.FieldName = 'MinOrder'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 60
        end
        object clMaxOrder: TcxGridDBColumn
          Caption = 'MAX ORDER'
          DataBinding.FieldName = 'MaxOrder'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
        end
        object clQTYSO: TcxGridDBColumn
          Caption = 'QTY SO'
          DataBinding.FieldName = 'QTYSO'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 55
        end
        object clQTYOrder: TcxGridDBColumn
          Caption = 'QTY ORDER'
          DataBinding.FieldName = 'QTY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object clSuppCode: TcxGridDBColumn
          Caption = 'SUPPLIER CODE'
          DataBinding.FieldName = 'SupplierCode'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 82
        end
        object clSuppName: TcxGridDBColumn
          Caption = 'SUPPLIER NAME'
          DataBinding.FieldName = 'SupplierName'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 81
        end
        object clBuyPrice: TcxGridDBColumn
          Caption = 'BUY PRICE'
          DataBinding.FieldName = 'BuyPrice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 57
        end
        object clDisc1: TcxGridDBColumn
          Caption = 'DISC1'
          DataBinding.FieldName = 'Disc1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 34
        end
        object clDisc2: TcxGridDBColumn
          Caption = 'DISC2'
          DataBinding.FieldName = 'Disc2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 34
        end
        object clDisc3: TcxGridDBColumn
          Caption = 'DISC3'
          DataBinding.FieldName = 'Disc3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
          Width = 46
        end
        object clNetPrice: TcxGridDBColumn
          Caption = 'NET PRICE'
          DataBinding.FieldName = 'NetPrice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0;(,0)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaTop
        end
        object clBarangID: TcxGridDBColumn
          DataBinding.FieldName = 'Barang_ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Visible = False
        end
        object clSupMerchan: TcxGridDBColumn
          DataBinding.FieldName = 'SUPLIER_MERCHAN_ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
        end
        object clUOMID: TcxGridDBColumn
          DataBinding.FieldName = 'Satuan_ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          IsCaptionAssigned = True
        end
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 505
    Width = 890
    ExplicitTop = 505
    ExplicitWidth = 890
    inherited pnlFooter: TPanel
      Width = 890
      ExplicitWidth = 890
      inherited btnClose: TcxButton
        Left = 813
        Action = actCancel
        ExplicitLeft = 813
      end
      inherited btnSave: TcxButton
        Left = 720
        Action = actSave
        ExplicitLeft = 720
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 643
        ExplicitLeft = 643
      end
    end
    inherited pnlSortCut: TPanel
      Width = 890
      ExplicitWidth = 890
      inherited lbCTRLEnter: TLabel
        Left = 715
        Height = 15
        ExplicitLeft = 715
      end
      inherited lbEscape: TLabel
        Left = 806
        Height = 15
        ExplicitLeft = 806
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 639
        Height = 15
        ExplicitLeft = 639
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 704
    Top = 40
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
    object actGenerate: TAction
      Caption = 'CTRL-G [Generate SO]'
      ImageIndex = 30
      ShortCut = 16455
      OnExecute = actGenerateExecute
    end
    object actAddProd: TAction
      Caption = 'Add Other Product'
      ImageIndex = 0
      ShortCut = 16449
      OnExecute = actAddProdExecute
    end
  end
end
