inherited frmAdjustmentFaktur: TfrmAdjustmentFaktur
  Caption = 'Adjustment Faktur'
  ClientWidth = 1023
  ExplicitWidth = 1039
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 1023
    inherited pgcBrowse: TcxPageControl
      Width = 1021
      ClientRectRight = 1020
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          Width = 1019
          ExplicitLeft = -936
          ExplicitTop = -112
          ExplicitWidth = 1019
          inherited cxGridView: TcxGridDBTableView
            object cxgridColOVPO: TcxGridDBColumn
              Caption = 'PO'
              HeaderAlignmentHorz = taCenter
              Width = 81
            end
            object cxgridColOVNP: TcxGridDBColumn
              Caption = 'NP'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object cxgridColSupplierMG: TcxGridDBColumn
              Caption = 'Supplier MG'
              HeaderAlignmentHorz = taCenter
              Width = 118
            end
            object cxgridColOVTanggalAdj: TcxGridDBColumn
              Caption = 'Tanggal Adj'
              HeaderAlignmentHorz = taCenter
              Width = 88
            end
            object cxgridColOVJenis: TcxGridDBColumn
              Caption = 'Jenis'
              HeaderAlignmentHorz = taCenter
              Width = 69
            end
            object cxgridColKeterangan: TcxGridDBColumn
              Caption = 'Keterangan'
              HeaderAlignmentHorz = taCenter
              Width = 103
            end
            object cxgridColAdjustmen: TcxGridDBColumn
              Caption = 'Adjustment'
              HeaderAlignmentHorz = taCenter
              Width = 118
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 1023
    inherited lblHeader: TLabel
      Width = 103
      Caption = 'Adjustment Faktur'
      ExplicitWidth = 103
    end
    inherited lblFilterData: TcxLabel
      Left = 669
      Visible = True
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 730
      Visible = True
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 846
      Visible = True
    end
    inherited btnSearch: TcxButton
      Left = 941
    end
    inherited lblsdFilter: TcxLabel
      Left = 822
      Visible = True
      AnchorY = 17
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 378
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 250
      ExplicitTop = 2
      AnchorY = 17
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 445
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 6
      Width = 89
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 540
      Top = 4
      Align = alRight
      AutoSize = False
      Caption = ' to '
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 339
      Height = 25
      Width = 31
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 577
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 8
      ExplicitLeft = 635
      ExplicitTop = 2
      Width = 89
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Width = 1023
    inherited pnlFooter: TPanel
      Width = 1023
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
        Left = 946
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 1023
      inherited lbEscape: TLabel
        Left = 949
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
