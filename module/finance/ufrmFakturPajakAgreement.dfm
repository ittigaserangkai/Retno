inherited frmFakturPajakAgreement: TfrmFakturPajakAgreement
  Left = 278
  Top = 108
  Caption = 'Faktur Pajak (Invoice Sewa]'
  ClientHeight = 482
  ClientWidth = 644
  ExplicitWidth = 660
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 644
    Height = 393
    ExplicitWidth = 644
    ExplicitHeight = 393
    inherited pgcBrowse: TcxPageControl
      Top = 226
      Width = 642
      Height = 130
      ExplicitTop = 226
      ExplicitWidth = 642
      ExplicitHeight = 130
      ClientRectBottom = 129
      ClientRectRight = 641
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 640
        ExplicitHeight = 128
        inherited cxGrid: TcxGrid
          Width = 640
          Height = 128
          ExplicitWidth = 640
          ExplicitHeight = 128
        end
      end
    end
    inherited pnlTop: TPanel
      Width = 642
      Height = 225
      ExplicitWidth = 642
      ExplicitHeight = 225
      inherited lbl7: TLabel
        Top = 144
        ExplicitTop = 144
      end
      inherited lbl9: TLabel
        Top = 168
        ExplicitTop = 168
      end
      object Label1: TLabel [12]
        Left = 8
        Top = 192
        Width = 102
        Height = 16
        Caption = 'No Seri Faktur Pajak'
      end
      inherited dtRecv: TcxDateEdit
        Top = 120
        ExplicitTop = 120
      end
      inherited edtInvoiceNo: TEdit
        Top = 144
        ExplicitTop = 144
      end
      inherited edtInvoiceDesc: TEdit
        Top = 168
        Width = 285
        ReadOnly = True
        ExplicitTop = 168
        ExplicitWidth = 285
      end
      inherited edtStatusInvoice: TEdit
        TabOrder = 16
      end
      inherited btnViewInvoice: TcxButton
        Top = 141
        Visible = False
        ExplicitTop = 141
      end
      object edtNoSeri: TEdit
        Left = 125
        Top = 192
        Width = 256
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 15
      end
    end
    inherited pnl1: TPanel
      Top = 356
      Width = 642
      Height = 36
      ExplicitTop = 356
      ExplicitWidth = 642
      ExplicitHeight = 36
      inherited lbl14: TLabel
        Top = 8
        ExplicitTop = 8
      end
      inherited edtDescription: TEdit
        Top = 8
        ExplicitTop = 8
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 644
    ExplicitWidth = 644
    inherited lblHeader: TLabel
      Width = 76
      Caption = 'INVOICE SEWA'
      ExplicitWidth = 76
    end
    inherited lblFilterData: TcxLabel
      Left = 290
      ExplicitLeft = 290
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 351
      ExplicitLeft = 351
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 467
      ExplicitLeft = 467
    end
    inherited btnSearch: TcxButton
      Left = 562
      ExplicitLeft = 562
    end
    inherited lblsdFilter: TcxLabel
      Left = 443
      ExplicitLeft = 443
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 426
    Width = 644
    ExplicitTop = 426
    ExplicitWidth = 644
    inherited pnlFooter: TPanel
      Width = 644
      ExplicitWidth = 644
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
        Left = 567
        Action = actClose
        ExplicitLeft = 567
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 644
      ExplicitWidth = 644
      inherited lbEscape: TLabel
        Left = 570
        ExplicitLeft = 570
      end
    end
  end
end
