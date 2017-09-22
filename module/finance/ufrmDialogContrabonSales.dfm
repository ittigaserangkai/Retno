inherited frmDialogContrabonSales: TfrmDialogContrabonSales
  Caption = 'Dialog Contrabon Sales'
  ClientHeight = 438
  ClientWidth = 700
  OnDestroy = FormDestroy
  ExplicitWidth = 716
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 700
    Height = 382
    ExplicitWidth = 700
    ExplicitHeight = 382
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 690
      Height = 111
      Align = alTop
      TabOrder = 0
      object lblSupMG: TLabel
        Left = 9
        Top = 7
        Width = 66
        Height = 16
        Caption = 'Organization'
      end
      object lblAlamat: TLabel
        Left = 36
        Top = 34
        Width = 39
        Height = 16
        Caption = 'Address'
      end
      object lblPostCode: TLabel
        Left = 26
        Top = 61
        Width = 49
        Height = 16
        Caption = 'Post Code'
      end
      object lblTelp: TLabel
        Left = 132
        Top = 61
        Width = 19
        Height = 16
        Caption = 'Telp'
      end
      object lblNPWP: TLabel
        Left = 46
        Top = 88
        Width = 29
        Height = 16
        Caption = 'NPWP'
      end
      object lblPPN: TLabel
        Left = 288
        Top = 61
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lblFee: TLabel
        Left = 289
        Top = 88
        Width = 18
        Height = 16
        Caption = 'Fee'
      end
      object edAddress: TcxTextEdit
        Left = 86
        Top = 30
        TabStop = False
        TabOrder = 2
        Text = 'edAddress'
        Width = 292
      end
      object edPostCode: TcxTextEdit
        Left = 86
        Top = 57
        TabStop = False
        TabOrder = 3
        Text = '57177'
        Width = 43
      end
      object edTelp: TcxTextEdit
        Left = 155
        Top = 57
        TabStop = False
        TabOrder = 4
        Text = '08886761775'
        Width = 128
      end
      object edNPWP: TcxTextEdit
        Left = 86
        Top = 84
        TabStop = False
        TabOrder = 6
        Text = 'edNPWP'
        Width = 197
      end
      object pnlLoadSales: TPanel
        AlignWithMargins = True
        Left = 383
        Top = 27
        Width = 186
        Height = 81
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 8
        object lblP1: TLabel
          Left = 19
          Top = 6
          Width = 27
          Height = 16
          Caption = 'Begin'
        end
        object lblP2: TLabel
          Left = 28
          Top = 31
          Width = 18
          Height = 16
          Caption = 'End'
        end
        object dtP1: TcxDateEdit
          Left = 52
          Top = 0
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 0
          Width = 121
        end
        object dtP2: TcxDateEdit
          Left = 52
          Top = 25
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 121
        end
        object btnLoadSales: TcxButton
          Left = 98
          Top = 51
          Width = 75
          Height = 25
          Caption = 'Load Sales'
          TabOrder = 2
          OnClick = btnLoadSalesClick
        end
      end
      object pnlHeaderLoad: TPanel
        AlignWithMargins = True
        Left = 383
        Top = 3
        Width = 186
        Height = 23
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'Load Sales Contrabon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object edPPN: TcxCurrencyEdit
        Left = 310
        Top = 57
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 5
        Width = 68
      end
      object edFee: TcxCurrencyEdit
        Left = 310
        Top = 84
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 7
        Width = 68
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 86
        Top = 3
        HelpType = htKeyword
        HelpKeyword = 'Organisasi'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 0
        Properties.OnButtonClick = edOrganizationPropertiesButtonClick
        Properties.OnValidate = edOrganizationPropertiesValidate
        TabOrder = 0
        Width = 75
      end
      object edOrganizationName: TcxButtonEdit
        Left = 163
        Top = 3
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 1
        Width = 215
      end
    end
    object cxGridContrabon: TcxGrid
      Left = 2
      Top = 119
      Width = 696
      Height = 261
      Align = alClient
      TabOrder = 1
      OnEnter = cxGridContrabonEnter
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridTableContrabonSales: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColContAmountGross
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColContAmountAdj
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColContAmountNet
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterInsert = cxGridTableContrabonSalesDataControllerAfterInsert
        DataController.OnAfterPost = cxGridTableContrabonSalesDataControllerAfterPost
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColContDate: TcxGridColumn
          AlternateCaption = 'CONT_DATE_SALES'
          Caption = 'Date'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object cxGridColContAmountGross: TcxGridColumn
          AlternateCaption = 'CONT_GROSS_SALES'
          Caption = 'Amount Gross'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
        object cxGridColContAmountAdj: TcxGridColumn
          AlternateCaption = 'CONT_DISC_AMOUNT'
          Caption = 'Amount Disc'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object cxGridColContFee: TcxGridColumn
          AlternateCaption = 'CONT_FEE'
          Caption = 'Fee'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColContAmountSales: TcxGridColumn
          AlternateCaption = 'CONT_TOTAL_SALES'
          Caption = 'Amount Sales'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object cxGridColContPPN: TcxGridColumn
          Caption = 'PPN'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object cxGridColContPPNAmount: TcxGridColumn
          AlternateCaption = 'CONT_TAX_AMOUNT'
          Caption = 'PPN (Rp)'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object cxGridColContAmountNet: TcxGridColumn
          AlternateCaption = 'CONT_NET_SALES'
          Caption = 'Amount Net'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 139
        end
        object cxGridColContIsClaimed: TcxGridColumn
          AlternateCaption = 'CONT_IS_CLAIM'
          Caption = 'Is Claimed'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ReadOnly = True
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColContID: TcxGridColumn
          AlternateCaption = 'ID'
          Caption = 'ID'
          Visible = False
        end
      end
      object cxgrdlvlContrabon: TcxGridLevel
        Caption = 'Contrabon Sales List'
        GridView = cxGridTableContrabonSales
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 382
    Width = 700
    ExplicitTop = 382
    ExplicitWidth = 700
    inherited pnlFooter: TPanel
      Width = 700
      ExplicitWidth = 700
      inherited btnClose: TcxButton
        Left = 623
        Action = actCancel
        ExplicitLeft = 623
      end
      inherited btnSave: TcxButton
        Left = 530
        Action = actSave
        ExplicitLeft = 530
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 453
        Action = actPrint
        ExplicitLeft = 453
      end
    end
    inherited pnlSortCut: TPanel
      Width = 700
      ExplicitWidth = 700
      inherited lbCTRLEnter: TLabel
        Left = 525
        Height = 15
        ExplicitLeft = 525
      end
      inherited lbEscape: TLabel
        Left = 616
        Height = 15
        ExplicitLeft = 616
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 449
        Height = 15
        ExplicitLeft = 449
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 136
    Top = 216
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
