inherited frmDialogContrabonSales: TfrmDialogContrabonSales
  Caption = 'Dialog Contrabon Sales'
  ClientHeight = 438
  ClientWidth = 700
  ExplicitWidth = 716
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 700
    Height = 382
    ExplicitWidth = 634
    ExplicitHeight = 382
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 690
      Height = 111
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 630
      object lblSupMG: TLabel
        Left = 23
        Top = 7
        Width = 57
        Height = 16
        Caption = 'Supplier MG'
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
        Left = 220
        Top = 60
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
      object cbbSupplierMG: TcxExtLookupComboBox
        Left = 86
        Top = 3
        TabOrder = 0
        Width = 278
      end
      object edAddress: TcxTextEdit
        Left = 86
        Top = 30
        TabOrder = 1
        Text = 'edAddress'
        Width = 278
      end
      object edPostCode: TcxTextEdit
        Left = 86
        Top = 57
        TabOrder = 2
        Text = 'edPostCode'
        Width = 121
      end
      object edTelp: TcxTextEdit
        Left = 243
        Top = 57
        TabOrder = 3
        Text = 'edTelp'
        Width = 121
      end
      object edNPWP: TcxTextEdit
        Left = 86
        Top = 84
        TabOrder = 4
        Text = 'edNPWP'
        Width = 278
      end
      object pnlLoadSales: TPanel
        AlignWithMargins = True
        Left = 383
        Top = 27
        Width = 186
        Height = 81
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 5
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
        object edP1: TcxDateEdit
          Left = 52
          Top = 0
          TabOrder = 0
          Width = 121
        end
        object edP2: TcxDateEdit
          Left = 52
          Top = 25
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
        TabOrder = 6
      end
    end
    object cxGridContrabon: TcxGrid
      Left = 2
      Top = 119
      Width = 696
      Height = 261
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitTop = 113
      ExplicitWidth = 630
      ExplicitHeight = 267
      object cxGridTableContrabonSales: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColContDate: TcxGridColumn
          Caption = 'Date'
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
        object cxGridColContAmountGross: TcxGridColumn
          Caption = 'Amount Gross'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
        object cxGridColContAmountAdj: TcxGridColumn
          Caption = 'Amount Adj'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object cxGridColContFee: TcxGridColumn
          Caption = 'Fee'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColContPPN: TcxGridColumn
          Caption = 'PPN'
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object cxGridColContAmountNet: TcxGridColumn
          Caption = 'Amount Net'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 139
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
    ExplicitWidth = 634
    inherited pnlFooter: TPanel
      Width = 700
      ExplicitWidth = 634
      inherited btnClose: TcxButton
        Left = 623
        Action = actCancel
        ExplicitLeft = 557
      end
      inherited btnSave: TcxButton
        Left = 530
        Action = actSave
        ExplicitLeft = 464
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 453
        Action = actPrint
        ExplicitLeft = 387
      end
    end
    inherited pnlSortCut: TPanel
      Width = 700
      ExplicitWidth = 634
      inherited lbCTRLEnter: TLabel
        Left = 525
        Height = 15
        ExplicitLeft = 459
      end
      inherited lbEscape: TLabel
        Left = 616
        Height = 15
        ExplicitLeft = 550
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 449
        Height = 15
        ExplicitLeft = 383
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 8
    Top = 32
  end
end
