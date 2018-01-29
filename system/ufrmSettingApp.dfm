inherited frmSettingApp: TfrmSettingApp
  Caption = 'Setting Applikasi'
  ClientHeight = 489
  ClientWidth = 752
  ExplicitWidth = 768
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 752
    Height = 459
    BorderWidth = 0
    ExplicitWidth = 752
    ExplicitHeight = 459
    object grpPilihToko: TGroupBox
      Left = 216
      Top = 144
      Width = 573
      Height = 55
      Caption = 'Pilih Toko'
      TabOrder = 0
      Visible = False
      object lblToko: TLabel
        Left = 25
        Top = 20
        Width = 37
        Height = 16
        Caption = 'Cabang'
      end
      object cbbPilihCabang: TcxExtLookupComboBox
        Left = 69
        Top = 16
        TabOrder = 0
        Width = 277
      end
      object bPilih: TcxButton
        Left = 352
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Pilih'
        TabOrder = 1
        OnClick = bPilihClick
      end
    end
    object grpSettingParameter: TGroupBox
      Left = 6
      Top = 6
      Width = 573
      Height = 283
      Caption = 'Setting Parameter'
      TabOrder = 1
      object pnlHeaderCabang: TPanel
        Left = 1
        Top = 17
        Width = 569
        Height = 32
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object cbbUnit: TcxExtLookupComboBox
          Left = 68
          Top = 4
          TabOrder = 0
          Width = 277
        end
        object lblCabang: TcxLabel
          Left = 24
          Top = 4
          Caption = 'Cabang'
          Transparent = True
        end
        object btnClear: TcxButton
          Left = 330
          Top = 33
          Width = 75
          Height = 25
          Caption = 'Clear'
          TabOrder = 2
          OnClick = btnClearClick
        end
        object bLoad: TcxButton
          Left = 352
          Top = 4
          Width = 75
          Height = 25
          Caption = 'Load'
          TabOrder = 3
          OnClick = bLoadClick
        end
      end
      object cxVerticalGridSettingApp: TcxVerticalGrid
        Left = 1
        Top = 49
        Width = 569
        Height = 184
        OptionsView.RowHeaderWidth = 194
        Styles.Header = cxstylSettingAppHeader
        TabOrder = 1
        Version = 1
        object cxGridRowGudangDO: TcxEditorRow
          Properties.Caption = 'GUDANG DO'
          Properties.EditPropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
        end
        object cxGridRowRekeningHutang: TcxEditorRow
          Properties.Caption = 'REKENING HUTANG'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object cxGridRowDEFAULT_BANK_BCO: TcxEditorRow
          Properties.Caption = 'DEFAULT_BANK_BCO '
          Properties.EditPropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          ID = 2
          ParentID = -1
          Index = 2
          Version = 1
        end
        object cxGridRowrEKENING_PIUTANG_LAIN: TcxEditorRow
          Properties.Caption = 'REKENING_PIUTANG_LAIN'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          ID = 3
          ParentID = -1
          Index = 3
          Version = 1
        end
        object cxGridRowREKENING_PENDAPATAN_LAIN: TcxEditorRow
          Properties.Caption = 'REKENING_PENDAPATAN_LAIN'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          ID = 4
          ParentID = -1
          Index = 4
          Version = 1
        end
        object cxGridRowPRICE_BARCODE_REQ: TcxEditorRow
          Properties.Caption = 'PRICE_BARCODE_REQ'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.DisplayFormat = ',0.00;(,0.00)'
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = Null
          ID = 5
          ParentID = -1
          Index = 5
          Version = 1
        end
      end
      object btnSimpan: TcxButton
        Left = 495
        Top = 239
        Width = 75
        Height = 25
        Caption = 'Simpan'
        TabOrder = 2
        OnClick = btnSimpanClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 752
    ExplicitWidth = 752
    inherited lblHeader: TLabel
      Width = 110
      Height = 18
      Caption = 'Pengaturan Aplikasi'
      ExplicitWidth = 110
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 432
    Top = 424
    PixelsPerInch = 96
    object cxstylSettingAppHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
