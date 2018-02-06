inherited frmDialogTransferBarang: TfrmDialogTransferBarang
  Caption = 'Transfer Barang'
  ClientHeight = 453
  ClientWidth = 715
  ExplicitWidth = 731
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 715
    Height = 397
    ExplicitWidth = 715
    ExplicitHeight = 397
    object pnlHeader: TPanel
      Left = 2
      Top = 2
      Width = 711
      Height = 127
      Align = alTop
      TabOrder = 0
      object lblNO: TLabel
        Left = 54
        Top = 8
        Width = 32
        Height = 16
        Caption = 'Nomor'
      end
      object lblTanggal: TLabel
        Left = 49
        Top = 38
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lblGudang: TLabel
        Left = 28
        Top = 68
        Width = 58
        Height = 16
        Caption = 'Gudang Asal'
      end
      object lblGudangTujuan: TLabel
        Left = 13
        Top = 98
        Width = 73
        Height = 16
        Caption = 'Gudang Tujuan'
      end
      object lblKeteranan: TLabel
        Left = 316
        Top = 38
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblNoRef: TLabel
        Left = 316
        Top = 8
        Width = 47
        Height = 16
        Caption = 'Referensi'
      end
      object edNO: TcxTextEdit
        Tag = 1
        Left = 92
        Top = 4
        Enabled = False
        TabOrder = 0
        Width = 183
      end
      object dtTanggal: TcxDateEdit
        Left = 90
        Top = 34
        TabOrder = 1
        Width = 106
      end
      object cxLookUpGudangAsal: TcxExtLookupComboBox
        Left = 90
        Top = 64
        TabOrder = 2
        Width = 183
      end
      object cxLookUpGudangTujuan: TcxExtLookupComboBox
        Left = 90
        Top = 94
        TabOrder = 3
        Width = 183
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 380
        Top = 34
        Properties.ScrollBars = ssVertical
        TabOrder = 5
        Height = 84
        Width = 317
      end
      object edReferensi: TcxTextEdit
        Tag = 1
        Left = 380
        Top = 4
        TabOrder = 4
        Width = 183
      end
    end
    object cxgrdTransfer: TcxGrid
      Left = 2
      Top = 129
      Width = 711
      Height = 266
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridTableGR: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.0#;(,0.0#)'
            Kind = skMax
            Column = cxGridColQty
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
          Properties.OnButtonClick = cxGridColPLUPropertiesButtonClick
          Properties.OnEditValueChanged = cxGridColPLUPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object cxGridColNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 252
        end
        object cxGridColPLU_ID: TcxGridColumn
          Caption = 'PLU_ID'
          Visible = False
        end
        object cxGridColQty: TcxGridColumn
          AlternateCaption = 'DOD_QTY_ORDER'
          Caption = 'Qty Order'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object cxGridColUOM: TcxGridColumn
          AlternateCaption = 'SATUAN'
          Caption = 'UOM'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxGridColUOMPropertiesButtonClick
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object cxGridColUOMid: TcxGridColumn
          Caption = 'UOM ID'
        end
      end
      object cxgrdlvlTransfer: TcxGridLevel
        Caption = 'Item Receiving'
        GridView = cxGridTableGR
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 397
    Width = 715
    ExplicitTop = 397
    ExplicitWidth = 715
    inherited pnlFooter: TPanel
      Width = 715
      ExplicitWidth = 715
      inherited btnClose: TcxButton
        Left = 638
        Action = actCancel
        ExplicitLeft = 638
      end
      inherited btnSave: TcxButton
        Left = 545
        Action = actSave
        ExplicitLeft = 545
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 468
        Action = actPrint
        ExplicitLeft = 468
      end
    end
    inherited pnlSortCut: TPanel
      Width = 715
      ExplicitWidth = 715
      inherited lbCTRLEnter: TLabel
        Left = 540
        Height = 15
        ExplicitLeft = 540
      end
      inherited lbEscape: TLabel
        Left = 631
        Height = 15
        ExplicitLeft = 631
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 464
        Height = 15
        ExplicitLeft = 464
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 680
    Top = 184
  end
end
