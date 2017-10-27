object frmLookupBarang: TfrmLookupBarang
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmLookupBarang'
  ClientHeight = 384
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      544
      51)
    object lblNamaBarang: TLabel
      Left = 6
      Top = 9
      Width = 78
      Height = 18
      Caption = 'Nama Barang :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object edNamaBarang: TEdit
      Left = 132
      Top = 6
      Width = 405
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edNamaBarangChange
      OnKeyDown = edNamaBarangKeyDown
    end
    object rbDepan: TRadioButton
      Left = 132
      Top = 30
      Width = 124
      Height = 17
      Caption = 'Dari Depan [F2]'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object rbSemua: TRadioButton
      Left = 267
      Top = 30
      Width = 142
      Height = 17
      Caption = 'Semua Posisi [F3]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 329
    Width = 544
    Height = 34
    Align = alBottom
    Color = clYellow
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object lblInfo: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 7
      Width = 88
      Height = 23
      Margins.Top = 6
      Align = alLeft
      Caption = 'Warning !!!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 15
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 51
    Width = 544
    Height = 278
    Align = alClient
    TabOrder = 2
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    object sgBarang: TcxGridTableView
      OnDblClick = sgBarangDblClick
      OnKeyDown = sgBarangKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      Styles.Header = DMClient.cxStyleGridHeader
      object sgBarangColumn1: TcxGridColumn
        Caption = 'PLU'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 39
      end
      object sgBarangColumn2: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 57
      end
      object sgBarangColumn3: TcxGridColumn
        Caption = 'Nama Barang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 92
      end
      object sgBarangColumn4: TcxGridColumn
        Caption = 'Harga Dasar'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 87
      end
      object sgBarangColumn5: TcxGridColumn
        Caption = 'Diskon'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 55
      end
      object sgBarangColumn6: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 51
      end
      object sgBarangColumn7: TcxGridColumn
        Caption = 'IsActive'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 64
      end
    end
    object cxGrdBarang: TcxGridDBTableView
      OnDblClick = cxGrdBarangDblClick
      OnKeyDown = cxGrdBarangKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMClient.cxStyleGridEven
      Styles.Header = DMClient.cxStyleGridHeader
      object cxGrdBarangColumn1: TcxGridDBColumn
        Caption = 'PLU'
        DataBinding.FieldName = 'brg_code'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrdBarangColumn2: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'SAT_CODE'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrdBarangColumn3: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'brg_name'
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
      object cxGrdBarangColumn4: TcxGridDBColumn
        Caption = 'Harga Dasar'
        DataBinding.FieldName = 'BHJ_SELL_PRICE'
        HeaderAlignmentHorz = taCenter
        Width = 68
      end
      object cxGrdBarangColumn5: TcxGridDBColumn
        Caption = 'Diskon'
        DataBinding.FieldName = 'BHJ_DISC_NOMINAL'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrdBarangColumn6: TcxGridDBColumn
        Caption = 'Harga'
        DataBinding.FieldName = 'BHJ_SELL_PRICE_DISC'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrdBarangColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'IsActive'
        HeaderAlignmentHorz = taCenter
      end
    end
    object grdLvlBarang: TcxGridLevel
      GridView = cxGrdBarang
    end
    object cxGridLevel1: TcxGridLevel
      GridView = sgBarang
      Visible = False
    end
  end
  object pbBarang: TcxProgressBar
    Left = 0
    Top = 363
    Align = alBottom
    TabOrder = 3
    Visible = False
    Width = 544
  end
  object pmLookup: TPopupMenu
    Left = 89
    Top = 195
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 120
    Top = 256
  end
end
