inherited frmTipePerusahaan: TfrmTipePerusahaan
  Left = 184
  Top = 237
  Caption = 'Master Tipe Perusahaan'
  ClientHeight = 324
  ClientWidth = 546
  OldCreateOrder = True
  OnDeactivate = FormDeactivate
  ExplicitWidth = 562
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 546
    Height = 235
    ExplicitWidth = 546
    ExplicitHeight = 235
    inherited pgcBrowse: TcxPageControl
      Width = 524
      Height = 213
      ExplicitWidth = 524
      ExplicitHeight = 213
      ClientRectBottom = 212
      ClientRectRight = 523
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 522
        ExplicitHeight = 211
        inherited cxGrid: TcxGrid
          Width = 522
          Height = 211
          ExplicitTop = -6
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
    Width = 546
    ExplicitWidth = 546
    inherited lblHeader: TLabel
      Width = 98
      Caption = 'TIPE PERUSAHAAN'
      ExplicitLeft = 0
      ExplicitTop = 6
      ExplicitWidth = 98
      ExplicitHeight = 21
    end
    inherited lblFilterData: TcxLabel
      Left = 192
      ExplicitLeft = 192
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 253
      ExplicitLeft = 253
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 369
      ExplicitLeft = 369
    end
    inherited btnSearch: TcxButton
      Left = 464
      ExplicitLeft = 464
    end
    inherited lblsdFilter: TcxLabel
      Left = 345
      ExplicitLeft = 345
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 268
    Width = 546
    ExplicitTop = 268
    ExplicitWidth = 546
    inherited pnlFooter: TPanel
      Width = 546
      ExplicitWidth = 546
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        ExplicitTop = 5
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 469
        Action = actClose
        ExplicitLeft = 469
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 546
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
