inherited frmDialogCrazyPrice: TfrmDialogCrazyPrice
  Caption = 'Dialog Crazy Price'
  ClientHeight = 479
  ClientWidth = 700
  ExplicitWidth = 716
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 700
    Height = 423
    object cxgrdCP: TcxGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 690
      Height = 303
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
      end
      object cxgrdlvlCP: TcxGridLevel
        GridView = cxGridTableCP
      end
    end
    object pnlKeterangan: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 314
      Width = 690
      Height = 104
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 296
      ExplicitWidth = 696
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
      object edHJBelumDisc: TcxCurrencyEdit
        Left = 108
        Top = 24
        TabOrder = 0
        Width = 121
      end
      object edHGSetelahDisc: TcxCurrencyEdit
        Left = 108
        Top = 50
        TabOrder = 1
        Width = 121
      end
      object edMarkUpSebelum: TcxCurrencyEdit
        Left = 235
        Top = 24
        TabOrder = 2
        Width = 68
      end
      object edMarkUpSesudah: TcxCurrencyEdit
        Left = 235
        Top = 50
        TabOrder = 3
        Width = 68
      end
      object edHJPPN: TcxCurrencyEdit
        Left = 108
        Top = 76
        EditValue = 100.000000000000000000
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
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 423
    Width = 700
    inherited pnlFooter: TPanel
      Width = 700
      inherited btnClose: TcxButton
        Left = 623
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 530
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 453
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 700
      inherited lbCTRLEnter: TLabel
        Left = 525
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 616
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 449
        Height = 15
      end
    end
  end
end
