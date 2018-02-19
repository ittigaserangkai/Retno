inherited frmBarcodeRequest: TfrmBarcodeRequest
  Left = 240
  Top = 165
  Caption = 'Barcode Label Requestition'
  ClientHeight = 405
  ClientWidth = 874
  OldCreateOrder = True
  ExplicitWidth = 890
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 874
    Height = 316
    ExplicitWidth = 874
    ExplicitHeight = 316
    inherited pgcBrowse: TcxPageControl
      Width = 872
      Height = 314
      ExplicitWidth = 872
      ExplicitHeight = 314
      ClientRectBottom = 313
      ClientRectRight = 871
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 870
        ExplicitHeight = 312
        inherited cxGrid: TcxGrid
          Width = 870
          Height = 312
          ExplicitWidth = 870
          ExplicitHeight = 312
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'NO'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'TANGGAL'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ShowTime = False
            end
            object cxGridViewColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'KODE'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'NAMA'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              DataBinding.FieldName = 'TOTAL'
            end
            object cxGridViewColumn6: TcxGridDBColumn
              DataBinding.FieldName = 'COLIE'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 874
    ExplicitWidth = 874
    inherited lblHeader: TLabel
      Width = 102
      Caption = 'BARCODE REQUEST'
      ExplicitWidth = 102
    end
    inherited lblFilterData: TcxLabel
      Left = 520
      Visible = True
      ExplicitLeft = 520
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 581
      Visible = True
      ExplicitLeft = 581
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 697
      Visible = True
      ExplicitLeft = 697
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 792
      ExplicitLeft = 792
    end
    inherited lblsdFilter: TcxLabel
      Left = 673
      Visible = True
      ExplicitLeft = 673
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 349
    Width = 874
    ExplicitTop = 349
    ExplicitWidth = 874
    inherited pnlFooter: TPanel
      Width = 874
      ExplicitWidth = 874
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
        Left = 797
        Action = actClose
        ExplicitLeft = 797
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 874
      ExplicitWidth = 874
      inherited lbEscape: TLabel
        Left = 800
        ExplicitLeft = 800
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
    object actAddRow: TAction
      Caption = '&Show'
      ImageIndex = 18
    end
  end
end
