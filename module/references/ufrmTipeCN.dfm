inherited frmTipeCN: TfrmTipeCN
  Caption = 'frmTipeCN'
  ClientHeight = 372
  ClientWidth = 678
  ExplicitWidth = 694
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 678
    Height = 283
    ExplicitWidth = 678
    ExplicitHeight = 283
    inherited pgcBrowse: TcxPageControl
      Width = 656
      Height = 261
      ExplicitWidth = 656
      ExplicitHeight = 261
      ClientRectBottom = 260
      ClientRectRight = 655
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 654
        ExplicitHeight = 259
        inherited cxGrid: TcxGrid
          Width = 654
          Height = 259
          ExplicitWidth = 654
          ExplicitHeight = 259
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'REF$TIPE_CN_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'KODE TIPE CN'
              DataBinding.FieldName = 'TPCN_CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'TPCN_NAME'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 678
    ExplicitWidth = 678
    inherited lblHeader: TLabel
      Width = 89
      Caption = 'MASTER TIPE CN'
      ExplicitWidth = 89
    end
    inherited lblFilterData: TcxLabel
      Left = 324
      ExplicitLeft = 324
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 385
      ExplicitLeft = 385
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 501
      ExplicitLeft = 501
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 596
      ExplicitLeft = 596
    end
    inherited lblsdFilter: TcxLabel
      Left = 477
      ExplicitLeft = 477
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 316
    Width = 678
    ExplicitTop = 316
    ExplicitWidth = 678
    inherited pnlFooter: TPanel
      Width = 678
      ExplicitWidth = 678
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
        Left = 601
        Action = actClose
        ExplicitLeft = 601
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 678
      ExplicitWidth = 678
      inherited lbEscape: TLabel
        Left = 604
        Height = 17
        ExplicitLeft = 604
      end
    end
  end
end
