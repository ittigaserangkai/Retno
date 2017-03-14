inherited frmTipePembayaran: TfrmTipePembayaran
  Left = 248
  Top = 217
  Caption = 'Payment Type'
  ClientHeight = 335
  ClientWidth = 618
  OldCreateOrder = True
  ExplicitWidth = 634
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 618
    Height = 246
    ExplicitWidth = 618
    ExplicitHeight = 246
    inherited pgcBrowse: TcxPageControl
      Width = 596
      Height = 224
      ExplicitWidth = 596
      ExplicitHeight = 224
      ClientRectBottom = 223
      ClientRectRight = 595
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 596
        ExplicitHeight = 224
        inherited cxGrid: TcxGrid
          Width = 596
          Height = 224
          ExplicitWidth = 596
          ExplicitHeight = 224
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'ID'
              DataBinding.FieldName = 'REF$TIPE_PEMBAYARAN_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'TPBYR_CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'Nama'
              DataBinding.FieldName = 'TPBYR_NAME'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 618
    ExplicitWidth = 618
    inherited lblFilterData: TcxLabel
      Left = 264
      ExplicitLeft = 264
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 325
      ExplicitLeft = 325
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 441
      ExplicitLeft = 441
    end
    inherited btnSearch: TcxButton
      Left = 536
      ExplicitLeft = 536
    end
    inherited lblsdFilter: TcxLabel
      Left = 417
      ExplicitLeft = 417
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 279
    Width = 618
    ExplicitTop = 279
    ExplicitWidth = 618
    inherited pnlFooter: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited btnClose: TcxButton
        Left = 541
        Action = actClose
        ExplicitLeft = 541
      end
      inherited btnAdd: TcxButton
        Action = actAddTipePembayaran
      end
      inherited btnUpdate: TcxButton
        Action = actEditTipePembayaran
      end
      inherited btnPrint: TcxButton
        Left = 249
        Width = 74
        Action = actPrint
        ExplicitLeft = 249
        ExplicitWidth = 74
      end
    end
    inherited pnlSortCut: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited lbl5: TLabel
        Left = 544
        ExplicitLeft = 544
      end
    end
  end
  object actlstTipePembayaran: TActionList
    Left = 479
    Top = 44
    object actAddTipePembayaran: TAction
      Caption = '&Add'
      OnExecute = actAddTipePembayaranExecute
    end
    object actEditTipePembayaran: TAction
      Caption = '&Edit / Lihat'
      OnExecute = actEditTipePembayaranExecute
    end
    object actDeleteTipePembayaran: TAction
      Caption = 'actDeleteTipePembayaran'
      OnExecute = actDeleteTipePembayaranExecute
    end
    object actRefreshTipePembayaran: TAction
      Caption = 'actRefreshTipePembayaran'
      OnExecute = actRefreshTipePembayaranExecute
    end
  end
end
