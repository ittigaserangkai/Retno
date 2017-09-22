inherited frmLookupOrganization: TfrmLookupOrganization
  Caption = 'Lookup Organization'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Height = 48
    ExplicitHeight = 48
    inherited lblHeader: TLabel
      Width = 18
      Height = 36
      Visible = False
      ExplicitWidth = 18
      ExplicitHeight = 672
    end
    inherited lblFilterData: TcxLabel
      Visible = False
      Height = 46
      AnchorY = 23
    end
    inherited StartDate: TcxDateEdit
      Visible = False
    end
    inherited EndDate: TcxDateEdit
      Visible = False
    end
    inherited btnRefresh: TcxButton
      Top = 3
      Height = 40
      Margins.Top = 3
      Margins.Bottom = 3
      Visible = False
      ExplicitTop = 0
      ExplicitHeight = 40
    end
    inherited lblsdFilter: TcxLabel
      Visible = False
      Height = 40
      AnchorY = 23
    end
    object rbOrgType: TcxRadioGroup
      AlignWithMargins = True
      Left = 29
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
      ExplicitLeft = 3
      ExplicitTop = -14
      ExplicitWidth = 674
      ExplicitHeight = 45
      Height = 43
      Width = 295
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
  end
end
