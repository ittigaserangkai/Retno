inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Purchase Order'
  ClientHeight = 354
  ClientWidth = 763
  OldCreateOrder = True
  ExplicitWidth = 779
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 763
    Height = 265
    BorderWidth = 0
    ExplicitWidth = 825
    ExplicitHeight = 346
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 761
      Height = 263
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 823
      ExplicitHeight = 344
      ClientRectBottom = 262
      ClientRectRight = 760
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 821
        ExplicitHeight = 342
        inherited cxGrid: TcxGrid
          Width = 759
          Height = 261
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
    Width = 763
    ExplicitWidth = 825
    inherited lblHeader: TLabel
      Width = 3
      Caption = ''
      ExplicitWidth = 3
    end
    inherited lblFilterData: TcxLabel
      Left = 444
      AutoSize = True
      Caption = 'Periode'
      Visible = True
      ExplicitLeft = 444
      ExplicitWidth = 41
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 488
      TabOrder = 3
      Visible = True
      ExplicitLeft = 550
      ExplicitWidth = 84
      ExplicitHeight = 23
      Width = 84
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 596
      TabOrder = 4
      Visible = True
      ExplicitLeft = 658
      ExplicitWidth = 84
      ExplicitHeight = 23
      Width = 84
    end
    inherited btnSearch: TcxButton
      Left = 686
      Width = 73
      TabOrder = 7
      ExplicitLeft = 748
      ExplicitWidth = 73
    end
    inherited lblsdFilter: TcxLabel
      Left = 575
      Visible = True
      ExplicitLeft = 637
      ExplicitWidth = 18
      Width = 18
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 352
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 2
      ExplicitLeft = 414
      Width = 89
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 220
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 1
      ExplicitLeft = 282
      Width = 89
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 153
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 215
      AnchorY = 17
    end
    object lblStatus: TcxLabel
      AlignWithMargins = True
      Left = -7
      Top = 4
      Align = alRight
      Caption = 'Status'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 55
      AnchorY = 17
    end
    object cbbStatusPO: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 35
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 0
      ExplicitLeft = 97
      Width = 112
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 315
      Top = 4
      Align = alRight
      AutoSize = False
      Caption = ' to '
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 377
      Height = 25
      Width = 31
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 298
    Width = 763
    ExplicitTop = 379
    ExplicitWidth = 825
    inherited pnlFooter: TPanel
      Width = 763
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
        Caption = 'Revisi'
        ExplicitLeft = 116
      end
      inherited btnPrint: TcxButton
        Left = 300
        Action = actPrint
        ExplicitLeft = 300
      end
      inherited btnClose: TcxButton
        Left = 686
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
      Width = 763
      ExplicitWidth = 825
      inherited lbEscape: TLabel
        Left = 689
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
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
