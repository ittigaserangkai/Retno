inherited frmSupplierGroup: TfrmSupplierGroup
  Caption = 'frmSupplierGroup'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    inherited pgcBrowse: TcxPageControl
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'NOMOR'
              DataBinding.FieldName = 'GROUP_NO'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'GROUP_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'DESKRIPSI'
              DataBinding.FieldName = 'GROUP_DESCRIPTION'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'SUPLIER_GROUP_ID'
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
  inherited actlstBrowse: TActionList
    Left = 176
    Top = 104
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
