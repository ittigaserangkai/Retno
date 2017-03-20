inherited frmSupplierType: TfrmSupplierType
  Top = 282
  Caption = 'Supplier Type'
  ClientHeight = 417
  ClientWidth = 711
  OldCreateOrder = True
  ExplicitWidth = 727
  ExplicitHeight = 456
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 711
    Height = 328
    ExplicitWidth = 711
    ExplicitHeight = 328
    inherited pgcBrowse: TcxPageControl
      Width = 689
      Height = 306
      ExplicitWidth = 689
      ExplicitHeight = 306
      ClientRectBottom = 305
      ClientRectRight = 688
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 687
        ExplicitHeight = 304
        inherited cxGrid: TcxGrid
          Width = 687
          Height = 304
          ExplicitWidth = 687
          ExplicitHeight = 304
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'KODE SUPLIER'
              DataBinding.FieldName = 'TPSUP_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA SUPLIER'
              DataBinding.FieldName = 'TPSUP_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'OP_CREATE'
              Visible = False
            end
            object cxGridViewColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_CREATE'
              Visible = False
            end
            object cxGridViewColumn5: TcxGridDBColumn
              DataBinding.FieldName = 'OP_MODIFY'
              Visible = False
            end
            object cxGridViewColumn6: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_MODIFY'
              Visible = False
            end
            object cxGridViewColumn7: TcxGridDBColumn
              DataBinding.FieldName = 'OPC_UNIT'
              Visible = False
            end
            object cxGridViewColumn8: TcxGridDBColumn
              DataBinding.FieldName = 'OPM_UNIT'
              Visible = False
            end
            object cxGridViewColumn9: TcxGridDBColumn
              DataBinding.FieldName = 'REF$TIPE_SUPLIER_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 711
    ExplicitWidth = 711
    inherited lblFilterData: TcxLabel
      Left = 357
      ExplicitLeft = 357
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 418
      ExplicitLeft = 418
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 534
      ExplicitLeft = 534
    end
    inherited btnSearch: TcxButton
      Left = 629
      ExplicitLeft = 629
    end
    inherited lblsdFilter: TcxLabel
      Left = 510
      ExplicitLeft = 510
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 361
    Width = 711
    ExplicitTop = 361
    ExplicitWidth = 711
    inherited pnlFooter: TPanel
      Width = 711
      ExplicitWidth = 711
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
        Left = 634
        Action = actClose
        ExplicitLeft = 634
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 711
      ExplicitWidth = 711
      inherited lbEscape: TLabel
        Left = 637
        Height = 17
        ExplicitLeft = 637
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 257
    Top = 55
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
