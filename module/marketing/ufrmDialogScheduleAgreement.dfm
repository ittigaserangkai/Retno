inherited frmDialogScheduleAgreement: TfrmDialogScheduleAgreement
  Left = 302
  Top = 212
  Caption = 'frmDialogScheduleAgreement'
  ClientHeight = 314
  ClientWidth = 677
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 693
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 677
    Height = 258
    ExplicitWidth = 679
    ExplicitHeight = 284
    object pnl2: TPanel
      Left = 2
      Top = 215
      Width = 673
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitTop = 241
      ExplicitWidth = 675
      object lbl5: TLabel
        Left = 15
        Top = 8
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl2: TLabel
        Left = 417
        Top = 8
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object edtDescription: TEdit
        Left = 84
        Top = 6
        Width = 289
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object curredtTotal: TcxCurrencyEdit
        Left = 456
        Top = 8
        TabOrder = 1
        Width = 145
      end
    end
    object pcMasterAgreement2: TcxPageControl
      Left = 2
      Top = 2
      Width = 673
      Height = 213
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tsJadwalInvoice
      Properties.CustomButtons.Buttons = <>
      ExplicitLeft = 11
      ExplicitTop = 209
      ExplicitWidth = 736
      ExplicitHeight = 150
      ClientRectBottom = 213
      ClientRectRight = 673
      ClientRectTop = 27
      object tsJadwalInvoice: TcxTabSheet
        Caption = 'F3 - Invoice Schedule'
        ImageIndex = 1
        object cxgrd1: TcxGrid
          Left = 0
          Top = 0
          Width = 673
          Height = 186
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          object grdInvoice: TcxGridDBTableView
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
            Styles.ContentEven = DMClient.cxStyleGridEven
            Styles.Header = DMClient.cxStyleGridHeader
            object cxcol1: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcol2: TcxGridDBColumn
              Caption = 'Invoice Date'
            end
            object cxcol3: TcxGridDBColumn
              Caption = 'Invoice Term(s)'
            end
            object cxcol4: TcxGridDBColumn
              Caption = 'Invoice No'
            end
            object cxcol5: TcxGridDBColumn
              Caption = 'Invoice DueDate'
            end
            object cxcol6: TcxGridDBColumn
              Caption = 'Status'
            end
            object cxcol7: TcxGridDBColumn
              Caption = 'Total Invoice'
            end
          end
          object grdlvlMaster1: TcxGridLevel
            GridView = grdInvoice
          end
        end
      end
      object tsJadwalAccrual: TcxTabSheet
        Caption = 'F4 - Accrual Schedule'
        ImageIndex = 2
        ExplicitLeft = 48
        ExplicitTop = 3
        ExplicitWidth = 289
        ExplicitHeight = 166
        object cxgrd2: TcxGrid
          Left = 0
          Top = 0
          Width = 736
          Height = 123
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitLeft = 112
          ExplicitTop = -16
          ExplicitWidth = 369
          ExplicitHeight = 206
          object grdAccrual: TcxGridDBTableView
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
            Styles.ContentEven = DMClient.cxStyleGridEven
            Styles.Header = DMClient.cxStyleGridHeader
            object cxcol8: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcol9: TcxGridDBColumn
              Caption = 'Accrual Date'
            end
            object cxcol10: TcxGridDBColumn
              Caption = 'Periode'
            end
            object cxcol11: TcxGridDBColumn
              Caption = 'Accual No'
            end
            object cxcol12: TcxGridDBColumn
              Caption = 'Status'
            end
            object cxcol13: TcxGridDBColumn
              Caption = 'Total Accrual'
            end
          end
          object grdlvlMaster2: TcxGridLevel
            GridView = grdAccrual
          end
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 258
    Width = 677
    ExplicitTop = 284
    ExplicitWidth = 679
    inherited pnlFooter: TPanel
      Width = 677
      ExplicitWidth = 679
      inherited btnClose: TcxButton
        Left = 600
        Action = actCancel
        ExplicitLeft = 602
      end
      inherited btnSave: TcxButton
        Left = 507
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 509
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 430
        Action = actPrint
        ExplicitLeft = 432
      end
    end
    inherited pnlSortCut: TPanel
      Width = 677
      ExplicitWidth = 679
      inherited lbCTRLEnter: TLabel
        Left = 502
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 593
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 426
        Height = 15
      end
    end
  end
end
