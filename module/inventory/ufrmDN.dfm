inherited frmDN: TfrmDN
  Caption = 'frmDN'
  ClientHeight = 389
  ClientWidth = 710
  ExplicitWidth = 726
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 710
    Height = 300
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 708
      Height = 298
      ExplicitWidth = 122
      ClientRectBottom = 297
      ClientRectRight = 707
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 120
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 706
          Height = 296
          ExplicitWidth = 120
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 710
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 356
      Visible = True
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 417
      Visible = True
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 533
      Visible = True
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 628
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 509
      Visible = True
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 333
    Width = 710
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 710
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
        Left = 633
        Action = actClose
        ExplicitLeft = 47
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 710
      ExplicitWidth = 124
      inherited lbEscape: TLabel
        Left = 636
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
