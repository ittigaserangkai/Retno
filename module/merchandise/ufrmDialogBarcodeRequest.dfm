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
    ExplicitWidth = 861
    ExplicitHeight = 431
    inherited cxGrid: TcxGrid
      Top = 91
      Width = 857
      Height = 338
      TabOrder = 1
      ExplicitTop = 91
      ExplicitWidth = 857
      ExplicitHeight = 338
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
        Ctl3D = False
        Enabled = False
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
        Enabled = False
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
        Width = 121
      end
      object curredtUnitPrice: TcxCurrencyEdit
        Left = 77
        Top = 60
        EditValue = 0.000000000000000000
        Properties.DisplayFormat = ',0.00;(,0.00)'
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
          Width = 121
        end
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
        OnClick = footerDialogMasterbtnSaveClick
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
  end
end
