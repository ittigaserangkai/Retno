inherited frmGeneratePOBonus: TfrmGeneratePOBonus
  Left = 197
  Top = 112
  Caption = 'Generate PO Bonus'
  ClientHeight = 480
  ClientWidth = 809
  OldCreateOrder = True
  ExplicitWidth = 825
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 809
    Height = 424
    ExplicitWidth = 809
    ExplicitHeight = 368
    inherited cxGrid: TcxGrid
      Top = 139
      Width = 805
      Height = 283
      PopupMenu = pm1
      TabOrder = 1
      ExplicitTop = 139
      ExplicitWidth = 805
      ExplicitHeight = 227
      inherited cxGridView: TcxGridDBTableView
        object cxcolNo: TcxGridDBColumn
          Caption = 'No.'
        end
        object cxcolKode: TcxGridDBColumn
          Caption = 'KODE'
        end
        object cxcolNAMABARANG: TcxGridDBColumn
          Caption = 'NAMA BARANG'
          Width = 101
        end
        object cxcolSATUAN: TcxGridDBColumn
          Caption = 'SATUAN'
        end
        object cxcolQTYORDER: TcxGridDBColumn
          Caption = 'QTY ORDER'
        end
        object cxcolKODESUPLIER: TcxGridDBColumn
          Caption = 'KODE SUPLIER'
          Width = 91
        end
        object cxcolNAMASUPLIER: TcxGridDBColumn
          Caption = 'NAMA SUPLIER'
          Width = 160
        end
        object cxcolLEADTIME: TcxGridDBColumn
          Caption = 'LEAD TIME'
        end
        object cxcolFORBONUS: TcxGridDBColumn
          Caption = 'FOR BONUS'
        end
      end
    end
    object pnltop: TPanel
      Left = 2
      Top = 2
      Width = 805
      Height = 137
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 254
        Top = 7
        Width = 54
        Height = 16
        Caption = 'Tanggal PO'
      end
      object lbl2: TLabel
        Left = 7
        Top = 82
        Width = 76
        Height = 16
        Caption = 'Merchan Group'
      end
      object lbl3: TLabel
        Left = 7
        Top = 7
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object lbl4: TLabel
        Left = 7
        Top = 56
        Width = 33
        Height = 16
        Caption = 'Suplier'
      end
      object lbl5: TLabel
        Left = 7
        Top = 33
        Width = 87
        Height = 16
        Caption = 'Referensi PO [F5]'
      end
      object pnl2: TPanel
        Left = 603
        Top = 1
        Width = 201
        Height = 135
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 15198183
        TabOrder = 8
        Visible = False
        object cbbOption: TComboBox
          Left = 32
          Top = 22
          Width = 145
          Height = 24
          Style = csDropDownList
          Ctl3D = False
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'Kode Barang'
          Items.Strings = (
            'Kode Barang'
            'Nama Barang')
        end
        object btnCari: TcxButton
          Left = 65
          Top = 74
          Width = 80
          Height = 27
          Caption = 'Cari'
          OptionsImage.ImageIndex = 26
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnCariClick
        end
        object edtDicari: TEdit
          Left = 32
          Top = 49
          Width = 145
          Height = 22
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = edtDicariKeyPress
        end
      end
      object btnShow: TcxButton
        Left = 252
        Top = 80
        Width = 91
        Height = 27
        Caption = 'Tambahkan'
        OptionsImage.ImageIndex = 18
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowClick
      end
      object cbbmerchangrup: TComboBox
        Tag = 1
        Left = 100
        Top = 82
        Width = 145
        Height = 24
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        OnChange = cbbmerchangrupChange
      end
      object dtPO: TcxDateEdit
        Left = 312
        Top = 4
        TabOrder = 1
        Width = 110
      end
      object edtKodeSuplier: TcxButtonEdit
        Left = 100
        Top = 56
        Properties.Buttons = <>
        TabOrder = 3
        Text = '0'
        OnExit = edtKodeSuplierExit
        OnKeyPress = edtKodeSuplierKeyPress
        Width = 77
      end
      object edtNamaSuplier: TEdit
        Left = 180
        Top = 56
        Width = 245
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtNOPO: TEdit
        Left = 100
        Top = 4
        Width = 145
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object chkoption: TCheckBox
        Left = 100
        Top = 109
        Width = 145
        Height = 17
        Caption = 'Tampilkan Semua Barang'
        TabOrder = 7
      end
      object edtNoPORef: TEdit
        Left = 100
        Top = 30
        Width = 145
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnKeyUp = edtNoPORefKeyUp
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 424
    Width = 809
    ExplicitTop = 368
    ExplicitWidth = 809
    inherited pnlFooter: TPanel
      Width = 809
      ExplicitWidth = 809
      inherited btnClose: TcxButton
        Left = 732
        Action = actCancel
        ExplicitLeft = 732
      end
      inherited btnSave: TcxButton
        Left = 639
        Action = actSave
        ExplicitLeft = 639
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 809
      ExplicitWidth = 809
      inherited lbCTRLEnter: TLabel
        Left = 634
        ExplicitLeft = 634
      end
      inherited lbEscape: TLabel
        Left = 725
        ExplicitLeft = 725
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object pm1: TPopupMenu
    Left = 228
    Top = 208
    object HapusBaris1: TMenuItem
      Caption = 'Hapus Baris'
      OnClick = HapusBaris1Click
    end
    object HapusSemua1: TMenuItem
      Caption = 'Hapus Semua'
      OnClick = HapusSemua1Click
    end
  end
end
