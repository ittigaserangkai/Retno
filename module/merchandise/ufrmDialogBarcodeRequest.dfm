inherited frmDialogBarcodeRequest: TfrmDialogBarcodeRequest
  Left = 272
  Top = 143
  Caption = 'Add Barcode Requestition'
  ClientHeight = 487
  ClientWidth = 861
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 877
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 861
    Height = 431
    ExplicitWidth = 672
    ExplicitHeight = 431
    inherited cxGrid: TcxGrid
      Top = 91
      Width = 857
      Height = 297
      TabOrder = 2
      ExplicitTop = 233
      ExplicitWidth = 668
      ExplicitHeight = 155
      inherited cxGridView: TcxGridDBTableView
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColKode: TcxGridDBColumn
          Caption = 'Kode'
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object cxGridColNama: TcxGridDBColumn
          Caption = 'Nama'
          HeaderAlignmentHorz = taCenter
          Width = 139
        end
        object cxGridColUOM: TcxGridDBColumn
          Caption = 'UOM'
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object cxGridColBarcode: TcxGridDBColumn
          Caption = 'Barcode'
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object cxGridColQty: TcxGridDBColumn
          Caption = 'Qty'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColHarga: TcxGridDBColumn
          Caption = 'Harga'
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object cxGridColTotal: TcxGridDBColumn
          Caption = 'Total'
          HeaderAlignmentHorz = taCenter
        end
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 857
      Height = 89
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 38
        Width = 49
        Height = 16
        Caption = 'SUPPLIER '
      end
      object lbl3: TLabel
        Left = 33
        Top = 64
        Width = 32
        Height = 16
        Caption = 'HARGA'
      end
      object lbl6: TLabel
        Left = 50
        Top = 13
        Width = 15
        Height = 16
        Caption = 'NO'
      end
      object Label2: TLabel
        Left = 224
        Top = 13
        Width = 44
        Height = 16
        Caption = 'TANGGAL'
      end
      object edtSupplierName: TEdit
        Left = 201
        Top = 35
        Width = 217
        Height = 22
        TabStop = False
        Color = 15066597
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtBarNo: TEdit
        Left = 77
        Top = 10
        Width = 121
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = edtBarNoKeyPress
      end
      object dtTgl: TcxDateEdit
        Left = 288
        Top = 9
        TabOrder = 1
        OnKeyPress = dtTglKeyPress
        Width = 130
      end
      object edbSupplierCode: TcxButtonEdit
        Left = 77
        Top = 34
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 3
        Text = 'edbSupplierCode'
        Width = 121
      end
      object curredtUnitPrice: TcxCurrencyEdit
        Left = 77
        Top = 60
        EditValue = 0.000000000000000000
        TabOrder = 4
        OnExit = IntEdtQtyExit
        OnKeyDown = IntEdtQtyKeyDown
        OnKeyPress = IntEdtQtyKeyPress
        Width = 121
      end
      object grpPurchaseOrder: TGroupBox
        Left = 445
        Top = 1
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
          Left = 55
          Top = 46
          TabOrder = 1
          Width = 121
        end
        object edPO: TcxButtonEdit
          Left = 55
          Top = 19
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 0
          Text = 'edPO'
          Width = 121
        end
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 388
      Width = 857
      Height = 41
      Align = alBottom
      Color = 15198183
      TabOrder = 1
      ExplicitWidth = 668
      DesignSize = (
        857
        41)
      object Label1: TLabel
        Left = 15
        Top = 13
        Width = 98
        Height = 16
        Caption = 'GRAND TOTAL PRICE'
      end
      object lblDelete: TcxLabel
        Left = 728
        Top = 17
        Anchors = [akRight, akBottom]
        Caption = 'Remove Row (Ctrl + R)'
        ParentFont = False
        OnClick = lblDeleteClick
        ExplicitLeft = 539
      end
      object curreditTotalPrice: TcxCurrencyEdit
        Left = 122
        Top = 10
        EditValue = 0.000000000000000000
        TabOrder = 1
        OnExit = IntEdtQtyExit
        OnKeyDown = IntEdtQtyKeyDown
        OnKeyPress = IntEdtQtyKeyPress
        Width = 110
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 431
    Width = 861
    ExplicitTop = 431
    ExplicitWidth = 672
    inherited pnlFooter: TPanel
      Width = 861
      ExplicitWidth = 672
      inherited btnClose: TcxButton
        Left = 784
        Action = actCancel
        ExplicitLeft = 595
      end
      inherited btnSave: TcxButton
        Left = 691
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 502
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 614
        Action = actPrint
        ExplicitLeft = 425
      end
    end
    inherited pnlSortCut: TPanel
      Width = 861
      ExplicitWidth = 672
      inherited lbCTRLEnter: TLabel
        Left = 686
        Height = 15
        ExplicitLeft = 497
      end
      inherited lbEscape: TLabel
        Left = 777
        Height = 15
        ExplicitLeft = 588
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 610
        Height = 15
        ExplicitLeft = 421
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 520
    Top = 296
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
