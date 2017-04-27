inherited frmOutlet: TfrmOutlet
  Left = 268
  Top = 262
  Caption = 'Sales Outlet'
  ClientHeight = 336
  ClientWidth = 772
  OldCreateOrder = True
  ExplicitWidth = 788
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 772
    Height = 247
    ExplicitWidth = 772
    ExplicitHeight = 247
    inherited pgcBrowse: TcxPageControl
      Width = 750
      Height = 225
      ExplicitWidth = 750
      ExplicitHeight = 225
      ClientRectBottom = 224
      ClientRectRight = 749
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 748
        ExplicitHeight = 223
        inherited cxGrid: TcxGrid
          Width = 748
          Height = 223
          ExplicitWidth = 748
          ExplicitHeight = 223
          inherited cxGridView: TcxGridDBTableView
            object cxgrdbclmnOUTLET_ID: TcxGridDBColumn
              DataBinding.FieldName = 'REF$OUTLET_ID'
              Width = 120
            end
            object cxgrdbclmnOUTLET_CODE: TcxGridDBColumn
              DataBinding.FieldName = 'OUTLET_CODE'
            end
            object cxgrdbclmnOUTLET_NAME: TcxGridDBColumn
              DataBinding.FieldName = 'OUTLET_CODE'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 772
    ExplicitWidth = 772
    inherited lblFilterData: TcxLabel
      Left = 418
      ExplicitLeft = 418
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 479
      ExplicitLeft = 479
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 595
      ExplicitLeft = 595
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 690
      ExplicitLeft = 690
    end
    inherited lblsdFilter: TcxLabel
      Left = 571
      ExplicitLeft = 571
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 280
    Width = 772
    ExplicitTop = 280
    ExplicitWidth = 772
    inherited pnlFooter: TPanel
      Width = 772
      ExplicitWidth = 772
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
        Left = 695
        Action = actClose
        ExplicitLeft = 695
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 772
      ExplicitWidth = 772
      inherited lbEscape: TLabel
        Left = 698
        Height = 17
        ExplicitLeft = 698
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
