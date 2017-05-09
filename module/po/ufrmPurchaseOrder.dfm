inherited frmPurchaseOrder: TfrmPurchaseOrder
  Left = 309
  Top = 194
  Caption = 'Purchase Order'
  ClientHeight = 354
  ClientWidth = 779
  OldCreateOrder = True
  ExplicitWidth = 795
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 779
    Height = 265
    BorderWidth = 0
    ExplicitWidth = 763
    ExplicitHeight = 265
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 777
      Height = 263
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 761
      ExplicitHeight = 263
      ClientRectBottom = 262
      ClientRectRight = 776
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 759
        ExplicitHeight = 261
        inherited cxGrid: TcxGrid
          Width = 775
          Height = 261
          RootLevelOptions.DetailTabsPosition = dtpTop
          ExplicitWidth = 759
          ExplicitHeight = 261
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
        object gbCetak: TcxGroupBox
          Left = 143
          Top = 91
          Caption = 'Opsi Cetak'
          TabOrder = 1
          Visible = False
          Height = 110
          Width = 278
          object rbPrintDlg: TcxRadioGroup
            Left = 2
            Top = 21
            Align = alTop
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = 'By Nomor SO'
              end
              item
                Caption = 'By Range Date'
              end>
            ItemIndex = 0
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 42
            Width = 274
          end
          object btnPrint: TcxButton
            AlignWithMargins = True
            Left = 4
            Top = 65
            Width = 270
            Height = 41
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            Caption = 'Cetak'
            OptionsImage.ImageIndex = 28
            OptionsImage.Images = DMClient.imgListButton
            TabOrder = 1
            OnClick = btnPrintClick
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 779
    ExplicitWidth = 763
    inherited lblHeader: TLabel
      Width = 3
      Caption = ''
      ExplicitWidth = 3
    end
    inherited lblFilterData: TcxLabel
      Left = 460
      AutoSize = True
      Caption = 'Periode'
      Visible = True
      ExplicitLeft = 460
      ExplicitWidth = 41
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 504
      TabOrder = 3
      Visible = True
      ExplicitLeft = 488
      ExplicitWidth = 84
      Width = 84
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 612
      TabOrder = 4
      Visible = True
      ExplicitLeft = 596
      ExplicitWidth = 84
      Width = 84
    end
    inherited btnSearch: TcxButton
      Left = 702
      Width = 73
      TabOrder = 7
      ExplicitLeft = 686
      ExplicitWidth = 73
    end
    inherited lblsdFilter: TcxLabel
      Left = 591
      Visible = True
      ExplicitLeft = 575
      ExplicitWidth = 18
      Width = 18
      AnchorY = 17
    end
    object cbbSupMGAkhir: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 368
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 2
      ExplicitLeft = 352
      Width = 89
    end
    object cbbSupMGAwal: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 236
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 1
      ExplicitLeft = 220
      Width = 89
    end
    object lblSupMG: TcxLabel
      AlignWithMargins = True
      Left = 169
      Top = 4
      Align = alRight
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 153
      AnchorY = 17
    end
    object lblStatus: TcxLabel
      AlignWithMargins = True
      Left = 9
      Top = 4
      Align = alRight
      Caption = 'Status'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = -7
      AnchorY = 17
    end
    object cbbStatusPO: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 51
      Top = 4
      Align = alRight
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 0
      ExplicitLeft = 35
      Width = 112
    end
    object lblTo: TcxLabel
      AlignWithMargins = True
      Left = 331
      Top = 4
      Align = alRight
      AutoSize = False
      Caption = ' to '
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 315
      Height = 25
      Width = 31
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 298
    Width = 779
    ExplicitTop = 298
    ExplicitWidth = 763
    inherited pnlFooter: TPanel
      Width = 779
      ExplicitWidth = 763
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
        Left = 702
        Action = actClose
        ExplicitLeft = 686
      end
      inherited cxButton1: TcxButton
        Left = 376
        Action = actExport
        ExplicitLeft = 376
      end
    end
    inherited pnlShortCut: TPanel
      Width = 779
      ExplicitWidth = 763
      inherited lbEscape: TLabel
        Left = 705
        ExplicitLeft = 689
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
