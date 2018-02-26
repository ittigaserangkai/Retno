inherited frmDialogBarcodeRequest: TfrmDialogBarcodeRequest
  Left = 272
  Top = 143
  Caption = 'Add Barcode Requestition'
  ClientHeight = 487
  ClientWidth = 861
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 877
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 861
    Height = 431
    ExplicitWidth = 861
    ExplicitHeight = 431
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 857
      Height = 89
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 5
        Top = 38
        Width = 49
        Height = 16
        Caption = 'SUPPLIER '
      end
      object lbl3: TLabel
        Left = 19
        Top = 64
        Width = 32
        Height = 16
        Caption = 'HARGA'
      end
      object lbl6: TLabel
        Left = 36
        Top = 13
        Width = 15
        Height = 16
        Caption = 'NO'
      end
      object Label2: TLabel
        Left = 196
        Top = 13
        Width = 44
        Height = 16
        Caption = 'TANGGAL'
      end
      object Label1: TLabel
        Left = 404
        Top = 13
        Width = 63
        Height = 16
        Caption = 'KETERANGAN'
      end
      object edtSupplierName: TEdit
        Left = 182
        Top = 35
        Width = 203
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtBarNo: TEdit
        Tag = 3
        Left = 59
        Top = 10
        Width = 121
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object dtTgl: TcxDateEdit
        Tag = 3
        Left = 255
        Top = 9
        Properties.ShowTime = False
        TabOrder = 1
        Width = 130
      end
      object edbSupplierCode: TcxButtonEdit
        Left = 59
        Top = 34
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edbSupplierCodePropertiesButtonClick
        TabOrder = 3
        OnExit = edbSupplierCodeExit
        Width = 121
      end
      object curredtUnitPrice: TcxCurrencyEdit
        Left = 59
        Top = 59
        EditValue = 0.000000000000000000
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 4
        OnExit = curredtUnitPriceExit
        Width = 121
      end
      object grpPurchaseOrder: TGroupBox
        Left = 674
        Top = 0
        Width = 180
        Height = 83
        Caption = 'Insert Received PO'
        TabOrder = 5
        object lbl7: TLabel
          Left = 9
          Top = 23
          Width = 34
          Height = 16
          Caption = 'PO No.'
        end
        object lbl8: TLabel
          Left = 8
          Top = 50
          Width = 41
          Height = 16
          Caption = 'PO Date'
        end
        object edtDatePO: TcxDateEdit
          Tag = 3
          Left = 55
          Top = 46
          Properties.ReadOnly = True
          Properties.ShowTime = False
          Properties.OnInitPopup = edtDatePOPropertiesInitPopup
          TabOrder = 1
          Width = 121
        end
        object edPO: TcxButtonEdit
          Tag = 3
          Left = 55
          Top = 19
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = edPOPropertiesButtonClick
          TabOrder = 0
          OnKeyDown = edPOKeyDown
          Width = 121
        end
      end
      object memDesc: TcxMemo
        Left = 479
        Top = 9
        TabOrder = 6
        Height = 74
        Width = 189
      end
    end
    object cxgrdBR: TcxGrid
      Left = 2
      Top = 91
      Width = 857
      Height = 338
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridTableBR: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.0#;(,0.0#)'
            Kind = skSum
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridTableColTotal
          end
          item
            Format = ',0.##;(,0.##)'
            Kind = skSum
            Column = cxGridTableColQTY
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnNewRecord = cxGridTableBRDataControllerNewRecord
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
        object cxGridTableColCode: TcxGridColumn
          Caption = 'Kode'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxGridTableColCodePropertiesButtonClick
          Properties.OnEditValueChanged = cxGridTableColCodePropertiesEditValueChanged
          Properties.OnValidate = cxGridTableColCodePropertiesValidate
          Width = 75
        end
        object cxGridTableColNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Width = 198
        end
        object cxGridTableColUOM: TcxGridColumn
          Caption = 'UOM'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxGridTableColUOMPropertiesButtonClick
          Width = 71
        end
        object cxGridTableColBarcode: TcxGridColumn
          Caption = 'Barcode'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Properties.OnValidate = cxGridTableColBarcodePropertiesValidate
          Width = 114
        end
        object cxGridTableColQTY: TcxGridColumn
          Caption = 'QTY'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.##;(,0.##)'
          Properties.OnEditValueChanged = cxGridTableColQTYPropertiesEditValueChanged
          Width = 89
        end
        object cxGridTableColHarga: TcxGridColumn
          Caption = 'Harga'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.OnEditValueChanged = cxGridTableColHargaPropertiesEditValueChanged
          Width = 105
        end
        object cxGridTableColTotal: TcxGridColumn
          Caption = 'Total'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          Width = 116
        end
        object cxGridTableColPLU_ID: TcxGridColumn
          Caption = 'PLU ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
        end
        object cxGridTableColUOMid: TcxGridColumn
          Caption = 'UOM ID'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
        end
      end
      object cxgrdlBR: TcxGridLevel
        Caption = 'Item Barcode Request'
        GridView = cxGridTableBR
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 431
    Width = 861
    ExplicitTop = 431
    ExplicitWidth = 861
    inherited pnlFooter: TPanel
      Width = 861
      ExplicitWidth = 861
      inherited btnClose: TcxButton
        Left = 784
        Action = actCancel
        ExplicitLeft = 784
      end
      inherited btnSave: TcxButton
        Left = 691
        Action = actSave
        ExplicitLeft = 691
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 614
        Action = actPrint
        ExplicitLeft = 614
      end
    end
    inherited pnlSortCut: TPanel
      Width = 861
      ExplicitWidth = 861
      inherited lbCTRLEnter: TLabel
        Left = 686
        Height = 15
        ExplicitLeft = 686
      end
      inherited lbEscape: TLabel
        Left = 777
        Height = 15
        ExplicitLeft = 777
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 610
        Height = 15
        ExplicitLeft = 610
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 520
    Top = 296
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
