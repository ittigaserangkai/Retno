inherited frmDialogCrazyPrice: TfrmDialogCrazyPrice
  Caption = 'Dialog Crazy Price'
  ClientHeight = 479
  ClientWidth = 960
  ExplicitLeft = 5
  ExplicitTop = -123
  ExplicitWidth = 976
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 960
    Height = 423
    ExplicitWidth = 854
    ExplicitHeight = 423
    object cxgrdCP: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 950
      Height = 303
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 844
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
          Width = 140
        end
        object cxGridColCPOrgID: TcxGridColumn
          AlternateCaption = 'CRAZY_ORGANIZATION'
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
          AlternateCaption = 'CRAZY_BARANG'
          Caption = 'PLUID'
          Visible = False
        end
        object cxGridColCPSatuan: TcxGridColumn
          AlternateCaption = 'CRAZY_SATUAN'
          Caption = 'Satuan'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnValidate = cxGridColCPSatuanPropertiesValidate
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPPeriodeMulai: TcxGridColumn
          AlternateCaption = 'CRAZY_START_DATE'
          Caption = 'Periode Awal'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object cxGridColCPPeriodeAkhir: TcxGridColumn
          AlternateCaption = 'CRAZY_END_DATE'
          Caption = 'Periode Akhir'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object cxGridColCPCOGS: TcxGridColumn
          AlternateCaption = 'CRAZY_COGS'
          Caption = 'COGS'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPPPN: TcxGridColumn
          AlternateCaption = 'CRAZY_PPN'
          Caption = 'PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPDisc: TcxGridColumn
          AlternateCaption = 'CRAZY_DISC_PERSEN'
          Caption = 'Disc %'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPMarkUp: TcxGridColumn
          AlternateCaption = 'CRAZY_MARKUP'
          Caption = 'Mark Up'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSellpriceDisc: TcxGridColumn
          AlternateCaption = 'CRAZY_SELLPRICE_DISC'
          Caption = 'Setelah Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object cxGridColCPSellPriceDiscPPN: TcxGridColumn
          AlternateCaption = 'CRAZY_SELLPRICE_PPN'
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
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColCPBHJSellpriceDisc: TcxGridColumn
          Caption = 'BHJ Sellprice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Visible = False
        end
        object cxGridColCPBHJSellpriceDiscPPN: TcxGridColumn
          Caption = 'BHJ Sellprice PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Visible = False
        end
        object cxGridColCPTglInput: TcxGridColumn
          AlternateCaption = 'CRAZY_DATE'
          Caption = 'Tgl Input'
          PropertiesClassName = 'TcxDateEditProperties'
          Visible = False
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
      Width = 950
      Height = 104
      Align = alBottom
      TabOrder = 1
      ExplicitWidth = 844
      object lblSebelumDisc: TLabel
        Left = 32
        Top = 28
        Width = 63
        Height = 16
        Caption = 'Sebelum Disc'
      end
      object lblSetelahDisc: TLabel
        Left = 35
        Top = 54
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
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 0
        Width = 121
      end
      object edHJSetelahDisc: TcxCurrencyEdit
        Left = 108
        Top = 50
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 1
        Width = 121
      end
      object edMarkUpSebelum: TcxCurrencyEdit
        Left = 235
        Top = 24
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 2
        Width = 68
      end
      object edMarkUpSesudah: TcxCurrencyEdit
        Left = 235
        Top = 50
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 3
        Width = 68
      end
      object edHJPPN: TcxCurrencyEdit
        Left = 108
        Top = 76
        EditValue = 100.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
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
    Width = 960
    ExplicitTop = 423
    ExplicitWidth = 854
    inherited pnlFooter: TPanel
      Width = 960
      ExplicitWidth = 854
      inherited btnClose: TcxButton
        Left = 883
        Action = actCancel
        ExplicitLeft = 777
      end
      inherited btnSave: TcxButton
        Left = 790
        Action = actSave
        ExplicitLeft = 684
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 713
        Action = actPrint
        ExplicitLeft = 607
      end
    end
    inherited pnlSortCut: TPanel
      Width = 960
      ExplicitWidth = 854
      inherited lbCTRLEnter: TLabel
        Left = 785
        Height = 15
        ExplicitLeft = 679
      end
      inherited lbEscape: TLabel
        Left = 876
        Height = 15
        ExplicitLeft = 770
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 709
        Height = 15
        ExplicitLeft = 603
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Top = 72
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
