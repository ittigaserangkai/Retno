object frmLookupMember: TfrmLookupMember
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Lookup Member'
  ClientHeight = 429
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 58
    Width = 828
    Height = 350
    Align = alClient
    TabOrder = 0
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    ExplicitLeft = 132
    ExplicitTop = 53
    ExplicitWidth = 527
    ExplicitHeight = 163
    object sgLookup: TcxGridTableView
      OnDblClick = sgLookupDblClick
      OnKeyDown = sgLookupKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'ketik teks yang dicari...'
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.PercentWildcard = '*'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 
        'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
        'er'
      FilterRow.ApplyChanges = fracImmediately
      NewItemRow.InfoText = 'Baris baru'
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMClient.cxStyleGridEven
      Styles.Header = DMClient.cxStyleGridHeader
      object cxcolKode: TcxGridColumn
        Caption = 'Kode'
        HeaderAlignmentHorz = taCenter
      end
      object cxcolNama: TcxGridColumn
        Caption = 'Nama'
        HeaderAlignmentHorz = taCenter
        Width = 130
      end
      object cxcolAlamat: TcxGridColumn
        Caption = 'Alamat'
        HeaderAlignmentHorz = taCenter
        Width = 144
      end
      object cxcolAktif: TcxGridColumn
        Caption = 'Aktif'
        HeaderAlignmentHorz = taCenter
        Width = 41
      end
      object cxcolValid: TcxGridColumn
        Caption = 'Valid'
        HeaderAlignmentHorz = taCenter
        Width = 40
      end
    end
    object cxGrdMember: TcxGridDBTableView
      OnDblClick = cxGrdMemberDblClick
      OnKeyDown = cxGrdMemberKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMClient.cxStyleGridEven
      Styles.Header = DMClient.cxStyleGridHeader
      object clKode: TcxGridDBColumn
        DataBinding.FieldName = 'KODE'
        HeaderAlignmentHorz = taCenter
        Width = 146
      end
      object clNama: TcxGridDBColumn
        DataBinding.FieldName = 'NAMA'
        HeaderAlignmentHorz = taCenter
        Width = 248
      end
      object clAlamat: TcxGridDBColumn
        DataBinding.FieldName = 'ALAMAT'
        HeaderAlignmentHorz = taCenter
        Width = 399
      end
    end
    object grdlvlLookupMember: TcxGridLevel
      GridView = cxGrdMember
    end
  end
  object pbLookup: TcxProgressBar
    Left = 0
    Top = 408
    Align = alBottom
    TabOrder = 1
    Visible = False
    ExplicitTop = 173
    Width = 828
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 58
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 428
    DesignSize = (
      828
      58)
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 91
      Height = 15
      Caption = 'Nama Member :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object edNama: TEdit
      Left = 132
      Top = 6
      Width = 689
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edNamaChange
      OnKeyDown = edNamaKeyDown
      ExplicitWidth = 289
    end
    object rbDepan: TRadioButton
      Left = 132
      Top = 30
      Width = 124
      Height = 17
      Caption = 'Dari Depan [F2]'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbSemua: TRadioButton
      Left = 267
      Top = 30
      Width = 142
      Height = 17
      Caption = 'Semua Posisi [F3]'
      TabOrder = 2
      TabStop = True
    end
  end
  object pmLookup: TPopupMenu
    Left = 241
    Top = 107
    object ExporttoCSV1: TMenuItem
      Caption = 'Export to CSV'
    end
  end
  object dlgSaveLookup: TSaveDialog
    DefaultExt = 'CSV'
    Filter = 'Comma Separated Value (*.CSV)|*.CSV|Any File (*.*)|*.*'
    Left = 195
    Top = 106
  end
end
