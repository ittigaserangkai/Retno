object frmTransaksiPending: TfrmTransaksiPending
  Left = 527
  Top = 277
  BorderStyle = bsNone
  Caption = 'Transaksi Pending'
  ClientHeight = 358
  ClientWidth = 572
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
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    AlignWithMargins = True
    Left = 472
    Top = 310
    Width = 97
    Height = 45
    Align = alRight
    Cancel = True
    Caption = 'Close (Esc)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnCloseClick
    ExplicitLeft = 409
    ExplicitTop = 268
  end
  object btnRefresh: TButton
    AlignWithMargins = True
    Left = 369
    Top = 310
    Width = 97
    Height = 45
    Align = alRight
    Cancel = True
    Caption = 'Refresh (F5)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnRefreshClick
    ExplicitLeft = 306
    ExplicitTop = 268
  end
  object cxTransaksi: TcxGrid
    Left = 0
    Top = 0
    Width = 572
    Height = 307
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    ExplicitWidth = 509
    ExplicitHeight = 265
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
