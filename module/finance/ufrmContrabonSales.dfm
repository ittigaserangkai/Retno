inherited frmContrabonSales: TfrmContrabonSales
  Caption = 'Contrabon Sales'
  ClientHeight = 364
  ClientWidth = 685
  ExplicitWidth = 701
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 685
    Height = 275
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 683
      Height = 273
      ExplicitWidth = 122
      ClientRectBottom = 272
      ClientRectRight = 682
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 120
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 681
          Height = 271
          ExplicitWidth = 120
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 685
    ExplicitWidth = 124
    inherited lblHeader: TLabel
      Width = 108
      Caption = 'CONTRA BON SALES'
      ExplicitWidth = 108
    end
    inherited lblFilterData: TcxLabel
      Left = 331
      Visible = True
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 392
      Visible = True
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 508
      Visible = True
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 603
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 484
      Visible = True
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 308
    Width = 685
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 685
      ExplicitWidth = 124
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
        Left = 608
        Action = actClose
        ExplicitLeft = 47
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 685
      ExplicitWidth = 124
      inherited lbEscape: TLabel
        Left = 611
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
