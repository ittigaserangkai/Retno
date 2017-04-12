object frmLookupBarang: TfrmLookupBarang
  Left = 300
  Top = 90
  BorderStyle = bsNone
  Caption = 'Lookup Barang'
  ClientHeight = 316
  ClientWidth = 509
  Color = 13303754
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 87
    Top = 216
    Width = 97
    Height = 25
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
  object cxgrdBarang: TcxGrid
    Left = 0
    Top = 0
    Width = 509
    Height = 316
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    ExplicitTop = 200
    ExplicitHeight = 116
    object cxGridDBTableView1: TcxGridDBTableView
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
      OptionsView.GridLineColor = 12164479
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMClient.cxStyleGridHeader
      Styles.Header = DMClient.cxStyleGridEven
      object cxcolNo: TcxGridDBColumn
        Caption = 'No'
      end
      object cxcolPLU: TcxGridDBColumn
        Caption = 'PLU'
        Width = 66
      end
      object cxcolNamaBarang: TcxGridDBColumn
        Caption = 'Nama Barang'
        Width = 113
      end
      object cxcolJumlah: TcxGridDBColumn
        Caption = 'Jumlah'
      end
      object cxcolHarga: TcxGridDBColumn
        Caption = 'Harga'
      end
      object cxcolDisc: TcxGridDBColumn
        Caption = 'Disc'
      end
      object cxcolTotal: TcxGridDBColumn
        Caption = 'Total'
        Width = 94
      end
      object cxcolIsDecimal: TcxGridDBColumn
        Caption = 'isDecimal'
        Width = 22
      end
      object cxcolIsDiscAMC: TcxGridDBColumn
        Caption = 'IsDiscGMC'
        Width = 21
      end
    end
    object grdlvlTransaksi: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
end
