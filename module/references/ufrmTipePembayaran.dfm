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
      Width = 616
      Height = 244
      ExplicitWidth = 616
      ExplicitHeight = 244
      ClientRectBottom = 243
      ClientRectRight = 615
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 614
        ExplicitHeight = 242
        inherited cxGrid: TcxGrid
          Width = 614
          Height = 242
          ExplicitWidth = 614
          ExplicitHeight = 242
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
    inherited lblHeader: TLabel
      Width = 77
      Caption = 'Payment Type'
      ExplicitWidth = 77
    end
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
      inherited btnAdd: TcxButton
        Action = actAdd
        TabOrder = 1
      end
      inherited btnUpdate: TcxButton
        Action = actClose
        TabOrder = 0
        OnClick = actEditExecute
        ExplicitTop = 5
      end
      inherited btnPrint: TcxButton
        Width = 74
        Action = actPrint
        ExplicitWidth = 74
      end
      inherited btnClose: TcxButton
        Left = 541
        Action = actClose
        ExplicitLeft = 541
      end
      inherited cxButton1: TcxButton
        Left = 342
        Action = actExport
        ExplicitLeft = 342
      end
    end
    inherited pnlShortCut: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited lbEscape: TLabel
        Left = 544
        Height = 17
        ExplicitLeft = 544
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 516
    Top = 96
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
