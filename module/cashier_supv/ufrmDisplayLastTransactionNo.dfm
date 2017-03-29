inherited frmDisplayLastTransactionNo: TfrmDisplayLastTransactionNo
  Caption = 'Display Last Transaction No.'
  ClientHeight = 335
  ClientWidth = 535
  OldCreateOrder = True
  ExplicitWidth = 551
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 535
    Height = 246
    BorderWidth = 0
    ExplicitWidth = 535
    ExplicitHeight = 190
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 533
      Height = 244
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 533
      ExplicitHeight = 188
      ClientRectBottom = 243
      ClientRectRight = 532
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 531
        ExplicitHeight = 186
        inherited cxGrid: TcxGrid
          Width = 531
          Height = 242
          ExplicitWidth = 531
          ExplicitHeight = 186
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 535
    ExplicitWidth = 535
    inherited lblFilterData: TcxLabel
      Left = 181
      ExplicitLeft = 181
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 242
      ExplicitLeft = 242
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 358
      ExplicitLeft = 358
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 453
      ExplicitLeft = 453
    end
    inherited lblsdFilter: TcxLabel
      Left = 334
      ExplicitLeft = 334
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 279
    Width = 535
    ExplicitTop = 279
    ExplicitWidth = 535
    inherited pnlFooter: TPanel
      Width = 535
      ExplicitWidth = 535
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
        Left = 458
        Action = actClose
        ExplicitLeft = 458
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 535
      ExplicitWidth = 535
      inherited lbEscape: TLabel
        Left = 461
        Height = 17
      end
    end
  end
end
