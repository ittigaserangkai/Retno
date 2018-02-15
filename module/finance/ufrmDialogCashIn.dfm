inherited frmDialogCashIn: TfrmDialogCashIn
  Caption = 'Dialog Cash In'
  ClientHeight = 474
  ClientWidth = 840
  ExplicitWidth = 856
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 840
    Height = 418
    ExplicitWidth = 840
    ExplicitHeight = 418
    object pnlDetail2: TPanel
      Left = 2
      Top = 2
      Width = 836
      Height = 147
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      object cbBank: TcxExtLookupComboBox
        Left = 374
        Top = 59
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.MaxLength = 0
        TabOrder = 5
        Width = 223
      end
      object lvSumary: TcxListView
        Left = 603
        Top = 23
        Width = 210
        Height = 58
        Columns = <
          item
            AutoSize = True
            Caption = 'Desc'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Nominal'
          end>
        Items.ItemData = {
          05850000000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          000241005200013000D098972E00000000FFFFFFFFFFFFFFFF01000000FFFFFF
          FF00000000064E0065007700200041005000013000809E972E00000000FFFFFF
          FFFFFFFFFF01000000FFFFFFFF00000000064F00740068006500720073000130
          00889C972EFFFFFFFFFFFF}
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        TabOrder = 8
        ViewStyle = vsReport
      end
      object lvCheque: TcxListView
        Left = 605
        Top = 3
        Width = 210
        Height = 23
        Columns = <
          item
            AutoSize = True
            Caption = 'Desc'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Nominal'
          end>
        Items.ItemData = {
          052F0000000100000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          0006430068006500710075006500013000407C0737FFFF}
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        TabOrder = 7
        ViewStyle = vsReport
      end
      object edRefNum: TcxButtonEdit
        Left = 104
        Top = 59
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 2
        Width = 199
      end
      object edReceiveNum: TcxButtonEdit
        Left = 104
        Top = 3
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 0
        Width = 199
      end
      object ceNominal: TcxCurrencyEdit
        Left = 374
        Top = 87
        AutoSize = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clTeal
        Style.IsFontAssigned = True
        TabOrder = 6
        Height = 34
        Width = 223
      end
      object ceSummaryDetail: TcxCurrencyEdit
        Left = 605
        Top = 87
        AutoSize = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -20
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clRed
        Style.IsFontAssigned = True
        TabOrder = 9
        Height = 34
        Width = 210
      end
      object beBusinessPartner: TcxButtonEdit
        Left = 104
        Top = 87
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaxLength = 0
        Properties.OnButtonClick = beBusinessPartnerPropertiesButtonClick
        Properties.OnEditValueChanged = beBusinessPartnerPropertiesEditValueChanged
        TabOrder = 3
        OnExit = beBusinessPartnerExit
        Width = 199
      end
      object deReceiveDate: TcxDateEdit
        Left = 104
        Top = 31
        Properties.ShowTime = False
        TabOrder = 1
        Width = 199
      end
      object lblRef: TcxLabel
        Left = 2
        Top = 59
        Caption = 'Quitance/Ref Num'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl12: TcxLabel
        Left = 328
        Top = 87
        Caption = 'Nominal'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lblTglBukti: TcxLabel
        Left = 28
        Top = 32
        Caption = 'Receive Date'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl15: TcxLabel
        Left = 308
        Top = 4
        Caption = 'Description'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lblOrg: TcxLabel
        Left = 28
        Top = 86
        Caption = 'Organization'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lblNoBukti: TcxLabel
        Left = 31
        Top = 5
        Caption = 'Receive Num'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl7: TcxLabel
        Left = 312
        Top = 61
        Caption = 'Bank/Cash'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 374
        Top = 3
        Properties.ScrollBars = ssVertical
        TabOrder = 4
        Height = 52
        Width = 223
      end
      object edNamaOrganization: TcxButtonEdit
        Left = 104
        Top = 116
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 17
        Width = 199
      end
    end
    object cxgrdDetail: TcxGrid
      Left = 2
      Top = 149
      Width = 836
      Height = 267
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridTableAR: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColGridTableARColumn1: TcxGridColumn
          Caption = 'NO AR'
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object cxGridColGridTableARColumn2: TcxGridColumn
          Caption = 'DATE AR'
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object cxGridColGridTableARColumn3: TcxGridColumn
          Caption = 'DUEDATE'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColGridTableARColumn4: TcxGridColumn
          Caption = 'ACCOUNT'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object cxGridColGridTableARColumn5: TcxGridColumn
          Caption = 'TOTAL'
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object cxGridColGridTableARColumn6: TcxGridColumn
          Caption = 'REMAIN'
          HeaderAlignmentHorz = taCenter
          Width = 67
        end
        object cxGridColGridTableARColumn7: TcxGridColumn
          Caption = 'AMOUNT'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColGridTableARColumn8: TcxGridColumn
          Caption = 'DESCRIPTION'
          HeaderAlignmentHorz = taCenter
          Width = 121
        end
      end
      object cxGridTableNewAP: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColGridTableNewAPColumn1: TcxGridColumn
          Caption = 'ORG CODE'
          HeaderAlignmentHorz = taCenter
          Width = 97
        end
        object cxGridColGridTableNewAPColumn6: TcxGridColumn
          Caption = 'ORG NAME'
          HeaderAlignmentHorz = taCenter
          Width = 156
        end
        object cxGridColGridTableNewAPColumn2: TcxGridColumn
          Caption = 'DUEDATE'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxGridColGridTableNewAPColumn3: TcxGridColumn
          Caption = 'DESCRIPTION'
          HeaderAlignmentHorz = taCenter
          Width = 137
        end
        object cxGridColGridTableNewAPColumn4: TcxGridColumn
          Caption = 'ACCOUNT'
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object cxGridColGridTableNewAPColumn5: TcxGridColumn
          Caption = 'AMOUNT'
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
      end
      object cxGridTableOI: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColGridTableOIColumn1: TcxGridColumn
          Caption = 'ACCOUNT'
          HeaderAlignmentHorz = taCenter
          Width = 122
        end
        object cxGridColGridTableOIColumn2: TcxGridColumn
          Caption = 'DESCRIPTION'
          HeaderAlignmentHorz = taCenter
          Width = 112
        end
        object cxGridColGridTableOIColumn3: TcxGridColumn
          Caption = 'AMOUNT'
          HeaderAlignmentHorz = taCenter
          Width = 98
        end
        object cxGridColGridTableOIColumn4: TcxGridColumn
          Caption = 'ALLOCATION'
          HeaderAlignmentHorz = taCenter
          Width = 97
        end
      end
      object cxGridDBTableCheque: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGridColGridDBTableChequeColumn1: TcxGridDBColumn
          Caption = 'CHEQUE NUM'
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
        object cxGridColGridDBTableChequeColumn2: TcxGridDBColumn
          Caption = 'BANK NAME'
          HeaderAlignmentHorz = taCenter
          Width = 97
        end
        object cxGridColGridDBTableChequeColumn3: TcxGridDBColumn
          Caption = 'DUDATE'
          HeaderAlignmentHorz = taCenter
          Width = 144
        end
        object cxGridColGridDBTableChequeColumn4: TcxGridDBColumn
          Caption = 'AMOUNT'
          HeaderAlignmentHorz = taCenter
          Width = 113
        end
      end
      object cxgrdlvlDetail: TcxGridLevel
        Caption = 'AR List'
        GridView = cxGridTableAR
      end
      object cxgrdlvlNewAP: TcxGridLevel
        Caption = 'New AP'
        GridView = cxGridTableNewAP
      end
      object cxgrdlvlOI: TcxGridLevel
        Caption = 'Other Income'
        GridView = cxGridTableOI
      end
      object cxgrdlvlCheque: TcxGridLevel
        Caption = 'Cheques'
        GridView = cxGridDBTableCheque
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 418
    Width = 840
    ExplicitTop = 418
    ExplicitWidth = 840
    inherited pnlFooter: TPanel
      Width = 840
      ExplicitWidth = 840
      inherited btnClose: TcxButton
        Left = 763
        Action = actCancel
        ExplicitLeft = 763
      end
      inherited btnSave: TcxButton
        Left = 670
        Action = actSave
        ExplicitLeft = 670
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 593
        Action = actPrint
        ExplicitLeft = 593
      end
    end
    inherited pnlSortCut: TPanel
      Width = 840
      ExplicitWidth = 840
      inherited lbCTRLEnter: TLabel
        Left = 665
        Height = 15
        ExplicitLeft = 665
      end
      inherited lbEscape: TLabel
        Left = 756
        Height = 15
        ExplicitLeft = 756
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 589
        Height = 15
        ExplicitLeft = 589
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 176
    Top = 248
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
