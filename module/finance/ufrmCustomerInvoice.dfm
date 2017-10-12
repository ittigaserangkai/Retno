inherited frmCustomerInvoice: TfrmCustomerInvoice
  Caption = 'Customer Invoice'
  ClientHeight = 340
  ClientWidth = 588
  ExplicitWidth = 604
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 588
    Height = 251
    ExplicitWidth = 120
    inherited pgcBrowse: TcxPageControl
      Width = 586
      Height = 249
      ExplicitWidth = 118
      ClientRectBottom = 248
      ClientRectRight = 585
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 584
          Height = 247
          ExplicitWidth = 116
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 588
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 106
      Caption = 'CUSTOMER INVOICE'
      ExplicitWidth = 106
    end
    inherited lblFilterData: TcxLabel
      Left = 234
      Visible = True
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 295
      Visible = True
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 411
      Visible = True
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 506
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 387
      Visible = True
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 284
    Width = 588
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 588
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
        Left = 511
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 588
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 514
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
