inherited frmShift: TfrmShift
  Left = 296
  Caption = 'Shift'
  ClientHeight = 364
  ClientWidth = 580
  OldCreateOrder = True
  ExplicitWidth = 596
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 580
    Height = 275
    ExplicitWidth = 580
    ExplicitHeight = 275
    inherited pgcBrowse: TcxPageControl
      Width = 558
      Height = 253
      ExplicitWidth = 558
      ExplicitHeight = 253
      ClientRectBottom = 252
      ClientRectRight = 557
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 556
        ExplicitHeight = 251
        inherited cxGrid: TcxGrid
          Width = 556
          Height = 251
          ExplicitWidth = 556
          ExplicitHeight = 251
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 580
    ExplicitWidth = 580
    inherited lblFilterData: TcxLabel
      Left = 226
      ExplicitLeft = 226
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 287
      ExplicitLeft = 287
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 403
      ExplicitLeft = 403
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 498
      ExplicitLeft = 498
    end
    inherited lblsdFilter: TcxLabel
      Left = 379
      ExplicitLeft = 379
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 308
    Width = 580
    ExplicitTop = 308
    ExplicitWidth = 580
    inherited pnlFooter: TPanel
      Width = 580
      ExplicitWidth = 580
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
        Left = 503
        Action = actClose
        ExplicitLeft = 503
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 580
      ExplicitWidth = 580
      inherited lbEscape: TLabel
        Left = 506
        Height = 17
        ExplicitLeft = 506
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
