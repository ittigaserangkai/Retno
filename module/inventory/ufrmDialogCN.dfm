inherited frmDialogCN: TfrmDialogCN
  Caption = 'CN Receiving'
  ClientHeight = 511
  ClientWidth = 889
  ExplicitTop = -111
  ExplicitWidth = 905
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 889
    Height = 455
    ExplicitWidth = 889
    ExplicitHeight = 392
    object pnlHeader: TPanel
      Left = 2
      Top = 2
      Width = 885
      Height = 119
      Align = alTop
      TabOrder = 0
      object lblTglCN: TLabel
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
      object lblNomorCN: TLabel
        Left = 284
        Top = 14
        Width = 30
        Height = 16
        Caption = 'No CN'
      end
      object lblTglTerima: TLabel
        Left = 264
        Top = 40
        Width = 50
        Height = 16
        Caption = 'Tgl Terima'
      end
      object lblNP: TLabel
        Left = 301
        Top = 66
        Width = 13
        Height = 16
        Caption = 'NP'
      end
      object lblNomorDO: TLabel
        Left = 264
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
        Left = 485
        Top = 66
        Width = 36
        Height = 16
        Caption = 'PPN BM'
      end
      object lblTotal: TLabel
        Left = 497
        Top = 92
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object dtCN: TcxDateEdit
        Left = 104
        Top = 10
        TabOrder = 0
        Width = 129
      end
      object edKodeSupplier: TcxTextEdit
        Left = 104
        Top = 62
        TabStop = False
        Enabled = False
        TabOrder = 1
        Text = 'edPO'
        Width = 129
      end
      object edNamaSupplier: TcxTextEdit
        Left = 21
        Top = 88
        TabStop = False
        Enabled = False
        TabOrder = 2
        Text = 'edPO'
        Width = 212
      end
      object edNoCN: TcxTextEdit
        Left = 326
        Top = 10
        TabStop = False
        Enabled = False
        TabOrder = 3
        Text = 'edNoCN'
        Width = 121
      end
      object dtTerima: TcxDateEdit
        Left = 326
        Top = 36
        TabStop = False
        Enabled = False
        TabOrder = 4
        Width = 121
      end
      object edNoNP: TcxTextEdit
        Left = 326
        Top = 62
        TabStop = False
        Enabled = False
        TabOrder = 5
        Text = 'edNoNP'
        Width = 121
      end
      object edNoDO: TcxTextEdit
        Left = 326
        Top = 88
        TabStop = False
        Enabled = False
        TabOrder = 6
        Text = 'edNoDO'
        Width = 121
      end
      object edSubTotal: TcxCurrencyEdit
        Left = 528
        Top = 10
        TabStop = False
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 7
        Width = 121
      end
      object edPPN: TcxCurrencyEdit
        Left = 528
        Top = 36
        TabStop = False
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 8
        Width = 121
      end
      object edPPNBM: TcxCurrencyEdit
        Left = 528
        Top = 62
        TabStop = False
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 9
        Width = 121
      end
      object edTotal: TcxCurrencyEdit
        Left = 528
        Top = 88
        TabStop = False
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 10
        Width = 121
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
        Width = 129
      end
    end
    object cxgrdCN: TcxGrid
      Left = 2
      Top = 148
      Width = 885
      Height = 305
      Align = alClient
      TabOrder = 1
      ExplicitTop = 121
      ExplicitHeight = 269
      object cxGridTableCNDetail: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditing = cxGridTableCNDetailEditing
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
        object cxgrdclmnCNDetailColumnTipe: TcxGridColumn
          Caption = 'Tipe'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCNDetailColumnKode: TcxGridColumn
          AlternateCaption = 'CNRD_POD'
          Caption = 'Kode'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.OnValidate = cxGridColCNDetailColumnKodePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object cxGridColCNDetailColumnNama: TcxGridColumn
          AlternateCaption = 'CNRD_BRG'
          Caption = 'Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 276
        end
        object cxGridColCNDetailColumnHargaBeli: TcxGridColumn
          AlternateCaption = 'CNRD_PRICE'
          Caption = 'Harga Beli'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object cxGridColCNDetailColumnQty: TcxGridColumn
          AlternateCaption = 'CNRD_QTY'
          Caption = 'Qty'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCNDetailColumnUOM: TcxGridColumn
          AlternateCaption = 'CNRD_UOM'
          Caption = 'UOM'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCNDetailColumnTotal: TcxGridColumn
          AlternateCaption = 'CNRD_TOTAL'
          Caption = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object cxGridColCNDetailColumnBarangSupplier: TcxGridColumn
          AlternateCaption = 'CNRD_BarangSupplier'
          Caption = 'BarangSupplier'
          Visible = False
          Width = 87
        end
        object cxGridColCNDetailColumnPO: TcxGridColumn
          AlternateCaption = 'CNRD_PO'
          Caption = 'PO'
          Visible = False
        end
        object cxGridColCNDetailColumnPPN: TcxGridColumn
          AlternateCaption = 'CNRD_PPN'
          Caption = 'PPN'
          Visible = False
        end
        object cxGridColCNDetailColumnPPNBM: TcxGridColumn
          AlternateCaption = 'CNRD_PPN'
          Caption = 'PPNBM'
          Visible = False
        end
        object cxGridColCNDetailColumnPPNBMPERSEN: TcxGridColumn
          AlternateCaption = 'CNRD_PPNBM_PERSEN'
          Caption = 'PPNBM PERSEN'
          Visible = False
        end
        object cxGridColCNDetailColumnPPNPERSEN: TcxGridColumn
          AlternateCaption = 'CNRD_PPN_PERSEN'
          Caption = 'PPN PERSEN'
          Visible = False
        end
        object cxGridColCNDetailColumnTotalDisc: TcxGridColumn
          AlternateCaption = 'CNRD_TOTAL_DISC'
          Caption = 'TOTAL DISC'
          Width = 82
        end
        object cxGridColCNDetailColumnSupMG: TcxGridColumn
          AlternateCaption = 'SUPMG'
          Caption = 'SUPMG'
          Visible = False
        end
      end
      object cxgrdlvlCN: TcxGridLevel
        Caption = 'CN Detail'
        GridView = cxGridTableCNDetail
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
      ExplicitTop = 151
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
        ExplicitLeft = 168
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
    ExplicitTop = 392
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
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
