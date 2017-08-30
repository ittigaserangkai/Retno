inherited frmSalesReportContrabon: TfrmSalesReportContrabon
  Left = 376
  Top = 67
  Caption = 'Sales Report Contrabon'
  ClientHeight = 445
  ClientWidth = 642
  OldCreateOrder = True
  ExplicitWidth = 658
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 642
    Height = 356
    ExplicitWidth = 642
    ExplicitHeight = 356
    inherited pgcBrowse: TcxPageControl
      Top = 202
      Width = 640
      Height = 153
      TabOrder = 2
      ExplicitTop = 202
      ExplicitWidth = 640
      ExplicitHeight = 153
      ClientRectBottom = 152
      ClientRectRight = 639
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 638
        ExplicitHeight = 151
        inherited cxGrid: TcxGrid
          Width = 638
          Height = 151
          ExplicitWidth = 638
          ExplicitHeight = 151
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 640
      Height = 86
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl3: TLabel
        Left = 16
        Top = 2
        Width = 61
        Height = 16
        Caption = 'Suplier Code'
      end
      object lbl4: TLabel
        Left = 416
        Top = 2
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object lbl5: TLabel
        Left = 16
        Top = 29
        Width = 61
        Height = 16
        Caption = 'Suplier Code'
      end
      object lbl6: TLabel
        Left = 16
        Top = 53
        Width = 23
        Height = 16
        Caption = 'Type'
      end
      object cbpSuplierCodeFrom: TcxExtLookupComboBox
        Left = 82
        Top = 1
        TabOrder = 0
        OnExit = cbpSuplierCodeFromExit
        OnKeyPress = cbpSuplierCodeFromKeyPress
        OnKeyUp = cbpSuplierCodeFromKeyUp
        Width = 111
      end
      object edtsuplierNameFrom: TEdit
        Left = 200
        Top = 1
        Width = 209
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object cbpSuplierCodeTo: TcxExtLookupComboBox
        Left = 82
        Top = 26
        TabOrder = 2
        OnExit = cbpSuplierCodeToExit
        OnKeyPress = cbpSuplierCodeToKeyPress
        OnKeyUp = cbpSuplierCodeToKeyUp
        Width = 111
      end
      object edtSuplierCodeTo: TEdit
        Left = 200
        Top = 26
        Width = 209
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object chkAll: TCheckBox
        Left = 200
        Top = 53
        Width = 97
        Height = 17
        Caption = 'All'
        TabOrder = 4
        OnClick = chkAllClick
      end
      object cbbtipe1: TComboBox
        Left = 82
        Top = 51
        Width = 105
        Height = 24
        BevelKind = bkFlat
        Style = csDropDownList
        TabOrder = 5
      end
    end
    object pnlMiddle: TPanel
      Left = 1
      Top = 87
      Width = 640
      Height = 115
      Align = alTop
      BorderWidth = 5
      Color = 15198183
      TabOrder = 1
      object grp1: TGroupBox
        Left = 6
        Top = 6
        Width = 628
        Height = 103
        Align = alClient
        Caption = 'LIST CONTRABON'
        TabOrder = 0
        object cxgrdSupplier: TcxGrid
          Left = 1
          Top = 17
          Width = 626
          Height = 85
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          object grdSupplier: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            FindPanel.InfoText = 'ketik teks yang dicari...'
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            FilterRow.InfoText = 
              'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
              'er'
            FilterRow.Visible = True
            FilterRow.ApplyChanges = fracImmediately
            NewItemRow.InfoText = 'Baris baru'
            OptionsData.Editing = False
            OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
            OptionsView.GroupByBox = False
            Styles.ContentEven = DMClient.cxStyleGridHeader
            Styles.Header = DMClient.cxStyleGridEven
          end
          object grdlvlSupplier: TcxGridLevel
            GridView = grdSupplier
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 642
    ExplicitWidth = 642
    inherited lblHeader: TLabel
      Width = 150
      Caption = 'SALES REPORT CONTRABON'
      ExplicitWidth = 150
    end
    inherited lblFilterData: TcxLabel
      Left = 288
      Visible = True
      ExplicitLeft = 288
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 349
      Visible = True
      ExplicitLeft = 349
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 465
      Visible = True
      ExplicitLeft = 465
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 560
      ExplicitLeft = 560
    end
    inherited lblsdFilter: TcxLabel
      Left = 441
      Visible = True
      ExplicitLeft = 441
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 389
    Width = 642
    ExplicitTop = 389
    ExplicitWidth = 642
    inherited pnlFooter: TPanel
      Width = 642
      ExplicitWidth = 642
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Caption = 'Print &Detil'
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 565
        Action = actClose
        ExplicitLeft = 565
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 642
      ExplicitWidth = 642
      inherited lbEscape: TLabel
        Left = 568
        Height = 17
        ExplicitLeft = 568
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      Caption = '&Print Rekap'
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
