inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Purchase Order'
  ClientHeight = 435
  ClientWidth = 825
  OldCreateOrder = True
  ExplicitLeft = -74
  ExplicitWidth = 841
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 825
    Height = 346
    BorderWidth = 0
    ExplicitWidth = 825
    ExplicitHeight = 346
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 823
      Height = 344
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 823
      ExplicitHeight = 344
      ClientRectBottom = 343
      ClientRectRight = 822
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 821
        ExplicitHeight = 342
        inherited cxGrid: TcxGrid
          Width = 821
          Height = 342
          RootLevelOptions.DetailTabsPosition = dtpTop
          ExplicitWidth = 821
          ExplicitHeight = 342
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
    Width = 825
    ExplicitWidth = 825
    inherited lblHeader: TLabel
      Width = 3
      Caption = ''
      ExplicitWidth = 3
    end
    inherited lblFilterData: TcxLabel
      Left = 506
      AutoSize = True
      Caption = 'Periode'
      Visible = True
      ExplicitLeft = 506
      ExplicitWidth = 41
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 550
      TabOrder = 3
      Visible = True
      ExplicitLeft = 562
      ExplicitWidth = 84
      Width = 84
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 658
      TabOrder = 4
      Visible = True
      ExplicitLeft = 670
      ExplicitWidth = 84
      Width = 84
    end
    inherited btnSearch: TcxButton
      Left = 748
      Width = 73
      TabOrder = 7
      ExplicitLeft = 748
      ExplicitWidth = 73
    end
    inherited lblsdFilter: TcxLabel
      Left = 637
      Visible = True
      ExplicitLeft = 649
      ExplicitWidth = 18
      Width = 18
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 414
      Top = 4
      Align = alRight
      TabOrder = 2
      ExplicitLeft = 426
      Width = 89
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 282
      Top = 4
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 294
      Width = 89
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 215
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 227
      AnchorY = 17
    end
    object lblStatus: TcxLabel
      AlignWithMargins = True
      Left = 55
      Top = 4
      Align = alRight
      Caption = 'Status'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 67
      AnchorY = 17
    end
    object cbbStatusPO: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 97
      Top = 4
      Align = alRight
      TabOrder = 0
      ExplicitLeft = 109
      Width = 112
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 377
      Top = 4
      Align = alRight
      AutoSize = False
      Caption = ' to '
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 389
      Height = 25
      Width = 31
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 379
    Width = 825
    ExplicitTop = 379
    ExplicitWidth = 825
    inherited pnlFooter: TPanel
      Width = 825
      ExplicitWidth = 825
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
        Left = 748
        Action = actClose
        ExplicitLeft = 748
      end
      inherited cxButton1: TcxButton
        Left = 376
        Action = actExport
        ExplicitLeft = 376
      end
    end
    inherited pnlShortCut: TPanel
      Width = 825
      ExplicitWidth = 825
      inherited lbEscape: TLabel
        Left = 751
        Height = 17
        ExplicitLeft = 751
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
