inherited frmTipePO: TfrmTipePO
  Caption = 'frmTipePO'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    inherited pgcBrowse: TcxPageControl
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'TPPO_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'TIPE PO'
              DataBinding.FieldName = 'TPPO_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'REF$TIPE_PO_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeader: TLabel
      Width = 89
      Caption = 'MASTER TIPE PO'
      ExplicitWidth = 89
    end
    inherited lblFilterData: TcxLabel
      AnchorY = 17
    end
    inherited lblsdFilter: TcxLabel
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    inherited pnlFooter: TPanel
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
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 17
      end
    end
  end
end
