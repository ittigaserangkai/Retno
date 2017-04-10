inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Listing Purchase Order'
  ClientHeight = 435
  ClientWidth = 647
  OldCreateOrder = True
  ExplicitWidth = 663
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 647
    Height = 346
    BorderWidth = 0
    ExplicitWidth = 647
    ExplicitHeight = 346
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 73
      Width = 645
      Height = 272
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 73
      ExplicitWidth = 645
      ExplicitHeight = 272
      ClientRectBottom = 271
      ClientRectRight = 644
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 643
        ExplicitHeight = 270
        inherited cxGrid: TcxGrid
          Width = 643
          Height = 270
          ExplicitWidth = 643
          ExplicitHeight = 270
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 645
      Height = 72
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 39
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl4: TLabel
        Left = 15
        Top = 11
        Width = 66
        Height = 16
        Caption = 'Kode Supplier'
      end
      object Label1: TLabel
        Left = 192
        Top = 11
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object edtBtnSuplier1: TcxButtonEdit
        Left = 87
        Top = 11
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        OnKeyPress = edtBtnSuplier1KeyPress
        Width = 95
      end
      object edtBtnSuplier2: TcxButtonEdit
        Left = 210
        Top = 10
        Properties.Buttons = <>
        TabOrder = 1
        Text = '0'
        OnKeyPress = edtBtnSuplier2KeyPress
        Width = 96
      end
      object cboStatusPO: TcxComboBox
        Left = 88
        Top = 38
        TabOrder = 2
        Text = 'cboStatusPO'
        Width = 217
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 647
    ExplicitWidth = 647
    inherited lblHeader: TLabel
      Width = 140
      Caption = 'LISTING PURCHASE ORDER'
      ExplicitWidth = 140
    end
    inherited lblFilterData: TcxLabel
      Left = 293
      Visible = True
      ExplicitLeft = 293
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 354
      Visible = True
      ExplicitLeft = 354
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 470
      Visible = True
      ExplicitLeft = 470
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 565
      ExplicitLeft = 565
    end
    inherited lblsdFilter: TcxLabel
      Left = 446
      Visible = True
      ExplicitLeft = 446
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 379
    Width = 647
    ExplicitTop = 379
    ExplicitWidth = 647
    inherited pnlFooter: TPanel
      Width = 647
      ExplicitWidth = 647
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
        Left = 570
        Action = actClose
        ExplicitLeft = 570
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 647
      ExplicitWidth = 647
      inherited lbEscape: TLabel
        Left = 573
        Height = 17
        ExplicitLeft = 573
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
