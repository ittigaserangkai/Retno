inherited frmAdjustmentFaktur: TfrmAdjustmentFaktur
  Caption = 'Adjustment Faktur'
  ClientHeight = 461
  ClientWidth = 940
  ExplicitWidth = 956
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 940
    Height = 372
    ExplicitWidth = 1023
    ExplicitHeight = 372
    inherited pgcBrowse: TcxPageControl
      Width = 938
      Height = 370
      ExplicitWidth = 1021
      ExplicitHeight = 370
      ClientRectBottom = 369
      ClientRectRight = 937
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 1019
        ExplicitHeight = 368
        inherited cxGrid: TcxGrid
          Width = 936
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
    Width = 940
    ExplicitWidth = 1023
    inherited lblHeader: TLabel
      Width = 103
      Caption = 'Adjustment Faktur'
      ExplicitWidth = 103
    end
    inherited lblFilterData: TcxLabel
      Left = 586
      Visible = True
      ExplicitLeft = 669
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 647
      Visible = True
      ExplicitLeft = 730
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 763
      Visible = True
      ExplicitLeft = 846
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 858
      ExplicitLeft = 941
    end
    inherited lblsdFilter: TcxLabel
      Left = 739
      Visible = True
      ExplicitLeft = 822
      AnchorY = 17
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 295
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Visible = False
      ExplicitLeft = 378
      AnchorY = 17
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 362
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 6
      ExplicitLeft = 445
      Width = 89
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 457
      Top = 4
      Align = alRight
      AutoSize = False
      Caption = ' to '
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Visible = False
      ExplicitLeft = 540
      Height = 25
      Width = 31
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 494
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 8
      Visible = False
      ExplicitLeft = 577
      Width = 89
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 405
    Width = 940
    ExplicitTop = 405
    ExplicitWidth = 1023
    inherited pnlFooter: TPanel
      Width = 940
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
        Left = 863
        Action = actClose
        ExplicitLeft = 946
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 940
      ExplicitWidth = 1023
      inherited lbEscape: TLabel
        Left = 866
        Height = 17
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
