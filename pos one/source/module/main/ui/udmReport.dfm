object dmReport: TdmReport
  OldCreateOrder = False
  Left = 588
  Top = 169
  Height = 172
  Width = 231
  object frxDBDataset: TfrxDBDataset
    UserName = 'frDB'
    CloseDataSource = False
    Left = 32
    Top = 64
  end
  object pMainReport: TfrxReport
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39480.382272314800000000
    ReportOptions.LastChange = 39480.502150057880000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = pMainReportGetValue
    Left = 24
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frDB'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 296.700000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 1083.591251000000000000
        object Memo2: TfrxMemoView
          Width = 196.535560000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'PT. ASSALAM NIAGA UTAMA - SOLO')
        end
        object Memo3: TfrxMemoView
          Align = baCenter
          Left = 432.189255500000000000
          Top = 18.897650000000000000
          Width = 219.212740000000000000
          Height = 15.118120000000000000
          HAlign = haCenter
          Memo.Strings = (
            'LISTING ADJUSTMENT BY TRANSACTION')
        end
        object Line1: TfrxLineView
          Left = 430.866420000000000000
          Top = 37.795300000000000000
          Width = 219.212740000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Align = baCenter
          Left = 432.189255500000100000
          Top = 41.574830000000000000
          Width = 219.212740000000000000
          Height = 11.338590000000000000
          AutoWidth = True
          HAlign = haCenter
          Memo.Strings = (
            'Date From : [Param0] to [Param1]')
        end
        object Memo1: TfrxMemoView
          Left = 959.622667000000000000
          Top = 79.370130000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Page : [Page#]')
        end
        object Memo6: TfrxMemoView
          Left = 960.000620000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Code : ')
        end
        object Memo7: TfrxMemoView
          Left = 960.000620000000000000
          Top = 34.015770000000010000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Date : [Date #ddd/mm/yy]')
        end
        object Memo8: TfrxMemoView
          Left = 960.000620000000000000
          Top = 49.133889999999990000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Time : [Time]')
        end
        object Memo9: TfrxMemoView
          Left = 960.000620000000000000
          Top = 64.252010000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'User : [Param2]')
        end
        object Line2: TfrxLineView
          Top = 109.606370000000000000
          Width = 1080.945580000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Top = 139.842610000000000000
          Width = 1080.945580000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          Top = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Date')
        end
        object Memo11: TfrxMemoView
          Left = 75.590600000000000000
          Top = 109.606370000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Adjust. No')
        end
        object Memo12: TfrxMemoView
          Left = 154.960730000000000000
          Top = 109.606370000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Description')
        end
        object Memo13: TfrxMemoView
          Left = 154.960730000000000000
          Top = 124.724490000000000000
          Width = 355.275820000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Product Code & Name')
        end
        object Memo25: TfrxMemoView
          Left = 510.236550000000000000
          Top = 109.606370000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'PO No.')
        end
        object Memo26: TfrxMemoView
          Left = 589.606680000000000000
          Top = 109.606370000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Stock UOM')
        end
        object Memo27: TfrxMemoView
          Left = 699.213050000000000000
          Top = 109.606370000000000000
          Width = 52.913420000000000000
          Height = 30.236240000000000000
          HAlign = haRight
          Memo.Strings = (
            'Adjust Qty')
        end
        object Memo28: TfrxMemoView
          Left = 752.126470000000000000
          Top = 109.606370000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          HAlign = haRight
          Memo.Strings = (
            'Total Adjust')
        end
        object Memo29: TfrxMemoView
          Left = 865.512370000000000000
          Top = 109.606370000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Status')
        end
        object Memo31: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 109.606370000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          HAlign = haCenter
          Memo.Strings = (
            'Group')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 260.787570000000000000
        Width = 1083.591251000000000000
        DataSet = frxDBDataset
        DataSetName = 'frDB'
        RowCount = 0
        object Memo14: TfrxMemoView
          Left = 207.874150000000000000
          Width = 302.362400000000000000
          Height = 15.118120000000000000
          DataField = 'BRG_ALIAS'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDB."BRG_ALIAS"]')
        end
        object Memo15: TfrxMemoView
          Left = 154.960730000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataField = 'BRG_CODE'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDB."BRG_CODE"]')
        end
        object Memo18: TfrxMemoView
          Left = 510.236550000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'APD_NO_PO'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDB."APD_NO_PO"]')
        end
        object Memo19: TfrxMemoView
          Left = 589.606680000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataField = 'APD_SAT_CODE'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDB."APD_SAT_CODE"]')
        end
        object Memo20: TfrxMemoView
          Left = 619.842920000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'SAT_NAME'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDB."SAT_NAME"]')
        end
        object Memo21: TfrxMemoView
          Left = 699.213050000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[frDb."APD_QTY" #n%2,2n]')
        end
        object Memo22: TfrxMemoView
          Left = 755.906000000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[frDb."APD_TOTAL" #n%2,2n]')
        end
        object Memo24: TfrxMemoView
          Left = 929.764380000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDb."ADJPROD_DATE_POSTED" #ddd/mm/yy]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 15.118120000000000000
        Top = 222.992270000000000000
        Width = 1083.591251000000000000
        Condition = 'frDb."ADJPROD_NO"'
        object Memo16: TfrxMemoView
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDb."ADJPROD_DATE" #ddd/mm/yy]')
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'ADJPROD_NO'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          Memo.Strings = (
            '[frDB."ADJPROD_NO"]')
        end
        object Memo23: TfrxMemoView
          Left = 865.512370000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'ADJPROD_STATUS'
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[frDB."ADJPROD_STATUS"]')
        end
        object Memo30: TfrxMemoView
          Left = 929.764380000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          HAlign = haRight
          Memo.Strings = (
            'Date Posted')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1083.591251000000000000
        object Line4: TfrxLineView
          Left = 691.653990000000000000
          Width = 170.078850000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo32: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000022000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Sub Total   --->')
        end
        object Memo33: TfrxMemoView
          Left = 699.213050000000000000
          Top = 3.779530000000022000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDb."APD_QTY">) #n%2,2n]')
        end
        object Memo34: TfrxMemoView
          Left = 755.906000000000000000
          Top = 3.779530000000022000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDb."APD_TOTAL">) #n%2,2n]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 113.385900000000000000
        Top = 377.953000000000000000
        Width = 1083.591251000000000000
        object Line5: TfrxLineView
          Width = 1080.945580000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo35: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779530000000022000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Grant Total --->')
        end
        object Memo36: TfrxMemoView
          Left = 699.213050000000000000
          Top = 3.779530000000022000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDb."APD_QTY">) #n%2,2n]')
        end
        object Memo37: TfrxMemoView
          Left = 755.906000000000000000
          Top = 3.779530000000022000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset
          DataSetName = 'frDB'
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDb."APD_TOTAL">) #n%2,2n]')
        end
        object Memo38: TfrxMemoView
          Left = 15.118120000000000000
          Top = 22.677180000000020000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Yang Melakukan,')
        end
        object Memo39: TfrxMemoView
          Left = 139.842610000000000000
          Top = 22.677180000000020000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            'Yang Menyetujui,')
        end
        object Memo40: TfrxMemoView
          Left = 15.118120000000000000
          Top = 94.488250000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            '(_______________)')
        end
        object Memo41: TfrxMemoView
          Left = 136.063080000000000000
          Top = 94.488250000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Memo.Strings = (
            '(_______________)')
        end
        object Memo42: TfrxMemoView
          Left = 941.102970000000000000
          Top = 94.488250000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          HAlign = haCenter
          Memo.Strings = (
            '*** End Of Report ***')
        end
      end
    end
  end
  object frxeText: TfrxTXTExport
    ShowDialog = False
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = True
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = True
    LeadSpaces = True
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 88
    Top = 8
  end
  object frxlsxprt1: TfrxXLSExport
    ShowProgress = True
    AsText = False
    Background = True
    Left = 88
    Top = 64
  end
  object frxmlxprt1: TfrxXMLExport
    ShowProgress = True
    background = True
    Left = 136
    Top = 72
  end
end
