inherited frmPORevision: TfrmPORevision
  Caption = 'PO Revision'
  ClientHeight = 373
  ClientWidth = 754
  ExplicitWidth = 770
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 754
    Height = 317
    ExplicitWidth = 754
    ExplicitHeight = 317
    object cxGridDBPODetil: TcxGrid
      Left = 2
      Top = 137
      Width = 750
      Height = 122
      Align = alClient
      TabOrder = 0
      LevelTabs.Style = 10
      object cxGridTablePODetil: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxgrdclmnPODSKU: TcxGridColumn
          Caption = 'SKU'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxgrdclmnPODNama: TcxGridColumn
          Caption = 'Merk & Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 140
        end
        object cxgrdclmnPODUOM: TcxGridColumn
          Caption = 'Satuan'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPODJumlah: TcxGridColumn
          Caption = 'Jumlah'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPODHarga: TcxGridColumn
          Caption = 'Harga'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPODDisc1: TcxGridColumn
          Caption = 'Disc 1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPODDisc2: TcxGridColumn
          Caption = 'Disc 2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPODDisc3: TcxGridColumn
          Caption = 'Disc 3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPODTotal: TcxGridColumn
          Caption = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
      end
      object cxgrdlvlGridPODetil: TcxGridLevel
        GridView = cxGridTablePODetil
      end
    end
    object pnlPOFooter: TPanel
      Left = 2
      Top = 259
      Width = 750
      Height = 56
      Align = alBottom
      TabOrder = 1
      object lblSubTotal: TLabel
        Left = 20
        Top = 4
        Width = 51
        Height = 16
        Caption = 'Sub Total :'
      end
      object lblDisc1: TLabel
        Left = 122
        Top = 4
        Width = 28
        Height = 16
        Caption = 'Disc :'
      end
      object lblPPN: TLabel
        Left = 224
        Top = 4
        Width = 26
        Height = 16
        Caption = 'PPN :'
      end
      object lblPPNBM: TLabel
        Left = 326
        Top = 4
        Width = 40
        Height = 16
        Caption = 'PPNBM :'
      end
      object lblTotal: TLabel
        Left = 428
        Top = 4
        Width = 31
        Height = 16
        Caption = 'Total :'
      end
      object edSubTotal: TcxCurrencyEdit
        Left = 20
        Top = 22
        EditValue = 12000000000.000000000000000000
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 0
        Width = 87
      end
      object edDisc1: TcxCurrencyEdit
        Left = 122
        Top = 22
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 1
        Width = 87
      end
      object edPPN: TcxCurrencyEdit
        Left = 224
        Top = 22
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 2
        Width = 87
      end
      object edPPNBM: TcxCurrencyEdit
        Left = 326
        Top = 22
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 3
        Width = 87
      end
      object edTotal: TcxCurrencyEdit
        Left = 428
        Top = 22
        TabOrder = 4
        Width = 121
      end
    end
    object cxPCHeader: TcxPageControl
      Left = 2
      Top = 2
      Width = 750
      Height = 135
      Align = alTop
      TabOrder = 2
      Properties.ActivePage = cxTSPOHeader
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 10
      Properties.TabSlants.Kind = skCutCorner
      TabSlants.Kind = skCutCorner
      ClientRectBottom = 135
      ClientRectRight = 750
      ClientRectTop = 22
      object cxTSPOHeader: TcxTabSheet
        Caption = 'Revisi Purchase Order'
        ImageIndex = 0
        object lblPOLama: TLabel
          Left = 18
          Top = 5
          Width = 50
          Height = 16
          Caption = 'PO Lama :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblNoPOBaru: TLabel
          Left = 18
          Top = 49
          Width = 47
          Height = 16
          Caption = 'PO Baru :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblPODate: TLabel
          Left = 159
          Top = 3
          Width = 44
          Height = 16
          Caption = 'Tanggal :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblSupMG: TLabel
          Left = 300
          Top = 3
          Width = 145
          Height = 16
          Caption = 'Supplier Merchandise Group :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblNoSO: TLabel
          Left = 159
          Top = 49
          Width = 36
          Height = 16
          Caption = 'No SO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblSupplier: TLabel
          Left = 300
          Top = 49
          Width = 46
          Height = 16
          Caption = 'Supplier :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblTOP: TLabel
          Left = 465
          Top = 3
          Width = 26
          Height = 16
          Caption = 'TOP :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object lblValidUntil: TLabel
          Left = 465
          Top = 49
          Width = 67
          Height = 16
          Caption = 'Valid Sampai :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object edPOLama: TcxTextEdit
          Left = 18
          Top = 23
          TabOrder = 0
          Text = 'edPOLama'
          Width = 121
        end
        object edNoPOBaru: TcxTextEdit
          Left = 18
          Top = 67
          Enabled = False
          TabOrder = 1
          Text = 'Otomatis'
          Width = 121
        end
        object edPODate: TcxDateEdit
          Left = 159
          Top = 23
          Enabled = False
          TabOrder = 2
          Width = 121
        end
        object cbbSupplier: TcxExtLookupComboBox
          Left = 300
          Top = 23
          Enabled = False
          TabOrder = 4
          Width = 145
        end
        object cbbSupMGNama: TcxExtLookupComboBox
          Left = 300
          Top = 67
          Enabled = False
          TabOrder = 5
          Width = 145
        end
        object edtop: TcxTextEdit
          Left = 465
          Top = 23
          Enabled = False
          TabOrder = 6
          Text = 'edtop'
          Width = 121
        end
        object edValidUntil: TcxDateEdit
          Left = 465
          Top = 67
          Enabled = False
          TabOrder = 7
          Width = 121
        end
        object cbbSO: TcxExtLookupComboBox
          Left = 159
          Top = 67
          Enabled = False
          TabOrder = 3
          Width = 121
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 317
    Width = 754
    ExplicitTop = 317
    ExplicitWidth = 754
    inherited pnlFooter: TPanel
      Width = 754
      ExplicitWidth = 754
      inherited btnClose: TcxButton
        Left = 677
        Action = actCancel
        ExplicitLeft = 677
      end
      inherited btnSave: TcxButton
        Left = 584
        Action = actSave
        ExplicitLeft = 584
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 507
        ExplicitLeft = 507
      end
    end
    inherited pnlSortCut: TPanel
      Width = 754
      ExplicitWidth = 754
      inherited lbCTRLEnter: TLabel
        Left = 579
        Height = 15
        ExplicitLeft = 579
      end
      inherited lbEscape: TLabel
        Left = 670
        Height = 15
        ExplicitLeft = 670
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 503
        Height = 15
        ExplicitLeft = 503
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 648
    Top = 200
  end
end
