inherited frmDialogCrazyPrice: TfrmDialogCrazyPrice
  Caption = 'Dialog Crazy Price'
  ClientHeight = 479
  ClientWidth = 731
  ExplicitTop = -85
  ExplicitWidth = 747
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 731
    Height = 423
    ExplicitWidth = 731
    ExplicitHeight = 423
    object cxgrdCP: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 721
      Height = 303
      Align = alClient
      TabOrder = 0
      object cxGridTableCP: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditing = cxGridTableCPEditing
        OnFocusedRecordChanged = cxGridTableCPFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DataController.OnBeforeDelete = cxGridTableCPDataControllerBeforeDelete
        DataController.OnNewRecord = cxGridTableCPDataControllerNewRecord
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsData.DeletingConfirmation = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColCPCrazyPrice_ID: TcxGridColumn
          AlternateCaption = 'ID'
          Caption = 'CRAZYPRICE_ID'
          Visible = False
          Width = 88
        end
        object cxGridColCPKode: TcxGridColumn
          Caption = 'Kode [F5]'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.OnValidate = cxGridColCPKodePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
        object cxGridColCPNama: TcxGridColumn
          Caption = 'Nama'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 140
        end
        object cxGridColCPOrgID: TcxGridColumn
          AlternateCaption = 'CRAZY_ORGANIZATION'
          Caption = 'OrgID'
          Visible = False
        end
        object cxGridColCPPLU: TcxGridColumn
          Caption = 'PLU [F5]'
          PropertiesClassName = 'TcxTextEditProperties'
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
          Caption = 'UOM'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnInitPopup = cxGridColCPSatuanPropertiesInitPopup
          Properties.OnValidate = cxGridColCPSatuanPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object cxGridColCPCOGS: TcxGridColumn
          AlternateCaption = 'CRAZY_COGS'
          Caption = 'COGS'
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
          Properties.OnValidate = cxGridColCPDiscPropertiesValidate
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPMarkUp: TcxGridColumn
          AlternateCaption = 'CRAZY_MARKUP'
          Caption = 'Mark Up'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.OnValidate = cxGridColCPMarkUpPropertiesValidate
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSellprice: TcxGridColumn
          AlternateCaption = 'CRAZY_SELLPRICE'
          Caption = 'Setelah Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object cxGridColCPPPN: TcxGridColumn
          AlternateCaption = 'CRAZY_PPN'
          Caption = 'PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSellPriceDisc: TcxGridColumn
          AlternateCaption = 'CRAZY_SELLPRICE_DISC'
          Caption = 'Harga Jual'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.OnValidate = cxGridColCPSellPriceDiscPPNPropertiesValidate
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
          Caption = 'BHJ Sellprice_Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Visible = False
        end
        object cxGridColCPBHJSellprice: TcxGridColumn
          Caption = 'BHJ Sellprice'
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
        object cxGridColCPPeriodeMulai: TcxGridColumn
          AlternateCaption = 'CRAZY_START_DATE'
          Caption = 'Awal'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object cxGridColCPPeriodeAkhir: TcxGridColumn
          AlternateCaption = 'CRAZY_END_DATE'
          Caption = 'Akhir'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxGridColCPUOMBHJ: TcxGridColumn
          Caption = 'UOMBHJs'
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
      Width = 721
      Height = 104
      Align = alBottom
      TabOrder = 1
      object lblSebelumDisc: TLabel
        Left = 22
        Top = 28
        Width = 63
        Height = 16
        Caption = 'Sebelum Disc'
      end
      object lblSetelahDisc: TLabel
        Left = 25
        Top = 54
        Width = 60
        Height = 16
        Caption = 'Setelah Disc'
      end
      object lblHJ: TLabel
        Left = 98
        Top = 2
        Width = 52
        Height = 16
        Caption = 'Harga Jual'
      end
      object lblMU: TLabel
        Left = 225
        Top = 2
        Width = 59
        Height = 16
        Caption = 'Mark Up (%)'
      end
      object lblHJPPN: TLabel
        Left = 2
        Top = 80
        Width = 83
        Height = 16
        Caption = 'Harga Jual + PPN'
      end
      object lblNamaBarang: TLabel
        Left = 314
        Top = 28
        Width = 65
        Height = 16
        Caption = 'Nama Barang'
      end
      object lblPPN: TLabel
        Left = 632
        Top = 28
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lblCustomer: TLabel
        Left = 326
        Top = 54
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object edHJBelumDisc: TcxCurrencyEdit
        Left = 98
        Top = 24
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 0
        Width = 121
      end
      object edHJSetelahDisc: TcxCurrencyEdit
        Left = 98
        Top = 50
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 1
        Width = 121
      end
      object edMarkUpSebelum: TcxCurrencyEdit
        Left = 225
        Top = 24
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 2
        Width = 61
      end
      object edMarkUpSesudah: TcxCurrencyEdit
        Left = 225
        Top = 50
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 3
        Width = 61
      end
      object edHJPPN: TcxCurrencyEdit
        Left = 98
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
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 4
        Width = 121
      end
      object edNamaBarang: TcxTextEdit
        Left = 386
        Top = 24
        Enabled = False
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 5
        Width = 240
      end
      object edPPN: TcxCurrencyEdit
        Left = 657
        Top = 24
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 6
        Width = 46
      end
      object edOrganisasi: TcxTextEdit
        Left = 386
        Top = 50
        Enabled = False
        StyleDisabled.TextColor = clBackground
        StyleDisabled.TextStyle = [fsBold]
        TabOrder = 7
        Width = 317
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 423
    Width = 731
    ExplicitTop = 423
    ExplicitWidth = 731
    inherited pnlFooter: TPanel
      Width = 731
      ExplicitWidth = 731
      inherited btnClose: TcxButton
        Left = 654
        Action = actCancel
        ExplicitLeft = 654
      end
      inherited btnSave: TcxButton
        Left = 561
        Action = actSave
        ExplicitLeft = 561
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 484
        Action = actPrint
        ExplicitLeft = 484
      end
    end
    inherited pnlSortCut: TPanel
      Width = 731
      ExplicitWidth = 731
      inherited lbCTRLEnter: TLabel
        Left = 556
        Height = 15
        ExplicitLeft = 556
      end
      inherited lbEscape: TLabel
        Left = 647
        Height = 15
        ExplicitLeft = 647
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 480
        Height = 15
        ExplicitLeft = 480
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 488
    Top = 136
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
    object actLoadOrg: TAction
      Caption = 'actLookUp'
      ShortCut = 116
      OnExecute = actLoadOrgExecute
    end
  end
end
