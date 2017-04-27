inherited frmSupplierGroup: TfrmSupplierGroup
  Caption = 'frmSupplierGroup'
  ClientHeight = 371
  ClientWidth = 736
  ExplicitWidth = 752
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 736
    Height = 282
    ExplicitWidth = 736
    ExplicitHeight = 282
    inherited pgcBrowse: TcxPageControl
      Width = 714
      Height = 260
      ExplicitWidth = 714
      ExplicitHeight = 260
      ClientRectBottom = 259
      ClientRectRight = 713
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 712
        ExplicitHeight = 258
        inherited cxGrid: TcxGrid
          Width = 712
          Height = 258
          ExplicitWidth = 712
          ExplicitHeight = 258
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'KODE'
              DataBinding.FieldName = 'GROUP_CODE'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'GROUP_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'DESKRIPSI'
              DataBinding.FieldName = 'GROUP_DESCRIPTION'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'SUPLIER_GROUP_ID'
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 736
    ExplicitWidth = 736
    inherited lblHeader: TLabel
      Width = 84
      Caption = 'SUPLIER GROUP'
      ExplicitWidth = 84
    end
    inherited lblFilterData: TcxLabel
      Left = 382
      ExplicitLeft = 382
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 443
      ExplicitLeft = 443
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 559
      ExplicitLeft = 559
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 654
      ExplicitLeft = 654
    end
    inherited lblsdFilter: TcxLabel
      Left = 535
      ExplicitLeft = 535
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 315
    Width = 736
    ExplicitTop = 315
    ExplicitWidth = 736
    inherited pnlFooter: TPanel
      Width = 736
      ExplicitWidth = 736
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
        Left = 659
        Action = actClose
        ExplicitLeft = 659
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 736
      ExplicitWidth = 736
      inherited lbEscape: TLabel
        Left = 662
        Height = 17
        ExplicitLeft = 662
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 176
    Top = 104
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
