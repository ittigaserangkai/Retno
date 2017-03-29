inherited frmDocument: TfrmDocument
  Caption = 'frmDocument'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    inherited pgcBrowse: TcxPageControl
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 96
        ExplicitHeight = 290
        inherited cxGrid: TcxGrid
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'REF$DOCUMENT_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA DOKUMEN'
              DataBinding.FieldName = 'DOC_NAME'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeader: TLabel
      Width = 100
      Caption = 'MASTER DOKUMEN'
      ExplicitWidth = 100
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
