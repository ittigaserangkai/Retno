inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Purchase Order'
  ClientHeight = 347
  ClientWidth = 787
  OldCreateOrder = True
  ExplicitWidth = 803
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 787
    Height = 258
    ExplicitWidth = 787
    ExplicitHeight = 258
    inherited pgcBrowse: TcxPageControl
      Width = 785
      Height = 256
      ExplicitWidth = 785
      ExplicitHeight = 256
      ClientRectBottom = 255
      ClientRectRight = 784
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 783
        ExplicitHeight = 254
        inherited cxGrid: TcxGrid
          Width = 783
          Height = 254
          RootLevelOptions.DetailTabsPosition = dtpTop
          ExplicitWidth = 783
          ExplicitHeight = 254
          inherited cxGridView: TcxGridDBTableView
            PopupMenu = pmPO
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
  end
  inherited pnlHeader: TPanel
    Width = 787
    ExplicitWidth = 787
    inherited lblHeader: TLabel
      Width = 3
      Caption = ''
      ExplicitWidth = 3
    end
    inherited lblFilterData: TcxLabel
      Left = 468
      AutoSize = True
      Caption = 'Periode'
      Visible = True
      ExplicitLeft = 468
      ExplicitWidth = 41
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 512
      TabOrder = 3
      Visible = True
      ExplicitLeft = 512
      ExplicitWidth = 84
      ExplicitHeight = 23
      Width = 84
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 620
      TabOrder = 4
      Visible = True
      ExplicitLeft = 620
      ExplicitWidth = 84
      ExplicitHeight = 23
      Width = 84
    end
    inherited btnSearch: TcxButton
      Left = 710
      Width = 73
      TabOrder = 7
      ExplicitLeft = 710
      ExplicitWidth = 73
    end
    inherited lblsdFilter: TcxLabel
      Left = 599
      Visible = True
      ExplicitLeft = 599
      ExplicitWidth = 18
      Width = 18
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 376
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 2
      Width = 89
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 244
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 1
      Width = 89
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 177
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      AnchorY = 17
    end
    object lblStatus: TcxLabel
      AlignWithMargins = True
      Left = 17
      Top = 4
      Align = alRight
      Caption = 'Status'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      AnchorY = 17
    end
    object cbbStatusPO: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 59
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 0
      Width = 112
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 339
      Top = 4
      Align = alRight
      AutoSize = False
      Caption = ' to '
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 25
      Width = 31
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 291
    Width = 787
    ExplicitTop = 291
    ExplicitWidth = 787
    inherited pnlFooter: TPanel
      Width = 787
      ExplicitWidth = 787
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
        Caption = 'Revisi'
        ExplicitLeft = 116
      end
      inherited btnPrint: TcxButton
        Left = 300
        Action = actPrint
        ExplicitLeft = 300
      end
      inherited btnClose: TcxButton
        Left = 710
        Action = actClose
        ExplicitLeft = 710
      end
      inherited cxButton1: TcxButton
        Left = 376
        Action = actExport
        ExplicitLeft = 376
      end
    end
    inherited pnlShortCut: TPanel
      Width = 787
      ExplicitWidth = 787
      inherited lbEscape: TLabel
        Left = 713
        Height = 17
        ExplicitLeft = 713
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      Caption = 'Generate For All'
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  object pmPO: TPopupMenu
    OnPopup = pmPOPopup
    Left = 474
    Top = 131
    object mnGeneratedPO: TMenuItem
      Caption = 'Generated'
      OnClick = mnGeneratedPOClick
    end
    object mnCancelPO: TMenuItem
      Caption = 'Canceled'
      OnClick = mnCancelPOClick
    end
    object mnClosePO: TMenuItem
      Caption = 'Closed'
      OnClick = mnClosePOClick
    end
  end
  object pmPrint: TPopupMenu
    Alignment = paCenter
    OwnerDraw = True
    Left = 202
    Top = 155
    object CetakBatch1: TMenuItem
      Caption = 'Cetak Slip Transaksi'
      OnClick = CetakBatch1Click
    end
    object CetakBatch2: TMenuItem
      Caption = 'Cetak Slip Batch'
      OnClick = CetakBatch2Click
    end
  end
end
