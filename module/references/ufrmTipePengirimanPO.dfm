inherited frmTipePengirimanPO: TfrmTipePengirimanPO
  Left = 213
  Top = 174
  Caption = 'PO Delivery'#39's Type'
  ClientHeight = 352
  ClientWidth = 727
  OldCreateOrder = True
  ExplicitWidth = 743
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 727
    Height = 263
    ExplicitWidth = 727
    ExplicitHeight = 263
    inherited pgcBrowse: TcxPageControl
      Width = 705
      Height = 241
      ExplicitWidth = 705
      ExplicitHeight = 241
      ClientRectBottom = 240
      ClientRectRight = 704
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 703
        ExplicitHeight = 239
        inherited cxGrid: TcxGrid
          Width = 703
          Height = 239
          ExplicitWidth = 703
          ExplicitHeight = 239
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'TPKRMPO_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'TPKRMPO_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'REF$TIPE_KIRIM_PO_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 727
    ExplicitWidth = 727
    inherited lblFilterData: TcxLabel
      Left = 373
      ExplicitLeft = 373
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 434
      ExplicitLeft = 434
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 550
      ExplicitLeft = 550
    end
    inherited btnSearch: TcxButton
      Left = 645
      ExplicitLeft = 645
    end
    inherited lblsdFilter: TcxLabel
      Left = 526
      ExplicitLeft = 526
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 296
    Width = 727
    ExplicitTop = 296
    ExplicitWidth = 727
    inherited pnlFooter: TPanel
      Width = 727
      ExplicitWidth = 727
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
        Left = 650
        Action = actClose
        ExplicitLeft = 650
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 727
      ExplicitWidth = 727
      inherited lbEscape: TLabel
        Left = 653
        ExplicitLeft = 653
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 526
    Top = 102
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
