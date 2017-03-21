inherited frmTipePerusahaan: TfrmTipePerusahaan
  Left = 184
  Top = 237
  Caption = 'Master Tipe Perusahaan'
  ClientHeight = 324
  ClientWidth = 570
  OldCreateOrder = True
  OnDeactivate = FormDeactivate
  ExplicitWidth = 586
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 570
    Height = 235
    ExplicitWidth = 546
    ExplicitHeight = 235
    inherited pgcBrowse: TcxPageControl
      Width = 548
      Height = 213
      ExplicitWidth = 524
      ExplicitHeight = 213
      ClientRectBottom = 212
      ClientRectRight = 547
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 522
        ExplicitHeight = 211
        inherited cxGrid: TcxGrid
          Width = 546
          Height = 211
          ExplicitWidth = 522
          ExplicitHeight = 211
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'TPPERSH_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'TPPERSH_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'ID'
              DataBinding.FieldName = 'REF$TIPE_PERUSAHAAN_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 570
    ExplicitWidth = 546
    inherited lblHeader: TLabel
      Width = 98
      Caption = 'TIPE PERUSAHAAN'
      ExplicitWidth = 98
    end
    inherited lblFilterData: TcxLabel
      Left = 216
      ExplicitLeft = 192
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 277
      ExplicitLeft = 253
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 393
      ExplicitLeft = 369
    end
    inherited btnSearch: TcxButton
      Left = 488
      ExplicitLeft = 464
    end
    inherited lblsdFilter: TcxLabel
      Left = 369
      ExplicitLeft = 345
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 268
    Width = 570
    ExplicitTop = 268
    ExplicitWidth = 546
    inherited pnlFooter: TPanel
      Width = 570
      ExplicitWidth = 546
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
        Left = 493
        Action = actClose
        ExplicitLeft = 469
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 570
      ExplicitWidth = 546
      inherited lbEscape: TLabel
        Left = 496
        Height = 17
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
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
