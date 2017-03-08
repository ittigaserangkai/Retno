object fraStockCard: TfraStockCard
  Left = 0
  Top = 0
  Width = 558
  Height = 385
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'STOCK CARD'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 627
  end
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 558
    Height = 362
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 1
    ExplicitWidth = 627
    ExplicitHeight = 343
    object lbl1: TLabel
      Left = 10
      Top = 7
      Width = 37
      Height = 16
      Caption = 'Periode'
    end
    object Label1: TLabel
      Left = 336
      Top = 8
      Width = 33
      Height = 16
      Caption = 'UOM : '
    end
    object lblUOM: TLabel
      Left = 368
      Top = 8
      Width = 33
      Height = 16
      Caption = 'lblUOM'
    end
    object cbbBulan: TComboBox
      Left = 88
      Top = 4
      Width = 77
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 3
      ParentCtl3D = False
      TabOrder = 0
      Text = 'April'
      Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
    end
    object pnl2: TPanel
      Left = 2
      Top = 54
      Width = 554
      Height = 306
      Align = alBottom
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 2
      ExplicitTop = 35
      ExplicitWidth = 623
      DesignSize = (
        554
        306)
      object cxGrid: TcxGrid
        Left = 11
        Top = 11
        Width = 532
        Height = 284
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 176
        ExplicitTop = 74
        ExplicitWidth = 301
        ExplicitHeight = 143
        object cxGridViewToko: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGridViewTokoColumn1: TcxGridDBColumn
            Caption = 'No'
          end
          object cxGridViewTokoColumn2: TcxGridDBColumn
            Caption = 'No Bukti'
          end
          object cxGridViewTokoColumn3: TcxGridDBColumn
            Caption = 'Tanggal'
          end
          object cxGridViewTokoColumn4: TcxGridDBColumn
            Caption = 'Tipe Transaksi'
          end
          object cxGridViewTokoColumn5: TcxGridDBColumn
            Caption = 'Qty'
          end
          object cxGridViewTokoColumn6: TcxGridDBColumn
            Caption = 'Saldo'
          end
          object cxGridViewTokoColumn7: TcxGridDBColumn
            Caption = 'Gudang Asal'
          end
          object cxGridViewTokoColumn8: TcxGridDBColumn
            Caption = 'Gudang Tujuan'
          end
        end
        object cxGridViewBonus: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object cxGridViewBonusColumn1: TcxGridDBColumn
            Caption = 'No'
          end
          object cxGridViewBonusColumn2: TcxGridDBColumn
            Caption = 'No Bukti'
          end
          object cxGridViewBonusColumn3: TcxGridDBColumn
            Caption = 'Tanggal'
          end
          object cxGridViewBonusColumn4: TcxGridDBColumn
            Caption = 'Tipe'
          end
          object cxGridViewBonusColumn5: TcxGridDBColumn
            Caption = 'Qty'
          end
          object cxGridViewBonusColumn6: TcxGridDBColumn
            Caption = 'Saldo'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridViewToko
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridViewBonus
        end
      end
      object lblClose: TcxLabel
        Left = 515
        Top = 4
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Close'
        ParentFont = False
        Transparent = True
        OnClick = lblCloseClick
      end
    end
    object btnRefresh: TButton
      Left = 240
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Refresh'
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object btnCetak: TButton
      Left = 408
      Top = 3
      Width = 75
      Height = 25
      Caption = '&Cetak'
      TabOrder = 3
      OnClick = btnCetakClick
    end
    object spnedtTahun: TcxSpinEdit
      Left = 168
      Top = 4
      Properties.MaxValue = 3000.000000000000000000
      Properties.MinValue = 1990.000000000000000000
      TabOrder = 4
      Value = 1990
      Width = 65
    end
  end
end
