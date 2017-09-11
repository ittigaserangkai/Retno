object frmTransaksiPending: TfrmTransaksiPending
  Left = 527
  Top = 277
  BorderStyle = bsNone
  Caption = 'Transaksi Pending'
  ClientHeight = 316
  ClientWidth = 509
  Color = 13303754
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    509
    316)
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 397
    Top = 279
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close (Esc)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object btnRefresh: TButton
    Left = 277
    Top = 279
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Refresh (F5)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnRefreshClick
  end
  object cxTransaksi: TcxGrid
    Left = 0
    Top = 0
    Width = 509
    Height = 265
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    object sgTransaksi: TcxGridDBTableView
      OnDblClick = sgTransaksiDblClick
      OnKeyDown = sgTransaksiKeyDown
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
      Styles.Background = frmTransaksi.cxStyleGreen
      Styles.ContentEven = DMClient.cxStyleGridEven
      Styles.Header = DMClient.cxStyleGridHeader
      object sgTransaksiColumn1: TcxGridDBColumn
        Caption = 'No'
        OnGetDisplayText = sgTransaksiColumn1GetDisplayText
        Width = 30
      end
    end
    object grdlvlTransaksi: TcxGridLevel
      GridView = sgTransaksi
    end
  end
end
