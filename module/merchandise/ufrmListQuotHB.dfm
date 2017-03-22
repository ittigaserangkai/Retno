inherited frmListQuotHB: TfrmListQuotHB
  Caption = 'frmListQuotHB'
  ClientHeight = 492
  ClientWidth = 642
  ExplicitWidth = 658
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 642
    Height = 403
    ExplicitWidth = 642
    ExplicitHeight = 403
    inherited pgcBrowse: TcxPageControl
      Width = 620
      Height = 271
      ExplicitWidth = 620
      ExplicitHeight = 271
      ClientRectBottom = 270
      ClientRectRight = 619
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 618
        ExplicitHeight = 269
        inherited lbl9: TLabel
          Width = 618
        end
        inherited lbl2: TLabel
          Width = 618
        end
        inherited cxGrid: TcxGrid
          Width = 618
          ExplicitWidth = 618
        end
        inherited cxgrdDetail: TcxGrid
          Width = 618
          Height = 154
          ExplicitTop = 115
          ExplicitWidth = 618
          ExplicitHeight = 154
        end
      end
    end
    inherited pnlTop: TPanel
      Width = 620
      ExplicitWidth = 620
    end
  end
  inherited pnlHeader: TPanel
    Width = 642
    ExplicitWidth = 642
    inherited lblHeader: TLabel
      Width = 155
      Caption = 'LIST QUOTATION HARGA BELI'
      ExplicitWidth = 155
    end
    inherited lblFilterData: TcxLabel
      Left = 288
      ExplicitLeft = 288
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 349
      ExplicitLeft = 349
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 465
      ExplicitLeft = 465
    end
    inherited btnSearch: TcxButton
      Left = 560
      ExplicitLeft = 560
    end
    inherited lblsdFilter: TcxLabel
      Left = 441
      ExplicitLeft = 441
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 436
    Width = 642
    ExplicitTop = 436
    ExplicitWidth = 642
    inherited pnlFooter: TPanel
      Width = 642
      ExplicitWidth = 642
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
        Left = 565
        Action = actClose
        ExplicitLeft = 565
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 642
      ExplicitWidth = 642
      inherited lbEscape: TLabel
        Left = 568
        Height = 17
        ExplicitLeft = 568
      end
    end
  end
end
