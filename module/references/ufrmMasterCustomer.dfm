inherited frmMasterCustomer: TfrmMasterCustomer
  Caption = 'frmMasterCustomer'
  ClientHeight = 414
  ClientWidth = 708
  ExplicitWidth = 724
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 708
    Height = 325
    ExplicitWidth = 708
    inherited pgcBrowse: TcxPageControl
      Width = 706
      Height = 323
      ExplicitWidth = 706
      ClientRectBottom = 322
      ClientRectRight = 705
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 704
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 704
          Height = 321
          ExplicitTop = 1
          ExplicitWidth = 704
          ExplicitHeight = 321
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'CUSTOMER_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'CUST_CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'CUST_NAME'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'KOTA'
              DataBinding.FieldName = 'CUST_CITY'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'KONTAK PERSON'
              DataBinding.FieldName = 'CUST_CONTACT_PERSON'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 708
    ExplicitWidth = 708
    inherited lblHeader: TLabel
      Width = 195
      Caption = 'Iki Header  Master Customer, Bro...!'
      ExplicitWidth = 195
    end
    inherited lblFilterData: TcxLabel
      Left = 354
      ExplicitLeft = 354
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 415
      ExplicitLeft = 415
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 531
      ExplicitLeft = 531
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited lblsdFilter: TcxLabel
      Left = 507
      ExplicitLeft = 507
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 358
    Width = 708
    ExplicitTop = -56
    ExplicitWidth = 708
    inherited pnlFooter: TPanel
      Width = 708
      ExplicitWidth = 708
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 631
        Action = actClose
        ExplicitLeft = 631
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 708
      ExplicitWidth = 708
      inherited lbEscape: TLabel
        Left = 634
        Height = 17
        ExplicitLeft = 634
      end
    end
  end
end
