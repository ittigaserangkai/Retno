inherited frmListQuotMailer: TfrmListQuotMailer
  Left = 275
  Top = 143
  ActiveControl = nil
  Caption = 'Listing Quotation Mailer'
  ClientHeight = 487
  ClientWidth = 682
  ExplicitWidth = 698
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 682
    Height = 398
    ExplicitWidth = 682
    ExplicitHeight = 398
    inherited pgcBrowse: TcxPageControl
      Width = 660
      Height = 266
      ClientRectBottom = 265
      ClientRectRight = 659
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 658
        inherited lbl9: TLabel
          Width = 658
        end
        inherited lbl2: TLabel
          Width = 658
        end
        inherited cxGrid: TcxGrid
          Width = 658
        end
        inherited cxgrdDetail: TcxGrid
          Width = 658
          Height = 149
        end
      end
    end
    inherited pnlTop: TPanel
      Width = 660
      ExplicitWidth = 660
      inherited lbl8: TLabel
        Left = 504
        Top = 81
        Visible = False
        ExplicitLeft = 504
        ExplicitTop = 81
      end
      inherited lbl1: TLabel
        Left = 222
        Top = 80
        Visible = False
        ExplicitLeft = 222
        ExplicitTop = 80
      end
      inherited lbl6: TLabel
        Top = 19
        ExplicitTop = 19
      end
      inherited lbl10: TLabel
        Top = 21
        ExplicitTop = 21
      end
      inherited btnShowList: TcxButton
        Top = 63
        ExplicitTop = 63
      end
      inherited dtTgl1: TcxDateEdit
        Top = 20
        ExplicitTop = 20
      end
      inherited dtTgl2: TcxDateEdit
        Top = 20
        ExplicitTop = 20
      end
      inherited edtKodeSup1: TcxButtonEdit
        Left = 311
        Top = 80
        Visible = False
        ExplicitLeft = 311
        ExplicitTop = 80
      end
      inherited edtKodeSup2: TcxButtonEdit
        Left = 527
        Top = 80
        Visible = False
        ExplicitLeft = 527
        ExplicitTop = 80
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 682
    ExplicitWidth = 682
    inherited lblHeader: TLabel
      Width = 150
      Caption = 'LISTING QUOTATION MAILER'
      ExplicitWidth = 150
    end
    inherited lblFilterData: TcxLabel
      Left = 328
      ExplicitLeft = 328
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 389
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 505
    end
    inherited btnSearch: TcxButton
      Left = 600
    end
    inherited lblsdFilter: TcxLabel
      Left = 481
      ExplicitLeft = 481
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 431
    Width = 682
    inherited pnlFooter: TPanel
      Width = 682
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
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 682
      inherited lbEscape: TLabel
        Left = 608
        Height = 17
      end
    end
  end
end
