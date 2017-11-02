inherited frmElectricRate: TfrmElectricRate
  Caption = 'Electric Rate'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    inherited pgcBrowse: TcxPageControl
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'Group'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'Factor'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'Daya'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'Bea Beban'
              HeaderAlignmentHorz = taCenter
              Width = 62
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'Bea Pemakaian'
              HeaderAlignmentHorz = taCenter
              Width = 84
            end
            object cxGridViewColumn6: TcxGridDBColumn
              Caption = 'TTLB (%)'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn7: TcxGridDBColumn
              Caption = 'PJU (%)'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn8: TcxGridDBColumn
              Caption = 'Debet'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn9: TcxGridDBColumn
              Caption = 'Credit'
              HeaderAlignmentHorz = taCenter
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
