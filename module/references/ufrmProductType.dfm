inherited frmProductType: TfrmProductType
  Left = 190
  Top = 168
  Caption = 'Product Type'
  ClientHeight = 365
  ClientWidth = 723
  OldCreateOrder = True
  ExplicitWidth = 739
  ExplicitHeight = 404
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 723
    Height = 276
    ExplicitWidth = 723
    ExplicitHeight = 276
    inherited pgcBrowse: TcxPageControl
      Width = 701
      Height = 254
      ExplicitWidth = 701
      ExplicitHeight = 254
      ClientRectBottom = 253
      ClientRectRight = 700
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          Width = 699
          Height = 252
          ExplicitWidth = 699
          ExplicitHeight = 252
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'REF$TIPE_BARANG_ID'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 723
    ExplicitWidth = 723
    inherited lblFilterData: TcxLabel
      Left = 369
      ExplicitLeft = 369
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 430
      ExplicitLeft = 430
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 546
      ExplicitLeft = 546
    end
    inherited btnSearch: TcxButton
      Left = 641
      ExplicitLeft = 641
    end
    inherited lblsdFilter: TcxLabel
      Left = 522
      ExplicitLeft = 522
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 309
    Width = 723
    ExplicitTop = 309
    ExplicitWidth = 723
    inherited pnlFooter: TPanel
      Width = 723
      ExplicitWidth = 723
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
        Left = 646
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 723
      ExplicitWidth = 723
      inherited lbEscape: TLabel
        Left = 649
        Height = 17
        ExplicitLeft = 649
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
