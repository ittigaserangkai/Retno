inherited frmJurnal: TfrmJurnal
  Caption = 'Jurnal'
  ClientWidth = 702
  ExplicitWidth = 718
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 702
    ExplicitWidth = 702
    inherited pgcBrowse: TcxPageControl
      Width = 700
      ExplicitWidth = 700
      ClientRectRight = 699
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 698
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 698
          ExplicitWidth = 698
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
    Width = 702
    ExplicitWidth = 702
    inherited lblHeader: TLabel
      Width = 34
      Caption = 'Jurnal'
      ExplicitWidth = 34
    end
    inherited lblFilterData: TcxLabel
      Left = 348
      Visible = True
      ExplicitLeft = 348
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 409
      Visible = True
      ExplicitLeft = 409
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 525
      Visible = True
      ExplicitLeft = 525
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 620
      ExplicitLeft = 620
    end
    inherited lblsdFilter: TcxLabel
      Left = 501
      Visible = True
      ExplicitLeft = 501
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Width = 702
    ExplicitTop = -56
    ExplicitWidth = 702
    inherited pnlFooter: TPanel
      Width = 702
      ExplicitWidth = 702
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
        Left = 625
        Action = actClose
        ExplicitLeft = 625
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited lbEscape: TLabel
        Left = 628
        Height = 17
        ExplicitLeft = 628
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
