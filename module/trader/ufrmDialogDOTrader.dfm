inherited frmDialogDOAsGross: TfrmDialogDOAsGross
  Left = 227
  Top = 126
  Caption = 'Dialog DO Assgros'
  ClientHeight = 512
  ClientWidth = 749
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 765
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 749
    Height = 456
    ExplicitWidth = 751
    ExplicitHeight = 482
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 745
      Height = 189
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 747
      object lbl1: TLabel
        Left = 7
        Top = 8
        Width = 35
        Height = 16
        Caption = 'DO No.'
      end
      object lbl2: TLabel
        Left = 7
        Top = 34
        Width = 42
        Height = 16
        Caption = 'DO Date'
      end
      object lbl3: TLabel
        Left = 7
        Top = 61
        Width = 38
        Height = 16
        Caption = 'Assgros'
      end
      object lbl7: TLabel
        Left = 7
        Top = 138
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl4: TLabel
        Left = 7
        Top = 165
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbldtReceipt: TLabel
        Left = 7
        Top = 112
        Width = 65
        Height = 16
        Caption = 'Receipt Date'
      end
      object Label1: TLabel
        Left = 7
        Top = 87
        Width = 63
        Height = 16
        Caption = 'Tipe Member'
      end
      object Label3: TLabel
        Left = 191
        Top = 112
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object Label4: TLabel
        Left = 303
        Top = 112
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object dtTgl: TJvDateEdit
        Left = 95
        Top = 31
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 1
      end
      object edtTraderName: TEdit
        Left = 187
        Top = 58
        Width = 206
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
        Text = 'ASSGROS ASSALAM BARU'
      end
      object edtDONo: TEdit
        Left = 95
        Top = 5
        Width = 145
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = '000007115'
      end
      object edtDesc: TEdit
        Left = 95
        Top = 135
        Width = 210
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Text = 'AG001'
      end
      object cbpTraderCode: TColumnComboBox
        Left = 95
        Top = 57
        Width = 90
        Height = 24
        Color = clWindow
        Version = '1.5.0.1'
        Visible = True
        Ctl3D = False
        Columns = <>
        ComboItems = <>
        EditColumn = -1
        EditHeight = 18
        EmptyText = ''
        EmptyTextStyle = []
        DropWidth = 0
        DropHeight = 200
        Enabled = True
        GridLines = False
        ItemIndex = -1
        LookupColumn = 0
        LabelCaption = ''
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        ParentCtl3D = False
        SortColumn = 0
        TabOrder = 2
        OnChange = cbpTraderCodeChange
      end
      object edtStatus: TEdit
        Left = 95
        Top = 162
        Width = 122
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object dtReceipt: TJvDateEdit
        Left = 95
        Top = 109
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 3
      end
      object edtTipeMember: TEdit
        Left = 95
        Top = 84
        Width = 154
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
        Text = 'ASSGROS ASSALAM BARU'
      end
      object Panel1: TPanel
        Left = 421
        Top = 2
        Width = 322
        Height = 185
        Align = alRight
        Color = 15263976
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
        ExplicitLeft = 423
        object lbl5: TLabel
          Left = 6
          Top = 43
          Width = 85
          Height = 16
          Caption = 'Diskon Member %'
        end
        object lbl6: TLabel
          Left = 6
          Top = 69
          Width = 44
          Height = 16
          Caption = 'Sub Total'
          FocusControl = cbpTraderCode
        end
        object Label2: TLabel
          Left = 6
          Top = 95
          Width = 83
          Height = 16
          Caption = 'Tot. Kena Diskon'
          FocusControl = cbpTraderCode
        end
        object lbl9: TLabel
          Left = 6
          Top = 121
          Width = 56
          Height = 16
          Caption = 'Tot. Diskon'
          FocusControl = cbpTraderCode
        end
        object lbl10: TLabel
          Left = 6
          Top = 147
          Width = 67
          Height = 16
          Caption = 'Tot. DO Kring'
          FocusControl = cbpTraderCode
        end
        object lbl8: TLabel
          Left = 150
          Top = 43
          Width = 56
          Height = 16
          Caption = 'Max Diskon'
        end
        object pnl3: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 32
          Align = alTop
          Caption = 'Total DO Kring'
          Color = 16757683
          TabOrder = 0
        end
        object edtDiskonMemberPersen: TEdit
          Left = 98
          Top = 40
          Width = 41
          Height = 22
          TabStop = False
          Color = clYellow
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          Text = 'ASSGROS ASSALAM BARU'
        end
        object curredtTotalDO: TJvValidateEdit
          Left = 98
          Top = 144
          Width = 158
          Height = 22
          TabStop = False
          Flat = True
          ParentFlat = False
          ClipboardCommands = [caCopy]
          Color = clYellow
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtSubTotal: TJvValidateEdit
          Left = 98
          Top = 66
          Width = 158
          Height = 22
          TabStop = False
          Flat = True
          ParentFlat = False
          ClipboardCommands = [caCopy]
          Color = clYellow
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtNominalKenaDiskon: TJvValidateEdit
          Left = 98
          Top = 92
          Width = 158
          Height = 22
          TabStop = False
          Flat = True
          ParentFlat = False
          ClipboardCommands = [caCopy]
          Color = clYellow
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtDiskonMemberRp: TJvValidateEdit
          Left = 98
          Top = 118
          Width = 158
          Height = 22
          TabStop = False
          Flat = True
          ParentFlat = False
          ClipboardCommands = [caCopy]
          Color = clYellow
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtMaxDiskon: TJvValidateEdit
          Left = 210
          Top = 40
          Width = 103
          Height = 22
          TabStop = False
          Flat = True
          ParentFlat = False
          ClipboardCommands = [caCopy]
          Color = clYellow
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object edtLeadTime: TEdit
        Left = 247
        Top = 108
        Width = 50
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 191
      Width = 745
      Height = 263
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 747
      ExplicitHeight = 289
      object strgGrid: TAdvStringGrid
        Left = 1
        Top = 1
        Width = 743
        Height = 261
        Cursor = crDefault
        Align = alClient
        ColCount = 15
        Ctl3D = True
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnKeyPress = strgGridKeyPress
        HoverRowCells = [hcNormal, hcSelected]
        OnGetAlignment = strgGridGetAlignment
        OnCanEditCell = strgGridCanEditCell
        OnCellValidate = strgGridCellValidate
        OnGetFloatFormat = strgGridGetFloatFormat
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        Bands.Active = True
        Bands.PrimaryColor = 14935011
        CellNode.TreeColor = clSilver
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        ScrollWidth = 16
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        Version = '8.1.3.0'
        ExplicitWidth = 745
        ExplicitHeight = 287
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
        RowHeights = (
          21
          21)
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 456
    Width = 749
    ExplicitTop = 482
    ExplicitWidth = 751
    inherited pnlFooter: TPanel
      Width = 749
      ExplicitWidth = 751
      inherited btnClose: TcxButton
        Left = 672
        Action = actCancel
        ExplicitLeft = 674
      end
      inherited btnSave: TcxButton
        Left = 579
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 581
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 502
        ExplicitLeft = 504
      end
    end
    inherited pnlSortCut: TPanel
      Width = 749
      ExplicitWidth = 751
      inherited lbCTRLEnter: TLabel
        Left = 574
        Height = 15
        ExplicitLeft = 562
      end
      inherited lbEscape: TLabel
        Left = 665
        Height = 15
        ExplicitLeft = 656
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 498
      end
    end
  end
end
