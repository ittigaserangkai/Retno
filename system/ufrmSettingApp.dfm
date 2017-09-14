inherited frmSettingApp: TfrmSettingApp
  Caption = 'Setting Applikasi'
  ClientHeight = 313
  ClientWidth = 458
  ExplicitWidth = 474
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 458
    Height = 283
    BorderWidth = 0
    ExplicitWidth = 458
    ExplicitHeight = 283
    object pnlHeaderCabang: TPanel
      Left = 1
      Top = 1
      Width = 456
      Height = 41
      Align = alTop
      TabOrder = 0
      object cbbUnit: TcxExtLookupComboBox
        Left = 61
        Top = 8
        Properties.OnEditValueChanged = cbbUnitPropertiesEditValueChanged
        TabOrder = 0
        Width = 184
      end
      object lblCabang: TcxLabel
        Left = 16
        Top = 8
        Caption = 'Cabang'
        Transparent = True
      end
      object btnSimpan: TcxButton
        Left = 249
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Simpan'
        TabOrder = 2
        OnClick = btnSimpanClick
      end
      object btnClear: TcxButton
        Left = 330
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 3
        OnClick = btnClearClick
      end
    end
    object pnlButton: TPanel
      Left = 1
      Top = 241
      Width = 456
      Height = 41
      Align = alBottom
      TabOrder = 1
    end
    object cxVerticalGridSettingApp: TcxVerticalGrid
      Left = 1
      Top = 42
      Width = 456
      Height = 199
      Align = alClient
      OptionsView.RowHeaderWidth = 146
      Styles.Header = cxstylSettingAppHeader
      TabOrder = 2
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
      object cxdtrwcxvrtclgrd1EditorRow3: TcxEditorRow
        Properties.Caption = 'XXXX'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object cxdtrwcxvrtclgrd1EditorRow4: TcxEditorRow
        Properties.Caption = 'XXXX'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
      object cxdtrwcxvrtclgrd1EditorRow5: TcxEditorRow
        Properties.Caption = 'XXXX'
        Properties.DataBinding.ValueType = 'String'
        Properties.Value = Null
        ID = 4
        ParentID = -1
        Index = 4
        Version = 1
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 458
    ExplicitWidth = 458
    inherited lblHeader: TLabel
      Width = 83
      Height = 18
      Caption = 'Setting Aplikas'
      ExplicitWidth = 83
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 336
    Top = 136
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
