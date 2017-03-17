inherited frmLokasi: TfrmLokasi
  Left = 336
  Top = 287
  Caption = 'Location'
  ClientHeight = 341
  ClientWidth = 540
  OldCreateOrder = True
  ExplicitWidth = 556
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 540
    Height = 252
    ExplicitWidth = 540
    ExplicitHeight = 252
    inherited pgcBrowse: TcxPageControl
      Width = 518
      Height = 230
      ExplicitWidth = 518
      ExplicitHeight = 230
      ClientRectBottom = 229
      ClientRectRight = 517
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          Width = 516
          Height = 228
          ExplicitWidth = 516
          ExplicitHeight = 228
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 540
    ExplicitWidth = 540
    inherited lblFilterData: TcxLabel
      Left = 186
      ExplicitLeft = 186
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 247
      ExplicitLeft = 247
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 363
      ExplicitLeft = 363
    end
    inherited btnSearch: TcxButton
      Left = 458
      ExplicitLeft = 458
    end
    inherited lblsdFilter: TcxLabel
      Left = 339
      ExplicitLeft = 339
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 285
    Width = 540
    ExplicitTop = 285
    ExplicitWidth = 540
    inherited pnlFooter: TPanel
      Width = 540
      ExplicitWidth = 540
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
        Left = 463
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 540
      ExplicitWidth = 540
      inherited lbEscape: TLabel
        Left = 466
        Height = 17
        ExplicitLeft = 466
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
