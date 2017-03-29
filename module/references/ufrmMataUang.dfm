inherited frmMataUang: TfrmMataUang
  Caption = 'frmMataUang'
  ClientHeight = 352
  ClientWidth = 564
  ExplicitWidth = 580
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 564
    Height = 263
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 542
      Height = 241
      ExplicitWidth = 98
      ClientRectBottom = 240
      ClientRectRight = 541
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 96
        ExplicitHeight = 290
        inherited cxGrid: TcxGrid
          Width = 540
          Height = 239
          ExplicitWidth = 96
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'REF$MATAUANG_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'UANG_CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'SIMBOL'
              DataBinding.FieldName = 'UANG_SYMBOL'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'NAMA UANG'
              DataBinding.FieldName = 'UANG_NAME'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'SKALA'
              DataBinding.FieldName = 'UANG_SCALE'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 564
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 112
      Caption = 'MASTER MATA UANG'
      ExplicitWidth = 112
    end
    inherited lblFilterData: TcxLabel
      Left = 210
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 271
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 387
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 482
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 363
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 296
    Width = 564
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 564
      ExplicitWidth = 120
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
        Left = 487
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 564
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 490
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 440
    Top = 88
  end
end
