inherited frmDialogQuotation: TfrmDialogQuotation
  Left = 30
  Top = 143
  Caption = 'Input Quotation'
  ClientHeight = 561
  ClientWidth = 984
  Constraints.MinHeight = 32
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  ExplicitTop = -96
  ExplicitWidth = 1000
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 984
    Height = 505
    BevelInner = bvNone
    BevelOuter = bvNone
    ExplicitWidth = 984
    ExplicitHeight = 505
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Transparent = True
      Height = 76
      Width = 984
      object Label6: TLabel
        Left = 48
        Top = 52
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'Suppplier'
      end
      object Label7: TLabel
        Left = 17
        Top = 30
        Width = 76
        Height = 16
        Alignment = taRightJustify
        Caption = 'Merchan Group'
      end
      object Label8: TLabel
        Left = 361
        Top = 30
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'Effective At'
      end
      object Label9: TLabel
        Left = 518
        Top = 30
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'End Date'
      end
      object Label10: TLabel
        Left = 381
        Top = 52
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Remark'
      end
      object Label11: TLabel
        Left = 25
        Top = 8
        Width = 67
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quotation No'
      end
      object cxLookupTipeHarga: TcxExtLookupComboBox
        Tag = 1
        Left = 99
        Top = 49
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 227
      end
      object cxExtLookupComboBox1: TcxExtLookupComboBox
        Tag = 1
        Left = 99
        Top = 27
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 227
      end
      object dtAwalFilter: TcxDateEdit
        AlignWithMargins = True
        Left = 425
        Top = 27
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 87
      end
      object cxDateEdit1: TcxDateEdit
        AlignWithMargins = True
        Left = 569
        Top = 27
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 87
      end
      object ckIsADS: TcxCheckBox
        Left = 260
        Top = 5
        Caption = 'Is Mailer'
        Properties.Alignment = taLeftJustify
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Transparent = True
      end
      object edtProductName: TcxTextEdit
        Tag = 1
        Left = 425
        Top = 49
        HelpType = htKeyword
        HelpKeyword = 'Nama Produk'
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 309
      end
      object cxTextEdit1: TcxTextEdit
        Tag = 1
        Left = 99
        Top = 5
        HelpType = htKeyword
        HelpKeyword = 'Nama Produk'
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 155
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 0
      Top = 76
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = [bRight, bBottom]
      TabOrder = 0
      Transparent = True
      Height = 28
      Width = 984
      object Label2: TLabel
        AlignWithMargins = True
        Left = 818
        Top = 6
        Width = 161
        Height = 19
        Margins.Top = 4
        Margins.Bottom = 1
        Align = alRight
        Caption = 'ALT-T [Tambah]  |  ALT-D [Delete]'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 16
      end
      object btnDelKonv: TcxButton
        AlignWithMargins = True
        Left = 88
        Top = 2
        Width = 80
        Height = 24
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Delete'
        OptionsImage.ImageIndex = 8
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object btnAddKonversi: TcxButton
        AlignWithMargins = True
        Left = 5
        Top = 2
        Width = 80
        Height = 24
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Tambah'
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.ImageIndex = 0
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
    end
    object cxGridMaster: TcxGrid
      Left = 0
      Top = 104
      Width = 984
      Height = 273
      Align = alClient
      TabOrder = 2
      LookAndFeel.NativeStyle = False
      object cxGrdDBMaster: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.Indicator = True
        Bands = <
          item
            Caption = 'PLU'
            Width = 66
          end
          item
            Caption = 'Nama Barang'
            Width = 203
          end
          item
            Caption = 'UOM Beli'
            Width = 52
          end
          item
            Caption = 'Harga Beli'
            Width = 310
          end
          item
            Caption = 'Harga'
            Position.BandIndex = 3
            Position.ColIndex = 0
            Width = 80
          end
          item
            Caption = 'Disc1 %'
            Position.BandIndex = 3
            Position.ColIndex = 1
            Width = 43
          end
          item
            Caption = 'Disc2 %'
            Position.BandIndex = 3
            Position.ColIndex = 2
            Width = 50
          end
          item
            Caption = 'Disc3'
            Position.BandIndex = 3
            Position.ColIndex = 3
            Width = 57
          end
          item
            Caption = 'Hrg Bersih'
            Position.BandIndex = 3
            Position.ColIndex = 4
            Width = 56
          end
          item
            Caption = 'Margin'
            Width = 50
          end
          item
            Caption = 'Harga Jual'
            Width = 286
          end
          item
            Caption = 'Hrg Bersih'
            Position.BandIndex = 10
            Position.ColIndex = 3
            Width = 83
          end
          item
            Caption = 'Disc RP'
            Position.BandIndex = 10
            Position.ColIndex = 2
            Width = 72
          end
          item
            Caption = 'Disc %'
            Position.BandIndex = 10
            Position.ColIndex = 1
            Width = 39
          end
          item
            Caption = 'Harga'
            Position.BandIndex = 10
            Position.ColIndex = 0
            Width = 95
          end>
        object cxGrdDBMasterColumn1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Kode_Barang'
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Nama_Barang'
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn3: TcxGridDBBandedColumn
          DataBinding.FieldName = 'UOM_Purch'
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn4: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Harga_Beli'
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn5: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Disc1'
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn6: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Disc2'
          Position.BandIndex = 6
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn7: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Disc3'
          Position.BandIndex = 7
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn8: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Harga_Beli_Net'
          Position.BandIndex = 8
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn9: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Margin'
          Position.BandIndex = 9
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn10: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Harga_Jual'
          Position.BandIndex = 14
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn11: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Disc_Perc'
          Position.BandIndex = 13
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn12: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Disc_RP'
          Position.BandIndex = 12
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrdDBMasterColumn13: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Harga_Jual_Net'
          Position.BandIndex = 11
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxGridMasterLevel1: TcxGridLevel
        GridView = cxGrdDBMaster
      end
    end
    object cxGridDetail: TcxGrid
      Left = 0
      Top = 385
      Width = 984
      Height = 120
      Align = alBottom
      TabOrder = 3
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGrdDBDetail: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGrdDBDetailColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'UOM'
          Width = 103
        end
        object cxGrdDBDetailColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'Konversi'
          Width = 59
        end
        object cxGrdDBDetailColumn3: TcxGridDBColumn
          DataBinding.FieldName = 'Margin'
        end
        object cxGrdDBDetailColumn4: TcxGridDBColumn
          DataBinding.FieldName = 'Harga Jual'
        end
        object cxGrdDBDetailColumn5: TcxGridDBColumn
          Caption = 'Disc Perc'
          DataBinding.FieldName = 'Disc_Perc'
        end
        object cxGrdDBDetailColumn6: TcxGridDBColumn
          Caption = 'Disc RP'
          DataBinding.FieldName = 'Disc_RP'
        end
        object cxGrdDBDetailColumn7: TcxGridDBColumn
          Caption = 'Harga Bersih'
          DataBinding.FieldName = 'Harga_Jual_Net'
          Width = 118
        end
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'Konversi Satuan'
        GridView = cxGrdDBDetail
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 0
      Top = 377
      Width = 984
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      AlignSplitter = salBottom
      Control = cxGridDetail
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 505
    Width = 984
    ExplicitTop = 505
    ExplicitWidth = 984
    inherited pnlFooter: TPanel
      Width = 984
      ExplicitWidth = 984
      inherited btnClose: TcxButton
        Left = 907
        Action = actCancel
        ExplicitLeft = 907
      end
      inherited btnSave: TcxButton
        Left = 814
        Action = actSave
        ExplicitLeft = 814
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 737
        Action = actPrint
        ExplicitLeft = 737
      end
    end
    inherited pnlSortCut: TPanel
      Width = 984
      ExplicitWidth = 984
      inherited lbCTRLEnter: TLabel
        Left = 809
        Height = 15
        ExplicitLeft = 809
      end
      inherited lbEscape: TLabel
        Left = 900
        Height = 15
        ExplicitLeft = 900
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 733
        Height = 15
        ExplicitLeft = 733
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 944
    Top = 8
  end
end
