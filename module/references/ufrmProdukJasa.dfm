inherited frmProdukJasa: TfrmProdukJasa
  Caption = 'frmProdukJasa'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    inherited pgcBrowse: TcxPageControl
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          ExplicitLeft = 2
          ExplicitTop = -2
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'PRODUK_JASA_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'PROJAS_CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'PROJAS_NAME'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'PROJAS_OWNER'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeader: TLabel
      Width = 75
      Caption = 'PRODUK JASA'
      ExplicitWidth = 75
    end
    inherited lblFilterData: TcxLabel
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      ExplicitHeight = 23
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
        ExplicitTop = 5
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
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
