inherited frmBarcodeUsage: TfrmBarcodeUsage
  Caption = 'Barcode Usage'
  ClientHeight = 334
  ClientWidth = 654
  ExplicitWidth = 670
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 654
    Height = 245
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 652
      Height = 243
      ExplicitWidth = 118
      ClientRectBottom = 242
      ClientRectRight = 651
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 650
          Height = 241
          ExplicitWidth = 116
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 654
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 90
      Caption = 'BARCODE USAGE'
      ExplicitWidth = 90
    end
    inherited lblFilterData: TcxLabel
      Left = 300
      Visible = True
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 361
      Visible = True
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 477
      Visible = True
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 572
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 453
      Visible = True
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 278
    Width = 654
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 654
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
        Left = 577
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 654
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 580
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
