inherited frmAdjustmentFaktur: TfrmAdjustmentFaktur
  Caption = 'Adjustment Faktur'
  ClientHeight = 461
  ClientWidth = 1023
  ExplicitTop = -33
  ExplicitWidth = 1039
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 1023
    Height = 372
    ExplicitWidth = 1023
    ExplicitHeight = 372
    inherited pgcBrowse: TcxPageControl
      Width = 1021
      Height = 370
      ExplicitWidth = 1021
      ExplicitHeight = 370
      ClientRectBottom = 369
      ClientRectRight = 1020
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 1019
        ExplicitHeight = 368
        inherited cxGrid: TcxGrid
          Width = 1019
          Height = 368
          ExplicitWidth = 1019
          ExplicitHeight = 368
          inherited cxGridView: TcxGridDBTableView
            object cxgridColOVAdjNo: TcxGridDBColumn
              Caption = 'ADJ NO'
              DataBinding.FieldName = 'ADJFAK_NO'
              Width = 90
            end
            object cxgridColOVPO: TcxGridDBColumn
              Caption = 'PO'
              DataBinding.FieldName = 'PO_NO'
              HeaderAlignmentHorz = taCenter
              Width = 81
            end
            object cxgridColOVNP: TcxGridDBColumn
              Caption = 'NP'
              DataBinding.FieldName = 'DO_NP'
              HeaderAlignmentHorz = taCenter
              Width = 120
            end
            object cxgridColSupplierMG: TcxGridDBColumn
              Caption = 'Supplier'
              DataBinding.FieldName = 'SUP_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 118
            end
            object cxgridColOVTanggalAdj: TcxGridDBColumn
              Caption = 'Tanggal Adj'
              DataBinding.FieldName = 'ADJFAK_DATE'
              HeaderAlignmentHorz = taCenter
              Width = 88
            end
            object cxgridColOVJenis: TcxGridDBColumn
              Caption = 'Jenis'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 69
            end
            object cxgridColKeterangan: TcxGridDBColumn
              Caption = 'Keterangan'
              DataBinding.FieldName = 'ADJFAK_REF'
              HeaderAlignmentHorz = taCenter
              Width = 191
            end
            object cxgridColAdjustmen: TcxGridDBColumn
              Caption = 'Adjustment'
              DataBinding.FieldName = 'ADJFAK_TOTAL_ADJ'
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
    ExplicitWidth = 1023
    inherited lblHeader: TLabel
      Width = 103
      Caption = 'Adjustment Faktur'
      ExplicitWidth = 103
    end
    inherited lblFilterData: TcxLabel
      Left = 669
      Visible = True
      ExplicitLeft = 669
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 730
      Visible = True
      ExplicitLeft = 730
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 846
      Visible = True
      ExplicitLeft = 846
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 941
      ExplicitLeft = 941
    end
    inherited lblsdFilter: TcxLabel
      Left = 822
      Visible = True
      ExplicitLeft = 822
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
      Visible = False
      ExplicitLeft = 318
      AnchorY = 17
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 445
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 6
      ExplicitHeight = 21
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
      Visible = False
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
      Visible = False
      ExplicitHeight = 21
      Width = 89
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 405
    Width = 1023
    ExplicitTop = 405
    ExplicitWidth = 1023
    inherited pnlFooter: TPanel
      Width = 1023
      ExplicitWidth = 1023
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
        ExplicitLeft = 946
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 1023
      ExplicitWidth = 1023
      inherited lbEscape: TLabel
        Left = 949
        ExplicitLeft = 949
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
