inherited frmAgama: TfrmAgama
  Caption = 'frmAgama'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    inherited pgcBrowse: TcxPageControl
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'NAMA AGAMA'
              DataBinding.FieldName = 'AGAMA_NAME'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'REF$AGAMA_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
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
