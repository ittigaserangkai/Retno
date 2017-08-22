inherited frmShift: TfrmShift
  Caption = 'SHIFT'
  ClientHeight = 349
  ClientWidth = 718
  ExplicitWidth = 734
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 718
    Height = 260
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 716
      Height = 258
      ExplicitWidth = 118
      ClientRectBottom = 257
      ClientRectRight = 715
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 116
        inherited cxGrid: TcxGrid
          Width = 714
          Height = 256
          ExplicitWidth = 116
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'SHIFT_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA SHIFT'
              DataBinding.FieldName = 'SHIFT_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'SHIFT DIMULAI'
              DataBinding.FieldName = 'SHIFT_START_TIME'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'SHIFT BERAKHIR'
              DataBinding.FieldName = 'SHIFT_END_TIME'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 718
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 30
      Caption = 'SHIFT'
      ExplicitWidth = 30
    end
    inherited lblFilterData: TcxLabel
      Left = 364
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 425
      ExplicitLeft = -173
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 541
      ExplicitLeft = -57
    end
    inherited btnSearch: TcxButton
      Left = 636
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 517
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 293
    Width = 718
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 718
      ExplicitWidth = 120
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
        Left = 641
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 718
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 644
      end
    end
  end
end
