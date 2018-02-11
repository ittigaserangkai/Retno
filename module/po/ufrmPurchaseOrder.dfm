inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Purchase Order'
  ClientHeight = 447
  ClientWidth = 705
  OldCreateOrder = True
  ExplicitWidth = 721
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 705
    Height = 358
    ExplicitWidth = 705
    ExplicitHeight = 358
    inherited pgcBrowse: TcxPageControl
      Width = 703
      Height = 356
      ExplicitWidth = 703
      ExplicitHeight = 356
      ClientRectBottom = 355
      ClientRectRight = 702
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 701
        ExplicitHeight = 354
        inherited cxGrid: TcxGrid
          Width = 701
          Height = 354
          RootLevelOptions.DetailTabsPosition = dtpTop
          ExplicitWidth = 701
          ExplicitHeight = 354
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
    Width = 705
    ExplicitWidth = 705
    inherited lblHeader: TLabel
      Width = 3
      Caption = ''
      ExplicitWidth = 3
    end
    inherited lblFilterData: TcxLabel
      Left = 386
      AutoSize = True
      Caption = 'Periode'
      Visible = True
      ExplicitLeft = 386
      ExplicitWidth = 41
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 430
      TabOrder = 3
      Visible = True
      ExplicitLeft = 430
      ExplicitWidth = 84
      ExplicitHeight = 23
      Width = 84
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 538
      TabOrder = 4
      Visible = True
      ExplicitLeft = 538
      ExplicitWidth = 84
      ExplicitHeight = 23
      Width = 84
    end
    inherited btnSearch: TcxButton
      Left = 628
      Width = 73
      TabOrder = 7
      ExplicitLeft = 628
      ExplicitWidth = 73
    end
    inherited lblsdFilter: TcxLabel
      Left = 517
      Visible = True
      ExplicitLeft = 517
      ExplicitWidth = 18
      Width = 18
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 294
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 2
      ExplicitHeight = 21
      Width = 89
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 162
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 1
      ExplicitHeight = 21
      Width = 89
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 95
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 35
      AnchorY = 17
    end
    object lblStatus: TcxLabel
      AlignWithMargins = True
      Left = -65
      Top = 4
      Align = alRight
      Caption = 'Status'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = -150
      AnchorY = 17
    end
    object cbbStatusPO: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = -23
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 0
      ExplicitHeight = 21
      Width = 112
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 257
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
    Top = 391
    Width = 705
    ExplicitTop = 391
    ExplicitWidth = 705
    inherited pnlFooter: TPanel
      Width = 705
      ExplicitWidth = 705
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
        Left = 628
        Action = actClose
        ExplicitLeft = 628
      end
      inherited cxButton1: TcxButton
        Left = 376
        Action = actExport
        ExplicitLeft = 376
      end
    end
    inherited pnlShortCut: TPanel
      Width = 705
      ExplicitWidth = 705
      inherited lbEscape: TLabel
        Left = 631
        ExplicitLeft = 631
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
