inherited frmKartuStock: TfrmKartuStock
  Caption = 'Kartu Stock Barang'
  ClientHeight = 561
  ClientWidth = 685
  ExplicitWidth = 701
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 685
    Height = 475
    ExplicitWidth = 685
    ExplicitHeight = 475
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 679
      Height = 86
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 27
        Top = 7
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Periode'
      end
      object Label3: TLabel
        Left = 165
        Top = 7
        Width = 17
        Height = 16
        Caption = 's/d'
      end
      object lbUOMStock: TLabel
        Left = 29
        Top = 32
        Width = 35
        Height = 16
        Alignment = taRightJustify
        Caption = 'Barang'
      end
      object Label5: TLabel
        Left = 368
        Top = 56
        Width = 34
        Height = 16
        Caption = 'Satuan'
      end
      object Label4: TLabel
        Left = 286
        Top = 8
        Width = 30
        Height = 16
        Alignment = taRightJustify
        Caption = 'Group'
      end
      object dtStart: TcxDateEdit
        AlignWithMargins = True
        Left = 70
        Top = 4
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Width = 89
      end
      object dtEnd: TcxDateEdit
        AlignWithMargins = True
        Left = 188
        Top = 4
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 89
      end
      object cxLookupGudang: TcxExtLookupComboBox
        Tag = 1
        Left = 70
        Top = 53
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 283
      end
      object cxLookupSatuan: TcxExtLookupComboBox
        Tag = 1
        Left = 408
        Top = 53
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 73
      end
      object chkGudang: TCheckBox
        Left = 12
        Top = 57
        Width = 56
        Height = 17
        Caption = 'Gudang'
        TabOrder = 4
        OnClick = chkGudangClick
      end
      object cxLookupBarang: TcxExtLookupComboBox
        Tag = 1
        Left = 70
        Top = 29
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        Properties.OnEditValueChanged = cxLookupBarangPropertiesEditValueChanged
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 411
      end
      object cxLookupGroup: TcxExtLookupComboBox
        Tag = 1
        Left = 319
        Top = 4
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        Properties.OnEditValueChanged = cxLookupGroupPropertiesEditValueChanged
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 162
      end
    end
    object cxGrid: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 92
      Width = 673
      Height = 377
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 9
      object cxGrdKartok: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = clGrdKartokQTYIN
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = clGrdKartokQTYOut
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.BandSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        Styles.ContentEven = DMClient.cxStyleInfoBK
        Styles.Header = cxStyle1
        Bands = <
          item
            Caption = 'Tanggal'
            Width = 110
          end
          item
            Caption = 'Transaksi'
            Width = 70
          end
          item
            Caption = 'NoBukti'
            Width = 180
          end
          item
            Caption = 'Mutasi'
            Width = 110
          end
          item
            Caption = 'IN'
            Position.BandIndex = 3
            Position.ColIndex = 0
            Width = 55
          end
          item
            Caption = 'OUT'
            Position.BandIndex = 3
            Position.ColIndex = 1
          end
          item
            Caption = 'Saldo'
            Width = 74
          end
          item
            Caption = 'Satuan'
            Width = 70
          end>
        object clGrdKartokUOM: TcxGridDBBandedColumn
          DataBinding.FieldName = 'UOM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Width = 65
          Position.BandIndex = 7
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object clGrdKartokTransaksi: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Transaksi'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object clGrdKartokNoBukti: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NoBukti'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object clGrdKartokQTYIN: TcxGridDBBandedColumn
          DataBinding.FieldName = 'QTYIN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          Position.BandIndex = 4
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object clGrdKartokQTYOut: TcxGridDBBandedColumn
          DataBinding.FieldName = 'QTYOut'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object clGrdKartokSaldo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Saldo'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          Position.BandIndex = 6
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object clGrdKartokTanggal: TcxGridDBBandedColumn
          DataBinding.FieldName = 'TglBukti'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGrdKartok
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 685
    ExplicitWidth = 685
    inherited lblHeader: TLabel
      Width = 104
      Caption = 'Kartu Stock Barang'
      ExplicitWidth = 104
    end
  end
  inherited pnlFooter: TPanel
    Top = 526
    Width = 685
    ExplicitTop = 526
    ExplicitWidth = 685
    inherited btnClose: TcxButton
      Left = 608
      ExplicitLeft = 608
    end
  end
  inherited pnlShortCut: TPanel
    Top = 505
    Width = 685
    ExplicitTop = 505
    ExplicitWidth = 685
    inherited lbEscape: TLabel
      Left = 611
      ExplicitLeft = 611
    end
  end
  inherited actReport: TActionList
    Left = 576
    Top = 56
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
    inherited actRefresh: TAction
      OnExecute = actRefreshExecute
    end
    inherited actExport: TAction
      OnExecute = actExportExecute
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 536
    Top = 8
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
