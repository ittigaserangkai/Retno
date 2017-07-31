inherited frmDialogDN: TfrmDialogDN
  Caption = 'DN Receiving'
  ClientHeight = 511
  ClientWidth = 889
  ExplicitWidth = 905
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 889
    Height = 455
    ExplicitWidth = 889
    ExplicitHeight = 455
    object pnlHeader: TPanel
      Left = 2
      Top = 2
      Width = 885
      Height = 119
      Align = alTop
      TabOrder = 0
      object lblTglDN: TLabel
        Left = 21
        Top = 13
        Width = 54
        Height = 16
        Caption = 'Tanggal CN'
      end
      object lblNomorPO: TLabel
        Left = 21
        Top = 40
        Width = 49
        Height = 16
        Caption = 'Nomor PO'
      end
      object lblKodeSupplier: TLabel
        Left = 21
        Top = 66
        Width = 66
        Height = 16
        Caption = 'Kode Supplier'
      end
      object lblNomorDN: TLabel
        Left = 286
        Top = 14
        Width = 30
        Height = 16
        Caption = 'No DN'
      end
      object lblTglTerima: TLabel
        Left = 266
        Top = 40
        Width = 50
        Height = 16
        Caption = 'Tgl Terima'
      end
      object lblNP: TLabel
        Left = 303
        Top = 66
        Width = 13
        Height = 16
        Caption = 'NP'
      end
      object lblNomorDO: TLabel
        Left = 266
        Top = 92
        Width = 50
        Height = 16
        Caption = 'Nomor DO'
      end
      object lblSubTotal: TLabel
        Left = 477
        Top = 14
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lblPPN: TLabel
        Left = 502
        Top = 40
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lblPPNBM: TLabel
        Left = 716
        Top = 18
        Width = 36
        Height = 16
        Caption = 'PPN BM'
        Visible = False
      end
      object lblTotal: TLabel
        Left = 497
        Top = 66
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object dtDN: TcxDateEdit
        Left = 104
        Top = 10
        TabOrder = 0
        Width = 137
      end
      object edKodeSupplier: TcxTextEdit
        Left = 104
        Top = 62
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 1
        Text = 'edPO'
        Width = 137
      end
      object edNamaSupplier: TcxTextEdit
        Left = 21
        Top = 88
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 2
        Text = 'edPO'
        Width = 220
      end
      object edNoDN: TcxTextEdit
        Left = 326
        Top = 10
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 3
        Text = 'edNoDN'
        Width = 131
      end
      object dtTerima: TcxDateEdit
        Left = 326
        Top = 36
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 131
      end
      object edNoNP: TcxTextEdit
        Left = 326
        Top = 62
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 5
        Text = 'edNoNP'
        Width = 131
      end
      object edNoDO: TcxTextEdit
        AlignWithMargins = True
        Left = 326
        Top = 88
        TabStop = False
        Properties.ReadOnly = True
        TabOrder = 6
        Text = 'edNoDO'
        Width = 131
      end
      object edSubTotal: TcxCurrencyEdit
        Left = 528
        Top = 10
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 7
        Width = 129
      end
      object edPPN: TcxCurrencyEdit
        Left = 528
        Top = 36
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 8
        Width = 129
      end
      object edPPNBM: TcxCurrencyEdit
        Left = 759
        Top = 14
        TabStop = False
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 9
        Visible = False
        Width = 121
      end
      object edTotal: TcxCurrencyEdit
        Left = 528
        Top = 62
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 10
        Width = 129
      end
      object edPO: TcxButtonEdit
        Left = 104
        Top = 36
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edPOPropertiesButtonClick
        TabOrder = 11
        Text = 'edPO'
        OnKeyDown = edPOKeyDown
        Width = 137
      end
    end
    object cxgrdDN: TcxGrid
      Left = 2
      Top = 148
      Width = 885
      Height = 305
      Align = alClient
      TabOrder = 1
      object cxGridTableDNDetail: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditing = cxGridTableDNDetailEditing
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxgrdclmnDNDetailColumnTipe: TcxGridColumn
          Caption = 'Tipe'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColDNDetailColumnKode: TcxGridColumn
          AlternateCaption = 'CNRD_POD'
          Caption = 'Kode'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.OnValidate = cxGridColDNDetailColumnKodePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object cxGridColDNDetailColumnNama: TcxGridColumn
          AlternateCaption = 'CNRD_BRG'
          Caption = 'Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 276
        end
        object cxGridColDNDetailColumnHargaBeli: TcxGridColumn
          AlternateCaption = 'CNRD_PRICE'
          Caption = 'Harga Beli'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object cxGridColDNDetailColumnDisc: TcxGridColumn
          Caption = 'Discount'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColDNDetailColumnQty: TcxGridColumn
          AlternateCaption = 'CNRD_QTY'
          Caption = 'Qty'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.OnEditValueChanged = cxGridColDNDetailColumnQtyPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColDNDetailColumnUOM: TcxGridColumn
          AlternateCaption = 'CNRD_UOM'
          Caption = 'UOM'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColDNDetailColumnTotalDisc: TcxGridColumn
          AlternateCaption = 'CNRD_TOTAL_DISC'
          Caption = 'TOTAL DISC'
          Visible = False
          Width = 82
        end
        object cxGridColDNDetailColumnTotal: TcxGridColumn
          AlternateCaption = 'CNRD_TOTAL'
          Caption = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object cxGridColDNDetailColumnBarangSupplier: TcxGridColumn
          AlternateCaption = 'CNRD_BarangSupplier'
          Caption = 'BarangSupplier'
          Visible = False
          Width = 87
        end
        object cxGridColDNDetailColumnPO: TcxGridColumn
          AlternateCaption = 'CNRD_PO'
          Caption = 'PO'
          Visible = False
        end
        object cxGridColDNDetailColumnPPN: TcxGridColumn
          AlternateCaption = 'CNRD_PPN'
          Caption = 'PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColDNDetailColumnPPNBM: TcxGridColumn
          AlternateCaption = 'CNRD_PPN'
          Caption = 'PPNBM'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColDNDetailColumnPPNBMPERSEN: TcxGridColumn
          AlternateCaption = 'CNRD_PPNBM_PERSEN'
          Caption = 'PPNBM PERSEN'
          Visible = False
        end
        object cxGridColDNDetailColumnPPNPERSEN: TcxGridColumn
          AlternateCaption = 'CNRD_PPN_PERSEN'
          Caption = 'PPN PERSEN'
          Visible = False
        end
        object cxGridColDNDetailColumnSupMG: TcxGridColumn
          AlternateCaption = 'SUPMG'
          Caption = 'SUPMG'
          Visible = False
        end
        object cxGridColDNDetailColumnPODetail: TcxGridColumn
          Caption = 'PO_Detail'
          Visible = False
        end
      end
      object cxgrdlvlDN: TcxGridLevel
        Caption = 'CN Detail'
        GridView = cxGridTableDNDetail
      end
    end
    object cxGroupBox5: TcxGroupBox
      Left = 2
      Top = 121
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = [bRight, bBottom]
      TabOrder = 2
      Height = 27
      Width = 885
      object Label29: TLabel
        AlignWithMargins = True
        Left = 631
        Top = 6
        Width = 249
        Height = 18
        Margins.Top = 4
        Margins.Bottom = 1
        Align = alRight
        Caption = 'ALT-T [Tambah]  | ALT-U [Update]  |  ALT-D [Delete]'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 16
      end
      object btnDeletePrice: TcxButton
        AlignWithMargins = True
        Left = 85
        Top = 2
        Width = 80
        Height = 23
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Delete'
        OptionsImage.ImageIndex = 8
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = btnDeletePriceClick
      end
      object btnAddPrice: TcxButton
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 80
        Height = 23
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Tambah'
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.ImageIndex = 0
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = btnAddPriceClick
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 455
    Width = 889
    ExplicitTop = 455
    ExplicitWidth = 889
    inherited pnlFooter: TPanel
      Width = 889
      ExplicitWidth = 889
      inherited btnClose: TcxButton
        Left = 812
        Action = actCancel
        ExplicitLeft = 812
      end
      inherited btnSave: TcxButton
        Left = 719
        Action = actSave
        ExplicitLeft = 719
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 642
        Action = actPrint
        ExplicitLeft = 642
      end
    end
    inherited pnlSortCut: TPanel
      Width = 889
      ExplicitWidth = 889
      inherited lbCTRLEnter: TLabel
        Left = 714
        Height = 15
        ExplicitLeft = 714
      end
      inherited lbEscape: TLabel
        Left = 805
        Height = 15
        ExplicitLeft = 805
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 638
        Height = 15
        ExplicitLeft = 638
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 536
    Top = 224
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
