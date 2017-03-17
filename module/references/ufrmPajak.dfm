inherited frmPajak: TfrmPajak
  Left = 261
  Top = 178
  Caption = 'Tax'
  ClientHeight = 372
  ClientWidth = 740
  OldCreateOrder = True
  ExplicitWidth = 756
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 740
    Height = 283
    ExplicitWidth = 740
    ExplicitHeight = 283
    inherited pgcBrowse: TcxPageControl
      Width = 718
      Height = 261
      ClientRectBottom = 260
      ClientRectRight = 717
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          Width = 716
          Height = 259
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'KODE PAJAK'
              DataBinding.FieldName = 'PJK_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'PJK_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'PPN'
              DataBinding.FieldName = 'PJK_PPN'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'PPNBM'
              DataBinding.FieldName = 'PJK_PPNBM'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              DataBinding.FieldName = 'PJK_IS_DEFAULT'
              Visible = False
            end
            object cxGridViewColumn6: TcxGridDBColumn
              DataBinding.FieldName = 'OP_CREATE'
              Visible = False
            end
            object cxGridViewColumn8: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_CREATE'
              Visible = False
            end
            object cxGridViewColumn7: TcxGridDBColumn
              DataBinding.FieldName = 'OP_MODIFY'
              Visible = False
            end
            object cxGridViewColumn9: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_MODIFY'
              Visible = False
            end
            object cxGridViewColumn10: TcxGridDBColumn
              DataBinding.FieldName = 'OPC_UNIT'
              Visible = False
            end
            object cxGridViewColumn11: TcxGridDBColumn
              DataBinding.FieldName = 'OPM_UNIT'
              Visible = False
            end
            object cxGridViewColumn12: TcxGridDBColumn
              DataBinding.FieldName = 'REF$PAJAK_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 740
    ExplicitWidth = 740
    inherited lblFilterData: TcxLabel
      Left = 386
      ExplicitLeft = 386
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 447
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 563
    end
    inherited btnSearch: TcxButton
      Left = 658
    end
    inherited lblsdFilter: TcxLabel
      Left = 539
      ExplicitLeft = 539
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 316
    Width = 740
    inherited pnlFooter: TPanel
      Width = 740
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        OnClick = btnUpdateClick
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 740
      inherited lbEscape: TLabel
        Left = 666
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
  end
end
