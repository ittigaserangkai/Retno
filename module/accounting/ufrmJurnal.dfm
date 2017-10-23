inherited frmJurnal: TfrmJurnal
  Caption = 'Jurnal'
  ClientHeight = 430
  ClientWidth = 724
  ExplicitWidth = 740
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 724
    Height = 341
    ExplicitWidth = 724
    ExplicitHeight = 341
    inherited pgcBrowse: TcxPageControl
      Width = 722
      Height = 339
      ExplicitWidth = 722
      ExplicitHeight = 339
      ClientRectBottom = 338
      ClientRectRight = 721
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 720
        ExplicitHeight = 337
        inherited cxGrid: TcxGrid
          Width = 720
          Height = 337
          ExplicitWidth = 720
          ExplicitHeight = 337
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'JURNAL_ID'
              Visible = False
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NOMOR JURNAL'
              DataBinding.FieldName = 'JUR_NO'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'DEBET'
              DataBinding.FieldName = 'JUR_DEBET'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'CREDIT'
              DataBinding.FieldName = 'JUR_CREDIT'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'TANGGAL JURNAL'
              DataBinding.FieldName = 'JUR_DATE'
            end
            object cxGridViewColumn6: TcxGridDBColumn
              Caption = 'DESKRIPSI'
              DataBinding.FieldName = 'JUR_DESCRIPTION'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 724
    ExplicitWidth = 724
    inherited lblHeader: TLabel
      Width = 34
      Caption = 'Jurnal'
      ExplicitWidth = 34
    end
    inherited lblFilterData: TcxLabel
      Left = 370
      Visible = True
      ExplicitLeft = 370
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 431
      Visible = True
      ExplicitLeft = 431
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 547
      Visible = True
      ExplicitLeft = 547
    end
    inherited btnSearch: TcxButton
      Left = 642
      ExplicitLeft = 642
    end
    inherited lblsdFilter: TcxLabel
      Left = 523
      Visible = True
      ExplicitLeft = 523
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 374
    Width = 724
    ExplicitTop = 374
    ExplicitWidth = 724
    inherited pnlFooter: TPanel
      Width = 724
      ExplicitWidth = 724
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
        Left = 647
        Action = actClose
        ExplicitLeft = 647
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 724
      ExplicitWidth = 724
      inherited lbEscape: TLabel
        Left = 650
        ExplicitLeft = 650
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
