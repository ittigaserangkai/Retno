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
  inherited pnlHeader: TPanel
    Width = 618
    ExplicitWidth = 618
    inherited lblFilterData: TcxLabel
      Left = 344
      Top = 7
      ExplicitLeft = 344
      ExplicitTop = 7
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 402
      Top = 5
      ExplicitLeft = 402
      ExplicitTop = 5
      ExplicitHeight = 24
    end
    inherited lblsdFilter: TcxLabel
      Left = 497
      Top = 7
      ExplicitLeft = 497
      ExplicitTop = 7
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 523
      Top = 5
      ExplicitLeft = 523
      ExplicitTop = 5
      ExplicitHeight = 24
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
        Left = 517
        Top = 6
        ExplicitLeft = 517
        ExplicitTop = 6
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
        ExplicitLeft = 249
        ExplicitWidth = 74
      end
    end
    inherited pnlSortCut: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited lbl5: TLabel
        Left = 517
        Top = 5
        ExplicitLeft = 517
        ExplicitTop = 5
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
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
