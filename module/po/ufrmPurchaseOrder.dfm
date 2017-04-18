inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Purchase Order'
  ClientHeight = 435
  ClientWidth = 647
  OldCreateOrder = True
  ExplicitTop = -91
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
      Top = 41
      Width = 645
      Height = 304
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 73
      ExplicitWidth = 645
      ExplicitHeight = 272
      ClientRectBottom = 303
      ClientRectRight = 644
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 643
        ExplicitHeight = 270
        inherited cxGrid: TcxGrid
          Width = 643
          Height = 302
          RootLevelOptions.DetailTabsPosition = dtpTop
          ExplicitWidth = 643
          ExplicitHeight = 270
          inherited cxGridView: TcxGridDBTableView
            DataController.OnDetailExpanded = cxGridViewDataControllerDetailExpanded
          end
          object cxGridDBTableSODetail: TcxGridDBTableView [1]
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Styles.ContentEven = DMClient.cxStyleGridEven
            Styles.Header = DMClient.cxStyleGridHeader
          end
          inherited cxlvMaster: TcxGridLevel
            object cxgrdlvlPODetail: TcxGridLevel
              GridView = cxGridDBTableSODetail
            end
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 645
      Height = 40
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 339
        Top = 10
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl4: TLabel
        Left = 14
        Top = 10
        Width = 66
        Height = 16
        Caption = 'Kode Supplier'
      end
      object Label1: TLabel
        Left = 186
        Top = 10
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object edtBtnSuplier1: TcxButtonEdit
        Left = 87
        Top = 6
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        OnKeyPress = edtBtnSuplier1KeyPress
        Width = 95
      end
      object edtBtnSuplier2: TcxButtonEdit
        Left = 201
        Top = 6
        Properties.Buttons = <>
        TabOrder = 1
        Text = '0'
        OnKeyPress = edtBtnSuplier2KeyPress
        Width = 96
      end
      object cboStatusPO: TcxComboBox
        Left = 385
        Top = 6
        TabOrder = 2
        Text = 'cboStatusPO'
        Width = 219
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 647
    ExplicitWidth = 647
    inherited lblHeader: TLabel
      Width = 95
      Caption = 'PURCHASE ORDER'
      ExplicitWidth = 95
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
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 470
      Visible = True
      ExplicitLeft = 470
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
      inherited bvlSeparator: TBevel
        Left = 286
        ExplicitLeft = 286
      end
      inherited btnAdd: TcxButton
        Width = 108
        Action = actAdd
        ExplicitWidth = 108
      end
      inherited btnUpdate: TcxButton
        Left = 116
        Action = actEdit
        ExplicitLeft = 116
      end
      inherited btnPrint: TcxButton
        Left = 300
        Action = actPrint
        ExplicitLeft = 300
      end
      inherited btnClose: TcxButton
        Left = 570
        Action = actClose
        ExplicitLeft = 570
      end
      inherited cxButton1: TcxButton
        Left = 376
        Action = actExport
        ExplicitLeft = 376
      end
    end
    inherited pnlShortCut: TPanel
      Width = 647
      ExplicitWidth = 647
      inherited lbEscape: TLabel
        Left = 573
        ExplicitLeft = 573
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      Caption = 'Generate For All'
      OnExecute = actAddExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
