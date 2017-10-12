inherited frmDialogCustomerInvoice: TfrmDialogCustomerInvoice
  Caption = 'Dialog Customer Invoice'
  ClientHeight = 502
  ClientWidth = 805
  ExplicitWidth = 821
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 805
    Height = 446
    ExplicitWidth = 805
    ExplicitHeight = 446
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 795
      Height = 116
      Align = alTop
      TabOrder = 0
      object lblNoBukti: TLabel
        Left = 22
        Top = 7
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object lblTanggal: TLabel
        Left = 27
        Top = 34
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lblOrganizasi: TLabel
        Left = 11
        Top = 61
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblKeteranan: TLabel
        Left = 294
        Top = 61
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblRekening: TLabel
        Left = 307
        Top = 34
        Width = 45
        Height = 16
        Caption = 'Rekening'
      end
      object lblNoRef: TLabel
        Left = 299
        Top = 7
        Width = 53
        Height = 16
        Caption = 'No Invoice'
      end
      object edOrganizationName: TcxButtonEdit
        Left = 78
        Top = 84
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 6
        Width = 199
      end
      object edNoBukti: TcxButtonEdit
        Tag = 1
        Left = 78
        Top = 3
        HelpType = htKeyword
        HelpKeyword = 'No Bukti'
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 0
        Text = 'Otomatis'
        Width = 199
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 78
        Top = 57
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
        TabOrder = 2
        Width = 199
      end
      object dtTanggal: TcxDateEdit
        Tag = 1
        Left = 78
        Top = 30
        HelpType = htKeyword
        HelpKeyword = 'Tanggal'
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        TabOrder = 1
        Width = 199
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 360
        Top = 57
        Properties.ScrollBars = ssVertical
        TabOrder = 5
        Height = 51
        Width = 360
      end
      object cbbRekPiutangLain: TcxExtLookupComboBox
        Tag = 1
        Left = 360
        Top = 30
        Properties.OnValidate = cbbRekPiutangLainPropertiesValidate
        TabOrder = 4
        Width = 160
      end
      object edNoRef: TcxButtonEdit
        Tag = 1
        Left = 360
        Top = 3
        HelpType = htKeyword
        HelpKeyword = 'No Invoice'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 3
        Width = 160
      end
      object cbbRekPiutangLainNama: TcxExtLookupComboBox
        Tag = 1
        Left = 522
        Top = 30
        Enabled = False
        TabOrder = 7
        Width = 198
      end
    end
    object cxgrdDetail: TcxGrid
      Left = 2
      Top = 124
      Width = 801
      Height = 320
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridTableARNew: TcxGridTableView
        Tag = 1
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColARNominal
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterInsert = cxGridTableARNewDataControllerAfterInsert
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColARRekening: TcxGridColumn
          Tag = 1
          AlternateCaption = 'CIPARNEW_REKENING'
          Caption = 'Kode'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.OnValidate = cxGridColARRekeningPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 133
        end
        object cxGridColARRekeningNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ReadOnly = False
          Properties.OnValidate = cxGridColARRekeningNamaPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 214
        end
        object cxGridColARKeterangan: TcxGridColumn
          Tag = 1
          AlternateCaption = 'CIPARNEW_DESCRIPTION'
          Caption = 'Keterangan'
          HeaderAlignmentHorz = taCenter
          Width = 213
        end
        object cxGridColARNominal: TcxGridColumn
          Tag = 1
          AlternateCaption = 'CIPARNEW_NOMINAL'
          Caption = 'Nominal'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 151
        end
      end
      object cxgrdlvlAPList: TcxGridLevel
        Caption = 'Detail Tagihan'
        GridView = cxGridTableARNew
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 446
    Width = 805
    ExplicitTop = 446
    ExplicitWidth = 805
    inherited pnlFooter: TPanel
      Width = 805
      ExplicitWidth = 805
      inherited btnClose: TcxButton
        Left = 728
        Action = actCancel
        ExplicitLeft = 728
      end
      inherited btnSave: TcxButton
        Left = 635
        Action = actSave
        ExplicitLeft = 635
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 558
        Action = actPrint
        ExplicitLeft = 558
      end
    end
    inherited pnlSortCut: TPanel
      Width = 805
      ExplicitWidth = 805
      inherited lbCTRLEnter: TLabel
        Left = 630
        Height = 15
        ExplicitLeft = 630
      end
      inherited lbEscape: TLabel
        Left = 721
        Height = 15
        ExplicitLeft = 721
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 554
        Height = 15
        ExplicitLeft = 554
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 632
    Top = 240
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
