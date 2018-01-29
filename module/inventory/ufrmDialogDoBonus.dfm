inherited frmDialogDoBonus: TfrmDialogDoBonus
  Caption = 'DO Bonus'
  ClientHeight = 456
  ClientWidth = 798
  ExplicitWidth = 814
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 798
    Height = 400
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 794
      Height = 151
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 780
      object lbl1: TLabel
        Left = 28
        Top = 8
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lbl5: TLabel
        Left = 226
        Top = 8
        Width = 41
        Height = 16
        Caption = 'Date PO'
      end
      object lbl6: TLabel
        Left = 29
        Top = 36
        Width = 33
        Height = 16
        Caption = 'SO No.'
      end
      object lbl7: TLabel
        Left = 226
        Top = 36
        Width = 40
        Height = 16
        Caption = 'Date SO'
      end
      object lbl8: TLabel
        Left = 5
        Top = 92
        Width = 57
        Height = 16
        Caption = 'Supplier MG'
      end
      object lbl2: TLabel
        Left = 226
        Top = 64
        Width = 42
        Height = 16
        Caption = 'Date DO'
      end
      object lbl4: TLabel
        Left = 27
        Top = 64
        Width = 35
        Height = 16
        Caption = 'DO No.'
      end
      object lblTipe: TLabel
        Left = 41
        Top = 121
        Width = 21
        Height = 16
        Caption = 'Tipe'
      end
      object lblGudang: TLabel
        Left = 255
        Top = 122
        Width = 37
        Height = 16
        Caption = 'Gudang'
      end
      object btn1: TcxButton
        Left = 174
        Top = 3
        Width = 45
        Height = 25
        Caption = 'F2'
        OptionsImage.ImageIndex = 26
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 7
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object dtDatePO: TcxDateEdit
        Left = 270
        Top = 4
        Enabled = False
        TabOrder = 4
        Width = 90
      end
      object dtDateSO: TcxDateEdit
        Left = 270
        Top = 32
        Enabled = False
        TabOrder = 5
        Width = 90
      end
      object edtSONo: TcxTextEdit
        Left = 66
        Top = 32
        Enabled = False
        TabOrder = 1
        Width = 106
      end
      object edtSuplierName: TcxTextEdit
        Left = 66
        Top = 88
        Enabled = False
        TabOrder = 3
        Width = 415
      end
      object edtDONo: TcxTextEdit
        Tag = 1
        Left = 66
        Top = 60
        TabOrder = 2
        Width = 106
      end
      object dtDateDO: TcxDateEdit
        Left = 270
        Top = 60
        TabOrder = 6
        Width = 90
      end
      object edPO: TcxTextEdit
        Tag = 1
        Left = 66
        Top = 4
        TabOrder = 0
        OnKeyDown = edPOKeyDown
        Width = 106
      end
      object cbbTipeBonus: TcxExtLookupComboBox
        Left = 66
        Top = 117
        TabOrder = 8
        Width = 145
      end
      object cbbGudang: TcxExtLookupComboBox
        Left = 298
        Top = 118
        TabOrder = 9
        Width = 183
      end
    end
    object cxGridGR: TcxGrid
      Left = 2
      Top = 153
      Width = 794
      Height = 245
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitWidth = 780
      ExplicitHeight = 217
      object cxGridTableGR: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.0#;(,0.0#)'
            Kind = skMax
            Column = cxgrdclmnQtyRecv
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnSorting = False
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColPLU: TcxGridColumn
          AlternateCaption = 'Barang'
          Caption = 'Kode'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnValidate = cxgrdclmnPLUPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object cxGridColNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 103
        end
        object cxGridColPLU_ID: TcxGridColumn
          Caption = 'PLU_ID'
          Visible = False
        end
        object cxgrdclmnHarga: TcxGridColumn
          AlternateCaption = 'DOD_PRICE'
          Caption = 'Harga Satuan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
        object cxgrdclmnQtyOrder: TcxGridColumn
          AlternateCaption = 'DOD_QTY_ORDER'
          Caption = 'Qty Order'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object cxgrdclmnQtyRecv: TcxGridColumn
          AlternateCaption = 'DOD_QTY_ORDER_RECV'
          Caption = 'Qty Receive'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object cxgrdclmnUOM: TcxGridColumn
          AlternateCaption = 'SATUAN'
          Caption = 'UOM'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object cxgrdclmnDisc1: TcxGridColumn
          AlternateCaption = 'BOD_Disc1'
          Caption = 'Disc 1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnDisc2: TcxGridColumn
          AlternateCaption = 'BOD_Disc2'
          Caption = 'Disc 2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnDisc3: TcxGridColumn
          AlternateCaption = 'BOD_Disc3'
          Caption = 'Disc 3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnTotalDisc: TcxGridColumn
          AlternateCaption = 'DOD_TOTAL_DISC'
          Caption = 'Total Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPPN: TcxGridColumn
          AlternateCaption = 'DOD_PPN'
          Caption = 'PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
        end
        object cxgrdclmnPPNBM: TcxGridColumn
          AlternateCaption = 'DOD_PPNBM'
          Caption = 'PPNBM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
        end
        object cxgrdclmnPPNPERSEN: TcxGridColumn
          AlternateCaption = 'DOD_PPN_PERSEN'
          Caption = 'DOD_PPN_PERSEN'
          Visible = False
        end
        object cxgrdclmnPPNBMPERSEN: TcxGridColumn
          AlternateCaption = 'DOD_PPNBM_PERSEN'
          Caption = 'DOD_PPNBM_PERSEN'
          Visible = False
        end
        object cxgrdclmnTax: TcxGridColumn
          AlternateCaption = 'DOD_TOTAL_TAX'
          Caption = 'Tax'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnLinePrice: TcxGridColumn
          AlternateCaption = 'DOD_TOTAL_TEMP'
          Caption = 'Line Price'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnTotal: TcxGridColumn
          AlternateCaption = 'DOD_TOTAL'
          Caption = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnISBKP: TcxGridColumn
          AlternateCaption = 'DOD_IS_BKP'
          Caption = 'DOD_IS_BKP'
          Visible = False
        end
        object cxgrdclmnIsStock: TcxGridColumn
          AlternateCaption = 'DOD_IS_STOCK'
          Caption = 'DOD_IS_STOCK'
          Visible = False
        end
        object cxgrdclmnPOITEM: TcxGridColumn
          AlternateCaption = 'POITEM'
          Caption = 'POITEM'
          Visible = False
          Width = 172
        end
      end
      object cxgrdlvlGR: TcxGridLevel
        Caption = 'Item Receiving'
        GridView = cxGridTableGR
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 400
    Width = 798
    inherited pnlFooter: TPanel
      Width = 798
      inherited btnClose: TcxButton
        Left = 721
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 628
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 551
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 798
      inherited lbCTRLEnter: TLabel
        Left = 623
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 714
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 547
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 736
    Top = 40
  end
end
