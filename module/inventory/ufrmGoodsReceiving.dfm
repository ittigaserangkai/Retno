inherited frmGoodsReceiving: TfrmGoodsReceiving
  Left = 209
  Top = 125
  Caption = 'Goods Receiving'
  ClientHeight = 492
  ClientWidth = 784
  OldCreateOrder = True
  ExplicitLeft = -6
  ExplicitTop = -155
  ExplicitWidth = 800
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 784
    Height = 436
    ExplicitWidth = 784
    ExplicitHeight = 436
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 780
      Height = 151
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
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
        Left = 30
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
        Left = 7
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
        Left = 29
        Top = 64
        Width = 35
        Height = 16
        Caption = 'DO No.'
      end
      object lbl9: TLabel
        Left = 48
        Top = 120
        Width = 13
        Height = 16
        Caption = 'NP'
      end
      object lbl10: TLabel
        Left = 621
        Top = 8
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl13: TLabel
        Left = 647
        Top = 64
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl14: TLabel
        Left = 626
        Top = 92
        Width = 39
        Height = 16
        Caption = 'PPn. BM'
      end
      object lbl12: TLabel
        Left = 622
        Top = 36
        Width = 44
        Height = 16
        Caption = 'Discount'
      end
      object lbl11: TLabel
        Left = 621
        Top = 120
        Width = 44
        Height = 16
        Caption = 'Total Beli'
      end
      object lbl3: TLabel
        Left = 369
        Top = 8
        Width = 57
        Height = 16
        Caption = 'Total Order'
      end
      object lbl15: TLabel
        Left = 517
        Top = 8
        Width = 29
        Height = 16
        Caption = 'Bonus'
      end
      object lbl16: TLabel
        Left = 374
        Top = 36
        Width = 51
        Height = 16
        Caption = 'Total Colie'
      end
      object lbl17: TLabel
        Left = 486
        Top = 36
        Width = 59
        Height = 16
        Caption = 'Recv. Bonus'
      end
      object lbl24: TLabel
        Left = 211
        Top = 120
        Width = 18
        Height = 15
        Caption = 'new'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lblStatusPO: TLabel
        Left = 556
        Top = 112
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'lblStatusPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
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
        OnClick = btn1Click
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
        Left = 66
        Top = 60
        TabOrder = 2
        OnKeyPress = edtDONoKeyPress
        Width = 106
      end
      object dtDateDO: TcxDateEdit
        Left = 270
        Top = 60
        TabOrder = 6
        Width = 90
      end
      object edtNP: TcxTextEdit
        Left = 66
        Top = 116
        TabStop = False
        Enabled = False
        TabOrder = 12
        Text = '0000010029'
        OnKeyPress = edtDONoKeyPress
        Width = 140
      end
      object jvcuredtSubTotal: TcxCurrencyEdit
        Left = 670
        Top = 4
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 13
        Width = 99
      end
      object jvcuredtPPN: TcxCurrencyEdit
        Left = 670
        Top = 60
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 15
        Width = 99
      end
      object jvcuredtPPNBM: TcxCurrencyEdit
        Left = 670
        Top = 88
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 16
        Width = 99
      end
      object jvcuredtDiscount: TcxCurrencyEdit
        Left = 670
        Top = 32
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 14
        Width = 99
      end
      object jvcuredtTotalBeli: TcxCurrencyEdit
        Left = 670
        Top = 116
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 17
        Width = 99
      end
      object edBonus: TcxCurrencyEdit
        Left = 550
        Top = 4
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 10
        Width = 51
      end
      object edTotalColie: TcxCurrencyEdit
        Left = 430
        Top = 32
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 9
        Width = 51
      end
      object edRecvBonus: TcxCurrencyEdit
        Left = 550
        Top = 32
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 11
        Width = 51
      end
      object edTotalOrder: TcxCurrencyEdit
        Left = 430
        Top = 4
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#.##;(,#.##)'
        TabOrder = 8
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 51
      end
      object btn2: TcxButton
        Left = 241
        Top = 114
        Width = 148
        Height = 27
        Caption = 'Check List NP (Ctrl-D)'
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 18
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btn2Click
      end
      object btnCetakNP: TcxButton
        Left = 392
        Top = 114
        Width = 89
        Height = 27
        Caption = 'NP (Ctrl-P)'
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 19
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btn2Click
      end
      object edPO: TcxTextEdit
        Left = 66
        Top = 4
        TabOrder = 0
        OnKeyDown = edPOKeyDown
        Width = 106
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 370
      Width = 780
      Height = 64
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      Visible = False
      object lbl18: TLabel
        Left = 15
        Top = 35
        Width = 46
        Height = 16
        Caption = 'Disc.1(%)'
      end
      object lbl19: TLabel
        Left = 110
        Top = 36
        Width = 46
        Height = 16
        Caption = 'Disc.2(%)'
      end
      object lbl20: TLabel
        Left = 348
        Top = 36
        Width = 52
        Height = 16
        Caption = 'Total Disc.'
      end
      object lbl21: TLabel
        Left = 208
        Top = 36
        Width = 49
        Height = 16
        Caption = 'Nilai Disc.'
      end
      object lbl22: TLabel
        Left = 574
        Top = 35
        Width = 114
        Height = 16
        Caption = 'Selling Price After Disc.'
        Visible = False
      end
      object lbl23: TLabel
        Left = 15
        Top = 8
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object edDisc1: TcxCurrencyEdit
        Left = 64
        Top = 35
        TabOrder = 1
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 39
      end
      object edDisc2: TcxCurrencyEdit
        Left = 159
        Top = 35
        TabOrder = 2
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 39
      end
      object edNilaiDisc: TcxCurrencyEdit
        Left = 258
        Top = 35
        TabOrder = 3
        Width = 82
      end
      object edTotalDisc: TcxCurrencyEdit
        Left = 403
        Top = 35
        TabOrder = 4
        Width = 164
      end
      object edSellPrice: TcxCurrencyEdit
        Left = 693
        Top = 34
        TabOrder = 5
        Visible = False
        Width = 93
      end
      object edtProductName: TcxTextEdit
        Left = 109
        Top = 4
        TabOrder = 0
        Text = 'edtProductName'
        Width = 458
      end
    end
    object cxGridGR: TcxGrid
      Left = 2
      Top = 153
      Width = 780
      Height = 217
      Align = alClient
      TabOrder = 2
      object cxGridTableGR: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditing = cxGridTableGREditing
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxgrdclmnPLU: TcxGridColumn
          Caption = 'Kode'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object cxgrdclmnHarga: TcxGridColumn
          Caption = 'Harga Satuan'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
        object cxgrdclmnQtyOrder: TcxGridColumn
          Caption = 'Qty Order'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnQtyRecv: TcxGridColumn
          Caption = 'Qty Receive'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          Properties.OnChange = cxgrdclmnQtyRecvPropertiesChange
          HeaderAlignmentHorz = taCenter
          Width = 109
        end
        object cxgrdclmnUOM: TcxGridColumn
          Caption = 'UOM'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnDisc1: TcxGridColumn
          Caption = 'Disc 1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnDisc2: TcxGridColumn
          Caption = 'Disc 2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnDisc3: TcxGridColumn
          Caption = 'Disc 3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.0#;(,0.0#)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnTotalDisc: TcxGridColumn
          Caption = 'Total Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnPriceAfterDisc: TcxGridColumn
          Caption = 'Price After Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdclmnTotal: TcxGridColumn
          Caption = 'Total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#.##;(,#.##)'
          HeaderAlignmentHorz = taCenter
        end
      end
      object cxgrdlvlGR: TcxGridLevel
        GridView = cxGridTableGR
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 436
    Width = 784
    ExplicitTop = 436
    ExplicitWidth = 784
    inherited pnlFooter: TPanel
      Width = 784
      ExplicitWidth = 784
      inherited btnClose: TcxButton
        Left = 707
        Action = actCancel
        ExplicitLeft = 707
      end
      inherited btnSave: TcxButton
        Left = 614
        Action = actSave
        ExplicitLeft = 614
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 537
        ExplicitLeft = 537
      end
    end
    inherited pnlSortCut: TPanel
      Width = 784
      ExplicitWidth = 784
      inherited lbCTRLEnter: TLabel
        Left = 609
        ExplicitLeft = 609
      end
      inherited lbEscape: TLabel
        Left = 700
        ExplicitLeft = 700
      end
      inherited lblCTRLP: TLabel
        Left = 533
        ExplicitLeft = 533
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 504
    Top = 112
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
