inherited frmDialogCrazyPrice: TfrmDialogCrazyPrice
  Caption = 'Dialog Crazy Price'
  ClientHeight = 479
  ClientWidth = 854
  ExplicitWidth = 870
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 854
    Height = 423
    ExplicitWidth = 700
    ExplicitHeight = 423
    object cxgrdCP: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 844
      Height = 303
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 690
      object cxGridTableCP: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditing = cxGridTableCPEditing
        OnFocusedRecordChanged = cxGridTableCPFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DataController.OnNewRecord = cxGridTableCPDataControllerNewRecord
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColCPKode: TcxGridColumn
          Caption = 'Kode [F5]'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.CharCase = ecUpperCase
          Properties.OnButtonClick = cxGridColCPKodePropertiesButtonClick
          Properties.OnValidate = cxGridColCPKodePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
        object cxGridColCPNama: TcxGridColumn
          Caption = 'Nama'
          HeaderAlignmentHorz = taCenter
          Width = 172
        end
        object cxGridColCPOrgID: TcxGridColumn
          Caption = 'OrgID'
          Visible = False
        end
        object cxGridColCPPLU: TcxGridColumn
          Caption = 'PLU'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.CharCase = ecUpperCase
          Properties.OnValidate = cxGridColCPPLUPropertiesValidate
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPNamaBarang: TcxGridColumn
          Caption = 'Nama Barang'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxGridColCPPLUID: TcxGridColumn
          Caption = 'PLUID'
          Visible = False
        end
        object cxGridColCPSatuan: TcxGridColumn
          Caption = 'Satuan'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnValidate = cxGridColCPSatuanPropertiesValidate
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPPeriodeMulai: TcxGridColumn
          Caption = 'Periode Awal'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object cxGridColCPPeriodeAkhir: TcxGridColumn
          Caption = 'Periode Akhir'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object cxGridColCPCOGS: TcxGridColumn
          Caption = 'COGS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPPPN: TcxGridColumn
          Caption = 'PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPDisc: TcxGridColumn
          Caption = 'Disc %'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPMarkUp: TcxGridColumn
          Caption = 'Mark Up'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSellpriceDisc: TcxGridColumn
          Caption = 'Setelah Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object cxGridColCPSellPriceDiscPPN: TcxGridColumn
          Caption = 'Setelah Disc + PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
        object cxGridColCPBHJMarkUp: TcxGridColumn
          Caption = 'Mark Up Sebelum'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColCPBHJSellpriceDisc: TcxGridColumn
          Caption = 'BHJ Sellprice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
        end
        object cxGridColCPBHJSellpriceDiscPPN: TcxGridColumn
          Caption = 'BHJ Sellprice PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
        end
      end
      object cxgrdlvlCP: TcxGridLevel
        GridView = cxGridTableCP
      end
    end
    object pnlKeterangan: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 314
      Width = 844
      Height = 104
      Align = alBottom
      TabOrder = 1
      ExplicitWidth = 690
      object lblSebelumDisc: TLabel
        Left = 12
        Top = 33
        Width = 63
        Height = 16
        Caption = 'Sebelum Disc'
      end
      object lblSetelahDisc: TLabel
        Left = 12
        Top = 55
        Width = 60
        Height = 16
        Caption = 'Setelah Disc'
      end
      object lblHJ: TLabel
        Left = 108
        Top = 2
        Width = 52
        Height = 16
        Caption = 'Harga Jual'
      end
      object lblMU: TLabel
        Left = 235
        Top = 2
        Width = 59
        Height = 16
        Caption = 'Mark Up (%)'
      end
      object lblHJPPN: TLabel
        Left = 12
        Top = 80
        Width = 83
        Height = 16
        Caption = 'Harga Jual + PPN'
      end
      object lblNamaBarang: TLabel
        Left = 339
        Top = 2
        Width = 65
        Height = 16
        Caption = 'Nama Barang'
      end
      object edHJBelumDisc: TcxCurrencyEdit
        Left = 108
        Top = 24
        Enabled = False
        TabOrder = 0
        Width = 121
      end
      object edHGSetelahDisc: TcxCurrencyEdit
        Left = 108
        Top = 50
        Enabled = False
        TabOrder = 1
        Width = 121
      end
      object edMarkUpSebelum: TcxCurrencyEdit
        Left = 235
        Top = 24
        Enabled = False
        TabOrder = 2
        Width = 68
      end
      object edMarkUpSesudah: TcxCurrencyEdit
        Left = 235
        Top = 50
        Enabled = False
        TabOrder = 3
        Width = 68
      end
      object edHJPPN: TcxCurrencyEdit
        Left = 108
        Top = 76
        EditValue = 100.000000000000000000
        Enabled = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 121
      end
      object edNamaBarang: TcxTextEdit
        Left = 339
        Top = 24
        Enabled = False
        TabOrder = 5
        Text = 'edNamaBarang'
        Width = 342
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 423
    Width = 854
    ExplicitTop = 423
    ExplicitWidth = 700
    inherited pnlFooter: TPanel
      Width = 854
      ExplicitWidth = 700
      inherited btnClose: TcxButton
        Left = 777
        Action = actCancel
        ExplicitLeft = 623
      end
      inherited btnSave: TcxButton
        Left = 684
        Action = actSave
        ExplicitLeft = 530
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 607
        Action = actPrint
        ExplicitLeft = 453
      end
    end
    inherited pnlSortCut: TPanel
      Width = 854
      ExplicitWidth = 700
      inherited lbCTRLEnter: TLabel
        Left = 679
        Height = 15
        ExplicitLeft = 525
      end
      inherited lbEscape: TLabel
        Left = 770
        Height = 15
        ExplicitLeft = 616
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 603
        Height = 15
        ExplicitLeft = 449
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Top = 72
  end
end
