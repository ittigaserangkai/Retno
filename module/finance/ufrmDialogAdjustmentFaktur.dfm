inherited frmDialogAdjustmentFaktur: TfrmDialogAdjustmentFaktur
  Caption = 'Dialog Adjustment Faktur'
  ClientHeight = 561
  ClientWidth = 808
  ExplicitWidth = 824
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 808
    Height = 505
    ExplicitWidth = 808
    ExplicitHeight = 505
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 798
      Height = 245
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object pnlHeaderSatu: TPanel
        Left = 0
        Top = 0
        Width = 798
        Height = 112
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 34
        ExplicitTop = -3
        object lblNoBukti: TLabel
          Left = 38
          Top = 3
          Width = 42
          Height = 16
          Alignment = taRightJustify
          Caption = 'No Bukti'
        end
        object lblTglBukti: TLabel
          Left = 237
          Top = 4
          Width = 37
          Height = 16
          Caption = 'Tanggal'
        end
        object lblReferensi: TLabel
          Left = 33
          Top = 79
          Width = 47
          Height = 16
          Alignment = taRightJustify
          Caption = 'Referensi'
        end
        object Label4: TLabel
          Left = 31
          Top = 54
          Width = 49
          Height = 16
          Alignment = taRightJustify
          Caption = 'Nomor PO'
        end
        object Label6: TLabel
          Left = 241
          Top = 53
          Width = 33
          Height = 16
          Alignment = taRightJustify
          Caption = 'No. NP'
        end
        object edNoBukti: TcxTextEdit
          Left = 86
          Top = 0
          TabOrder = 0
          Width = 145
        end
        object edTglBukti: TcxDateEdit
          Left = 280
          Top = 0
          EditValue = 43081d
          TabOrder = 1
          Width = 78
        end
        object cbbSupplierMG: TcxExtLookupComboBox
          Left = 86
          Top = 25
          TabOrder = 2
          Width = 320
        end
        object edReferensi: TcxTextEdit
          Left = 86
          Top = 75
          TabOrder = 3
          Width = 320
        end
        object edPO: TcxButtonEdit
          Left = 86
          Top = 50
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = edPOPropertiesButtonClick
          TabOrder = 4
          Width = 145
        end
        object edNP: TcxTextEdit
          Left = 280
          Top = 50
          TabOrder = 5
          Width = 126
        end
        object ckSupplier: TCheckBox
          Left = 25
          Top = 29
          Width = 58
          Height = 17
          Caption = 'Supplier'
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = ckSupplierClick
        end
      end
      object pnlHeaderDua: TPanel
        Left = 0
        Top = 112
        Width = 798
        Height = 133
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cxGroupBox1: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Align = alLeft
          Caption = ' Before Adjustment '
          ParentBackground = False
          ParentColor = False
          Style.BorderStyle = ebsFlat
          Style.Color = clWhite
          TabOrder = 0
          Height = 127
          Width = 216
          object lblSubTotal: TLabel
            Left = 31
            Top = 24
            Width = 44
            Height = 16
            Caption = 'Sub Total'
          end
          object lblDiskon: TLabel
            Left = 42
            Top = 49
            Width = 33
            Height = 16
            Caption = 'Diskon'
          end
          object lblPPN: TLabel
            Left = 56
            Top = 74
            Width = 19
            Height = 16
            Caption = 'PPN'
          end
          object lblTotal: TLabel
            Left = 51
            Top = 99
            Width = 24
            Height = 16
            Caption = 'Total'
          end
          object edOldSubTotal: TcxCurrencyEdit
            Left = 79
            Top = 21
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 0
            Width = 121
          end
          object edOldDisc: TcxCurrencyEdit
            Left = 79
            Top = 46
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 1
            Width = 121
          end
          object edOldPPN: TcxCurrencyEdit
            Left = 79
            Top = 71
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 2
            Width = 121
          end
          object edOldTotal: TcxCurrencyEdit
            Left = 79
            Top = 96
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 3
            Width = 121
          end
        end
        object cxGroupBox3: TcxGroupBox
          AlignWithMargins = True
          Left = 225
          Top = 3
          Align = alLeft
          Caption = ' After Adjustment '
          ParentBackground = False
          ParentColor = False
          Style.BorderStyle = ebsFlat
          Style.Color = clWhite
          TabOrder = 1
          Height = 127
          Width = 216
          object Label1: TLabel
            Left = 31
            Top = 24
            Width = 44
            Height = 16
            Caption = 'Sub Total'
          end
          object Label2: TLabel
            Left = 42
            Top = 49
            Width = 33
            Height = 16
            Caption = 'Diskon'
          end
          object Label3: TLabel
            Left = 56
            Top = 74
            Width = 19
            Height = 16
            Caption = 'PPN'
          end
          object Label5: TLabel
            Left = 51
            Top = 99
            Width = 24
            Height = 16
            Caption = 'Total'
          end
          object edNewSubTotal: TcxCurrencyEdit
            Left = 79
            Top = 21
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 0
            Width = 121
          end
          object edNewDisc: TcxCurrencyEdit
            Left = 79
            Top = 46
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 1
            Width = 121
          end
          object edNewPPN: TcxCurrencyEdit
            Left = 79
            Top = 71
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 2
            Width = 121
          end
          object edNewTotal: TcxCurrencyEdit
            Left = 79
            Top = 96
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            TabOrder = 3
            Width = 121
          end
        end
      end
    end
    object pnlDetail: TPanel
      Left = 2
      Top = 253
      Width = 804
      Height = 250
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object cxGridAdjFakturItem: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 798
        Height = 244
        Align = alClient
        TabOrder = 0
        object cxGridDBTableAdjFakturItem: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0;(,0)'
              Kind = skSum
              Column = cxgridColAdjItemTotal
            end
            item
              Format = ',0;(,0)'
              Kind = skSum
              Column = cxgridColAdjItemAdj
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxgridColAdjItemProductCode: TcxGridDBColumn
            Caption = 'Product Code'
            DataBinding.FieldName = 'Brg_Code'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
          end
          object cxgridColAdjItemProductName: TcxGridDBColumn
            Caption = 'Product Name'
            DataBinding.FieldName = 'Brg_Name'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 186
          end
          object cxgridColAdjItemQty: TcxGridDBColumn
            Caption = 'Qty Receipt'
            DataBinding.FieldName = 'AFD_QTY'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Properties.ReadOnly = True
            Properties.OnEditValueChanged = cxgridColAdjItemQtyPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 73
          end
          object cxgridColAdjItemUnitPrice: TcxGridDBColumn
            Caption = 'Unit Price'
            DataBinding.FieldName = 'AFD_PRICE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Properties.OnEditValueChanged = cxgridColAdjItemUnitPricePropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 99
          end
          object cxgridColAdjItemDiscount: TcxGridDBColumn
            Caption = 'Discount'
            DataBinding.FieldName = 'AFD_DISC'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Properties.OnEditValueChanged = cxgridColAdjItemDiscountPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 84
          end
          object cxgridColAdjItemPPN: TcxGridDBColumn
            Caption = 'PPN %'
            DataBinding.FieldName = 'AFD_PPN'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 47
          end
          object cxgridColAdjItemTotal: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 105
          end
          object cxgridColAdjItemAdj: TcxGridDBColumn
            Caption = 'Total Adjust'
            DataBinding.FieldName = 'AFD_VAL_ADJ_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 108
          end
        end
        object cxgrdlvlAdjFakturItem: TcxGridLevel
          GridView = cxGridDBTableAdjFakturItem
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 505
    Width = 808
    ExplicitTop = 505
    ExplicitWidth = 808
    inherited pnlFooter: TPanel
      Width = 808
      ExplicitWidth = 808
      inherited btnClose: TcxButton
        Left = 731
        Action = actCancel
        ExplicitLeft = 731
      end
      inherited btnSave: TcxButton
        Left = 638
        Action = actSave
        ExplicitLeft = 638
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 561
        Action = actPrint
        ExplicitLeft = 561
      end
    end
    inherited pnlSortCut: TPanel
      Width = 808
      ExplicitWidth = 808
      inherited lbCTRLEnter: TLabel
        Left = 633
        Height = 15
        ExplicitLeft = 633
      end
      inherited lbEscape: TLabel
        Left = 724
        Height = 15
        ExplicitLeft = 724
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 557
        Height = 15
        ExplicitLeft = 557
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 720
    Top = 16
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
