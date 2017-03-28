inherited frmTipeBonus: TfrmTipeBonus
  Caption = 'frmTipeBonus'
  ClientHeight = 353
  ClientWidth = 622
  ExplicitWidth = 638
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 622
    Height = 264
    ExplicitWidth = 622
    inherited pgcBrowse: TcxPageControl
      Width = 600
      Height = 242
      ExplicitWidth = 600
      ClientRectBottom = 241
      ClientRectRight = 599
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 598
        ExplicitHeight = 290
        inherited cxGrid: TcxGrid
          Width = 598
          Height = 240
          ExplicitWidth = 598
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'REF$TIPE_BONUS_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'KODE BONUS'
              DataBinding.FieldName = 'TPBNS_CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'NAMA'
              DataBinding.FieldName = 'TPBNS_NAME'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 622
    ExplicitWidth = 622
    inherited lblHeader: TLabel
      Width = 110
      Caption = 'MASTER TIPE BONUS'
      ExplicitWidth = 110
    end
    inherited lblFilterData: TcxLabel
      Left = 268
      ExplicitLeft = 268
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 329
      ExplicitLeft = 329
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 445
      ExplicitLeft = 445
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 540
      ExplicitLeft = 540
    end
    inherited lblsdFilter: TcxLabel
      Left = 421
      ExplicitLeft = 421
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 297
    Width = 622
    ExplicitTop = -56
    ExplicitWidth = 622
    inherited pnlFooter: TPanel
      Width = 622
      ExplicitWidth = 622
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
        Left = 545
        Action = actClose
        ExplicitLeft = 545
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 622
      ExplicitWidth = 622
      inherited lbEscape: TLabel
        Left = 548
        Height = 17
        ExplicitLeft = 548
      end
    end
  end
end
