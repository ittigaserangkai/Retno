inherited frmUnit: TfrmUnit
  Left = 163
  Top = 152
  Caption = 'Store Unit'
  ClientHeight = 397
  ClientWidth = 771
  OldCreateOrder = True
  ExplicitWidth = 787
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 771
    Height = 308
    BorderWidth = 2
    ExplicitWidth = 771
    ExplicitHeight = 308
    inherited pgcBrowse: TcxPageControl
      Left = 3
      Top = 3
      Width = 765
      Height = 302
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 765
      ExplicitHeight = 302
      ClientRectBottom = 302
      ClientRectRight = 765
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 765
        ExplicitHeight = 302
        inherited cxGrid: TcxGrid
          Width = 765
          Height = 302
          ExplicitWidth = 765
          ExplicitHeight = 302
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'NO'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'KODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'NAMA'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'KETERANGAN'
              Width = 140
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'ALAMAT'
              Width = 129
            end
            object cxGridViewColumn6: TcxGridDBColumn
              Caption = 'NPWP'
            end
            object cxGridViewColumn7: TcxGridDBColumn
              Caption = 'TIPE'
            end
            object cxGridViewColumn8: TcxGridDBColumn
              Caption = 'AKTIF'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 771
    ExplicitWidth = 771
    inherited lblFilterData: TcxLabel
      Left = 417
      ExplicitLeft = 417
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 478
      ExplicitLeft = 478
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 594
      ExplicitLeft = 594
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 689
      ExplicitLeft = 689
    end
    inherited lblsdFilter: TcxLabel
      Left = 570
      ExplicitLeft = 570
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 341
    Width = 771
    ExplicitTop = 341
    ExplicitWidth = 771
    inherited pnlFooter: TPanel
      Width = 771
      ExplicitWidth = 771
      inherited btnClose: TcxButton
        Left = 694
        Action = actClose
        ExplicitLeft = 694
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 771
      ExplicitWidth = 771
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 697
        Height = 17
        ExplicitLeft = 697
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
