inherited frmBankCashOut: TfrmBankCashOut
  Caption = 'Bank Cash Out'
  ClientHeight = 429
  ClientWidth = 857
  ExplicitTop = 2
  ExplicitWidth = 873
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 857
    Height = 340
    ExplicitWidth = 857
    ExplicitHeight = 340
    inherited pgcBrowse: TcxPageControl
      Width = 855
      Height = 338
      ExplicitWidth = 855
      ExplicitHeight = 338
      ClientRectBottom = 337
      ClientRectRight = 854
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 853
        ExplicitHeight = 336
        inherited cxGrid: TcxGrid
          Width = 853
          Height = 336
          ExplicitWidth = 853
          ExplicitHeight = 336
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 857
    ExplicitWidth = 857
    inherited lblHeader: TLabel
      Width = 80
      Caption = 'Bank Cash Out'
      ExplicitWidth = 80
    end
    inherited lblFilterData: TcxLabel
      Left = 503
      Visible = True
      ExplicitLeft = 503
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 564
      Visible = True
      ExplicitLeft = 564
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 680
      Visible = True
      ExplicitLeft = 680
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 775
      ExplicitLeft = 775
    end
    inherited lblsdFilter: TcxLabel
      Left = 656
      Visible = True
      ExplicitLeft = 656
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 373
    Width = 857
    ExplicitTop = 373
    ExplicitWidth = 857
    inherited pnlFooter: TPanel
      Width = 857
      ExplicitWidth = 857
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
        Left = 780
        Action = actClose
        ExplicitLeft = 780
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 857
      ExplicitWidth = 857
      inherited lbEscape: TLabel
        Left = 783
        Height = 17
        ExplicitLeft = 783
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 744
    Top = 200
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
  object pmPrint: TPopupMenu
    Alignment = paCenter
    Left = 178
    Top = 123
    object CetakBatch1: TMenuItem
      Caption = 'Cetak Slip Payment :'#13#10#13#10
    end
    object CetakBatch2: TMenuItem
      Caption = 'Cetak Batch'
    end
  end
end
