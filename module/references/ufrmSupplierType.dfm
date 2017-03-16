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
    ExplicitWidth = 542
    ExplicitHeight = 247
    inherited pgcBrowse: TcxPageControl
      Width = 689
      Height = 306
      ExplicitWidth = 520
      ExplicitHeight = 225
      ClientRectBottom = 305
      ClientRectRight = 688
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 518
        ExplicitHeight = 223
        inherited cxGrid: TcxGrid
          Width = 687
          Height = 304
          ExplicitWidth = 518
          ExplicitHeight = 223
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'Kode Suplier'
              DataBinding.FieldName = 'TPSUP_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'Nama Suplier'
              DataBinding.FieldName = 'TPSUP_NAME'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 711
    ExplicitWidth = 542
    inherited lblFilterData: TcxLabel
      Left = 357
      ExplicitLeft = 188
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 418
      ExplicitLeft = 249
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 534
      ExplicitLeft = 365
    end
    inherited btnSearch: TcxButton
      Left = 629
      ExplicitLeft = 460
    end
    inherited lblsdFilter: TcxLabel
      Left = 510
      ExplicitLeft = 341
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 361
    Width = 711
    ExplicitTop = 280
    ExplicitWidth = 542
    inherited pnlFooter: TPanel
      Width = 711
      ExplicitWidth = 542
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
        ExplicitLeft = 465
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 711
      inherited lbEscape: TLabel
        Left = 637
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 257
    Top = 55
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
