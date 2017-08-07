inherited frmDialogAdjustmentFaktur: TfrmDialogAdjustmentFaktur
  Caption = 'Dialog Adjustment Faktur'
  ClientHeight = 458
  ClientWidth = 946
  ExplicitWidth = 962
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 946
    Height = 402
    ExplicitWidth = 946
    ExplicitHeight = 402
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 936
      Height = 284
      Align = alTop
      TabOrder = 0
      object pnlHeaderSatu: TPanel
        Left = 1
        Top = 1
        Width = 934
        Height = 128
        Align = alTop
        TabOrder = 0
        object lblNoBukti: TLabel
          Left = 34
          Top = 13
          Width = 42
          Height = 16
          Caption = 'No Bukti'
        end
        object lblTglBukti: TLabel
          Left = 240
          Top = 14
          Width = 37
          Height = 16
          Caption = 'Tanggal'
        end
        object lblSupplierMG: TLabel
          Left = 19
          Top = 45
          Width = 57
          Height = 16
          Caption = 'Supplier MG'
        end
        object lblReferensi: TLabel
          Left = 29
          Top = 102
          Width = 47
          Height = 16
          Caption = 'Referensi'
        end
        object edNoBukti: TcxTextEdit
          Left = 89
          Top = 10
          TabOrder = 0
          Text = 'edNoBukti'
          Width = 145
        end
        object edTglBukti: TcxDateEdit
          Left = 283
          Top = 10
          EditValue = 43081d
          TabOrder = 1
          Width = 114
        end
        object cbbSupplierMG: TcxExtLookupComboBox
          Left = 89
          Top = 40
          TabOrder = 2
          Width = 308
        end
        object lblPO: TcxLabel
          Left = 39
          Top = 71
          Caption = 'NP/PO'
          Transparent = True
        end
        object cbbNP: TcxExtLookupComboBox
          Left = 89
          Top = 70
          TabOrder = 4
          Width = 145
        end
        object cbbPO: TcxExtLookupComboBox
          Left = 252
          Top = 70
          TabOrder = 5
          Width = 145
        end
        object lblGaring: TcxLabel
          Left = 238
          Top = 72
          Caption = '/'
          Transparent = True
        end
        object edReferenei: TcxTextEdit
          Left = 89
          Top = 98
          TabOrder = 7
          Text = 'edReferenei'
          Width = 308
        end
      end
      object pnlHeaderDua: TPanel
        Left = 1
        Top = 129
        Width = 934
        Height = 154
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 138
        object pnlDO: TPanel
          Left = 265
          Top = 1
          Width = 216
          Height = 152
          Align = alLeft
          TabOrder = 0
          object lblAdjSubTotal: TLabel
            Left = 23
            Top = 9
            Width = 44
            Height = 16
            Caption = 'Sub Total'
          end
          object lblAdjDiskon: TLabel
            Left = 34
            Top = 37
            Width = 33
            Height = 16
            Caption = 'Diskon'
          end
          object lblAdjPPN: TLabel
            Left = 48
            Top = 65
            Width = 19
            Height = 16
            Caption = 'PPN'
          end
          object lblAdjPPNBM: TLabel
            Left = 31
            Top = 93
            Width = 36
            Height = 16
            Caption = 'PPN BM'
          end
          object lblAdjTotal: TLabel
            Left = 43
            Top = 121
            Width = 24
            Height = 16
            Caption = 'Total'
          end
          object edAdjSubTotal: TcxCurrencyEdit
            Left = 80
            Top = 5
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 0
            Width = 121
          end
          object edAdjDiskon: TcxCurrencyEdit
            Left = 80
            Top = 33
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 1
            Width = 121
          end
          object edAdjPPN: TcxCurrencyEdit
            Left = 80
            Top = 61
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 2
            Width = 121
          end
          object edAdjPPNBM: TcxCurrencyEdit
            Left = 80
            Top = 89
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 3
            Width = 121
          end
          object edAdjTotal: TcxCurrencyEdit
            Left = 80
            Top = 117
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 4
            Width = 121
          end
        end
        object pnlAdj: TPanel
          Left = 1
          Top = 1
          Width = 264
          Height = 152
          Align = alLeft
          TabOrder = 1
          object lblSubTotal: TLabel
            Left = 31
            Top = 9
            Width = 44
            Height = 16
            Caption = 'Sub Total'
          end
          object lblDiskon: TLabel
            Left = 42
            Top = 37
            Width = 33
            Height = 16
            Caption = 'Diskon'
          end
          object lblPPN: TLabel
            Left = 56
            Top = 65
            Width = 19
            Height = 16
            Caption = 'PPN'
          end
          object lblPPNBM: TLabel
            Left = 39
            Top = 93
            Width = 36
            Height = 16
            Caption = 'PPN BM'
          end
          object lblTotal: TLabel
            Left = 51
            Top = 121
            Width = 24
            Height = 16
            Caption = 'Total'
          end
          object edSubTotal: TcxCurrencyEdit
            Left = 88
            Top = 5
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 0
            Width = 121
          end
          object edDiskon: TcxCurrencyEdit
            Left = 88
            Top = 33
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 1
            Width = 121
          end
          object edPPN: TcxCurrencyEdit
            Left = 88
            Top = 61
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 2
            Width = 121
          end
          object edPPNBM: TcxCurrencyEdit
            Left = 88
            Top = 89
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 3
            Width = 121
          end
          object edTotal: TcxCurrencyEdit
            Left = 88
            Top = 117
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 4
            Width = 121
          end
        end
      end
    end
    object cxGridAdjFakturItem: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 295
      Width = 936
      Height = 102
      Align = alClient
      TabOrder = 1
      ExplicitTop = 320
      ExplicitHeight = 77
      object cxGridDBTableAdjFakturItem: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxgridColAdjItemProductCode: TcxGridDBColumn
          Caption = 'Product Code'
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object cxgridColAdjItemProductName: TcxGridDBColumn
          Caption = 'Product Name'
          HeaderAlignmentHorz = taCenter
          Width = 120
        end
        object cxgridColAdjItemQty: TcxGridDBColumn
          Caption = 'Qty Receipt'
          HeaderAlignmentHorz = taCenter
          Width = 96
        end
        object cxgridColAdjItemUnitPrice: TcxGridDBColumn
          Caption = 'Unit Price'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxgridColAdjItemDiscount: TcxGridDBColumn
          Caption = 'Discount'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxgridColAdjItemPPN: TcxGridDBColumn
          Caption = 'PPN'
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object cxgridColAdjItemPPNBM: TcxGridDBColumn
          Caption = 'PPN BM'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
      end
      object cxgrdlvlAdjFakturItem: TcxGridLevel
        GridView = cxGridDBTableAdjFakturItem
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 402
    Width = 946
    ExplicitTop = 402
    ExplicitWidth = 946
    inherited pnlFooter: TPanel
      Width = 946
      ExplicitWidth = 946
      inherited btnClose: TcxButton
        Left = 869
        Action = actCancel
        ExplicitLeft = 869
      end
      inherited btnSave: TcxButton
        Left = 776
        Action = actSave
        ExplicitLeft = 776
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 699
        Action = actPrint
        ExplicitLeft = 699
      end
    end
    inherited pnlSortCut: TPanel
      Width = 946
      ExplicitWidth = 946
      inherited lbCTRLEnter: TLabel
        Left = 771
        Height = 15
        ExplicitLeft = 771
      end
      inherited lbEscape: TLabel
        Left = 862
        Height = 15
        ExplicitLeft = 862
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 695
        Height = 15
        ExplicitLeft = 695
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 48
    Top = 264
  end
end
