inherited frmLookupOrganization: TfrmLookupOrganization
  Caption = 'Lookup Organization'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Height = 48
    ExplicitHeight = 48
    inherited lblHeader: TLabel
      Height = 36
      Visible = False
    end
    inherited lblFilterData: TcxLabel
      Visible = False
      ExplicitHeight = 46
      Height = 46
      AnchorY = 23
    end
    inherited StartDate: TcxDateEdit
      Visible = False
      ExplicitHeight = 38
    end
    inherited EndDate: TcxDateEdit
      Visible = False
      ExplicitHeight = 38
    end
    inherited btnRefresh: TcxButton
      Top = 3
      Height = 40
      Margins.Top = 3
      Margins.Bottom = 3
      Visible = False
      ExplicitTop = 3
      ExplicitHeight = 40
    end
    inherited lblsdFilter: TcxLabel
      Visible = False
      ExplicitHeight = 40
      Height = 40
      AnchorY = 23
    end
    object rbOrgType: TcxRadioGroup
      AlignWithMargins = True
      Left = 157
      Top = 0
      Margins.Top = 0
      Align = alClient
      Caption = ' ORGANIZATION TYPE '
      ParentBackground = False
      ParentColor = False
      Properties.Columns = 5
      Properties.Items = <
        item
          Caption = 'Supplier'
        end
        item
          Caption = 'Member'
        end
        item
          Caption = 'Karyawan'
        end>
      Properties.OnEditValueChanged = rbOrgTypePropertiesEditValueChanged
      ItemIndex = 0
      Style.Color = clDefault
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Transparent = True
      Height = 43
      Width = 167
    end
  end
  inherited Panel1: TPanel
    inherited lbBenchmark: TLabel
      Visible = False
    end
  end
  inherited cxGrid: TcxGrid
    Top = 48
    Height = 307
    ExplicitTop = 48
    ExplicitHeight = 307
  end
end
