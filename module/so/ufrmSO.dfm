inherited frmSO: TfrmSO
  Caption = 'Suggestion Order'
  ClientHeight = 362
  ClientWidth = 671
  ExplicitWidth = 687
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 671
    Height = 273
    ExplicitWidth = 664
    ExplicitHeight = 256
    inherited pgcBrowse: TcxPageControl
      Width = 649
      Height = 251
      ExplicitWidth = 642
      ExplicitHeight = 234
      ClientRectBottom = 250
      ClientRectRight = 648
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 640
        ExplicitHeight = 232
        inherited cxGrid: TcxGrid
          Width = 647
          Height = 249
          ExplicitWidth = 640
          ExplicitHeight = 232
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 671
    ExplicitWidth = 664
    inherited lblHeader: TLabel
      Width = 106
      Caption = 'SUGGESTION ORDER'
      ExplicitWidth = 106
    end
    inherited lblFilterData: TcxLabel
      Left = 317
      Visible = True
      ExplicitLeft = 310
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 378
      Visible = True
      ExplicitLeft = 371
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 494
      Visible = True
      ExplicitLeft = 487
    end
    inherited btnSearch: TcxButton
      Left = 589
      ExplicitLeft = 582
    end
    inherited lblsdFilter: TcxLabel
      Left = 470
      Visible = True
      ExplicitLeft = 463
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 306
    Width = 671
    ExplicitTop = 289
    ExplicitWidth = 664
    inherited pnlFooter: TPanel
      Width = 671
      ExplicitWidth = 664
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
        Left = 594
        Action = actClose
        ExplicitLeft = 587
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 671
      ExplicitWidth = 664
      inherited lbEscape: TLabel
        Left = 597
        ExplicitLeft = 590
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
