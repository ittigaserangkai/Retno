inherited frmCustomerVoucher: TfrmCustomerVoucher
  Left = 334
  Top = 208
  Caption = 'frmCustomerVoucher'
  ClientHeight = 399
  ClientWidth = 621
  OldCreateOrder = True
  ExplicitWidth = 637
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 621
    Height = 310
    ExplicitWidth = 120
    ExplicitHeight = 235
    inherited pgcBrowse: TcxPageControl
      Width = 619
      Height = 308
      ExplicitWidth = 118
      ExplicitHeight = 233
      ClientRectBottom = 307
      ClientRectRight = 618
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 231
        inherited cxGrid: TcxGrid
          Width = 617
          Height = 306
          ExplicitWidth = 116
          ExplicitHeight = 231
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 621
    ExplicitWidth = 621
    inherited lblFilterData: TcxLabel
      Left = 267
      ExplicitLeft = 267
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 328
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 444
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 539
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 420
      ExplicitLeft = 420
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 343
    Width = 621
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 621
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
        Left = 544
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 621
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 547
        ExplicitLeft = 547
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
