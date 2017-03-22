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
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 714
      Height = 260
      ExplicitWidth = 98
      ClientRectBottom = 259
      ClientRectRight = 713
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 96
        ExplicitHeight = 290
        inherited cxGrid: TcxGrid
          Width = 712
          Height = 258
          ExplicitWidth = 96
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'NOMOR'
              DataBinding.FieldName = 'GROUP_NO'
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
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 84
      Caption = 'SUPLIER GROUP'
      ExplicitWidth = 84
    end
    inherited lblFilterData: TcxLabel
      Left = 382
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 443
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 559
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 654
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 535
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 315
    Width = 736
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 736
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
        Left = 659
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 736
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 662
        Height = 17
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
