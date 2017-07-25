inherited frmCN: TfrmCN
  Caption = 'CN Receiving'
  ClientHeight = 426
  ClientWidth = 783
  ExplicitWidth = 799
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 783
    Height = 337
    ExplicitWidth = 783
    ExplicitHeight = 309
    inherited pgcBrowse: TcxPageControl
      Width = 761
      Height = 315
      ExplicitWidth = 761
      ExplicitHeight = 287
      ClientRectBottom = 314
      ClientRectRight = 760
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 759
        ExplicitHeight = 285
        inherited cxGrid: TcxGrid
          Width = 759
          Height = 313
          ExplicitWidth = 759
          ExplicitHeight = 285
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 783
    ExplicitWidth = 783
    inherited lblHeader: TLabel
      Width = 71
      Caption = 'CN Receiving'
      ExplicitWidth = 71
    end
    inherited lblFilterData: TcxLabel
      Left = 429
      Visible = True
      ExplicitLeft = 429
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 490
      Visible = True
      ExplicitLeft = 490
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 606
      Visible = True
      ExplicitLeft = 606
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 701
      ExplicitLeft = 701
    end
    inherited lblsdFilter: TcxLabel
      Left = 582
      Visible = True
      ExplicitLeft = 582
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 370
    Width = 783
    ExplicitTop = 342
    ExplicitWidth = 783
    inherited pnlFooter: TPanel
      Width = 783
      ExplicitWidth = 783
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
        Left = 706
        Action = actClose
        ExplicitLeft = 706
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 783
      ExplicitWidth = 783
      inherited lbEscape: TLabel
        Left = 709
        Height = 17
        ExplicitLeft = 709
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
