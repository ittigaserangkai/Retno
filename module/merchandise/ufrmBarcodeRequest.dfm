inherited frmBarcodeRequest: TfrmBarcodeRequest
  Left = 240
  Top = 165
  Caption = 'Barcode Label Requestition'
  ClientHeight = 405
  ClientWidth = 874
  OldCreateOrder = True
  ExplicitWidth = 890
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 874
    Height = 316
    ExplicitWidth = 612
    ExplicitHeight = 316
    inherited pgcBrowse: TcxPageControl
      Width = 872
      Height = 314
      ExplicitTop = 126
      ExplicitWidth = 610
      ExplicitHeight = 189
      ClientRectBottom = 313
      ClientRectRight = 871
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 608
        ExplicitHeight = 187
        inherited cxGrid: TcxGrid
          Width = 870
          Height = 312
          ExplicitWidth = 608
          ExplicitHeight = 187
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 874
    ExplicitWidth = 612
    inherited lblHeader: TLabel
      Width = 102
      Caption = 'BARCODE REQUEST'
      ExplicitWidth = 102
    end
    inherited lblFilterData: TcxLabel
      Left = 520
      Visible = True
      ExplicitLeft = 258
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 581
      Visible = True
      ExplicitLeft = 319
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 697
      Visible = True
      ExplicitLeft = 435
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 792
      ExplicitLeft = 530
    end
    inherited lblsdFilter: TcxLabel
      Left = 673
      Visible = True
      ExplicitLeft = 411
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 349
    Width = 874
    ExplicitTop = 349
    ExplicitWidth = 612
    inherited pnlFooter: TPanel
      Width = 874
      ExplicitWidth = 612
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
        Left = 797
        Action = actClose
        ExplicitLeft = 535
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 874
      ExplicitWidth = 612
      inherited lbEscape: TLabel
        Left = 800
        Height = 17
        ExplicitLeft = 538
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
    object actAddRow: TAction
      Caption = '&Show'
      ImageIndex = 18
    end
  end
end
