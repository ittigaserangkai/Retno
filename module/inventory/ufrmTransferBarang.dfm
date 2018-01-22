inherited frmTransferBarang: TfrmTransferBarang
  Caption = 'Transfer Barang'
  ClientHeight = 323
  ClientWidth = 647
  ExplicitWidth = 663
  ExplicitHeight = 362
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 647
    Height = 234
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 645
      Height = 232
      ExplicitWidth = 118
      ClientRectBottom = 231
      ClientRectRight = 644
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 643
          Height = 230
          ExplicitWidth = 116
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 647
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 88
      Caption = 'Transfer Barang'
      ExplicitWidth = 88
    end
    inherited lblFilterData: TcxLabel
      Left = 293
      Visible = True
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 354
      Visible = True
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 470
      Visible = True
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 565
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 446
      Visible = True
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 267
    Width = 647
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 647
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
        Left = 570
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 647
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 573
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
