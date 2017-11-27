inherited frmReprintNota: TfrmReprintNota
  Left = 501
  Top = 97
  Caption = 'REPRINT NOTA'
  ClientHeight = 438
  ClientWidth = 747
  OldCreateOrder = True
  ExplicitTop = -13
  ExplicitWidth = 763
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 41
    Width = 747
    Height = 341
    BorderWidth = 5
    ExplicitWidth = 747
    ExplicitHeight = 349
    inherited pgcBrowse: TcxPageControl
      Left = 6
      Top = 6
      Width = 735
      Height = 329
      ExplicitLeft = 6
      ExplicitTop = 6
      ExplicitWidth = 735
      ExplicitHeight = 337
      ClientRectBottom = 328
      ClientRectRight = 734
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 733
        ExplicitHeight = 335
        inherited cxGrid: TcxGrid
          Width = 733
          Height = 327
          ExplicitWidth = 733
          ExplicitHeight = 335
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 747
    Height = 41
    ExplicitWidth = 747
    ExplicitHeight = 41
    inherited lblHeader: TLabel
      Width = 203
      Height = 29
      Caption = 'REPRINT NOTA'
      ExplicitWidth = 203
      ExplicitHeight = 61
    end
    inherited lblFilterData: TcxLabel
      Left = 393
      Visible = True
      ExplicitLeft = 393
      Height = 39
      AnchorY = 21
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 454
      Visible = True
      ExplicitLeft = 454
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 570
      Visible = True
      ExplicitLeft = 570
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 665
      Height = 35
      ExplicitLeft = 665
    end
    inherited lblsdFilter: TcxLabel
      Left = 546
      Visible = True
      ExplicitLeft = 546
      Height = 33
      AnchorY = 21
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 382
    Width = 747
    ExplicitTop = 382
    ExplicitWidth = 747
    inherited pnlFooter: TPanel
      Width = 747
      ExplicitWidth = 747
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
        Left = 670
        Action = actClose
        ExplicitLeft = 670
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 747
      ExplicitWidth = 747
      inherited lbEscape: TLabel
        Left = 673
        Height = 17
        ExplicitLeft = 673
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 544
    Top = 176
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
