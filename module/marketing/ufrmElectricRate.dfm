inherited frmElectricRate: TfrmElectricRate
  Caption = 'Electric Rate'
  ClientHeight = 400
  ClientWidth = 624
  ExplicitWidth = 640
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 624
    Height = 311
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 622
      Height = 309
      ExplicitWidth = 122
      ClientRectBottom = 308
      ClientRectRight = 621
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 120
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 620
          Height = 307
          ExplicitWidth = 120
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
    Width = 624
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 270
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 331
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 447
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 542
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 423
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 344
    Width = 624
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 624
      ExplicitWidth = 124
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
        Left = 547
        Action = actClose
        ExplicitLeft = 47
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 624
      ExplicitWidth = 124
      inherited lbEscape: TLabel
        Left = 550
        Height = 17
      end
    end
  end
end
