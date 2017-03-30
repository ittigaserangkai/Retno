inherited frmListPOCancel: TfrmListPOCancel
  Left = 286
  Caption = 'frmListPOCancel'
  ClientHeight = 436
  ExplicitWidth = 320
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 347
    ExplicitWidth = 120
    ExplicitHeight = 347
    inherited pgcBrowse: TcxPageControl
      Height = 273
      ExplicitTop = 73
      ExplicitWidth = 118
      ExplicitHeight = 272
      ClientRectBottom = 272
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 116
        ExplicitHeight = 270
        inherited cxGrid: TcxGrid
          Height = 271
          ExplicitWidth = 116
          ExplicitHeight = 270
        end
      end
    end
    inherited Panel1: TPanel
      ExplicitWidth = 118
      inherited edtBtnSuplier1: TcxButtonEdit
        ExplicitHeight = 24
      end
      inherited edtBtnSuplier2: TcxButtonEdit
        ExplicitHeight = 24
      end
      inherited cboStatusPO: TcxComboBox
        Text = '1 2 sdsd'
        ExplicitHeight = 24
      end
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeader: TLabel
      Width = 216
      Caption = 'LISTING PEMBATALAN PURCHASE ORDER'
      ExplicitWidth = 216
    end
    inherited lblFilterData: TcxLabel
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      ExplicitLeft = -173
      ExplicitHeight = 21
    end
    inherited dtAkhirFilter: TcxDateEdit
      ExplicitLeft = -57
      ExplicitHeight = 21
    end
    inherited btnSearch: TcxButton
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 380
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
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
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      ExplicitWidth = 120
    end
  end
end
