inherited frmDialogCrazyPrice: TfrmDialogCrazyPrice
  Caption = 'Dialog Crazy Price'
  ClientHeight = 457
  ClientWidth = 897
  ExplicitWidth = 913
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 897
    Height = 401
    object lblSebelumDisc: TLabel
      Left = 440
      Top = 240
      Width = 70
      Height = 16
      Caption = 'lblSebelumDisc'
    end
    object cxgrdCP: TcxGrid
      Left = 2
      Top = 2
      Width = 893
      Height = 294
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 288
      ExplicitTop = 104
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridTableCP: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
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
        object cxGridColCPKode: TcxGridColumn
          Caption = 'Kode'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPNama: TcxGridColumn
          Caption = 'Nama'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPPLU: TcxGridColumn
          Caption = 'PLU'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPNamaBarang: TcxGridColumn
          Caption = 'Nama Barang'
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxGridColSatuan: TcxGridColumn
          Caption = 'Satuan'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCOCOGS: TcxGridColumn
          Caption = 'COGS'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPDisc: TcxGridColumn
          Caption = 'Disc %'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSellpriceDisc: TcxGridColumn
          Caption = 'Setelah Disc'
          HeaderAlignmentHorz = taCenter
          Width = 71
        end
        object cxGridColCPPPN: TcxGridColumn
          Caption = 'PPN'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSellPriceDiscPPN: TcxGridColumn
          Caption = 'Setelah Disc + PPN'
          HeaderAlignmentHorz = taCenter
          Width = 94
        end
        object cxGridColCPMarkUp: TcxGridColumn
          Caption = 'Mark Up'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColCPSebelumDisc: TcxGridColumn
          Caption = 'Sell Price Sebelum'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object cxGridColSebelumDiscMarkUp: TcxGridColumn
          Caption = 'Mark Up Sebelum'
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColCPTglInput: TcxGridColumn
          Caption = 'Tgl Input'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
        end
      end
      object cxgrdlvlCP: TcxGridLevel
        GridView = cxGridTableCP
      end
    end
    object pnlKeterangan: TPanel
      Left = 2
      Top = 296
      Width = 893
      Height = 103
      Align = alBottom
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 401
    Width = 897
    inherited pnlFooter: TPanel
      Width = 897
      inherited btnClose: TcxButton
        Left = 820
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 727
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 650
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 897
      inherited lbCTRLEnter: TLabel
        Left = 722
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 813
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 646
        Height = 15
      end
    end
  end
end
