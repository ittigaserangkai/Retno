inherited frmAgingPiutang: TfrmAgingPiutang
  Caption = 'Aging Piutang'
  ClientHeight = 408
  ClientWidth = 726
  ExplicitWidth = 742
  ExplicitHeight = 447
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 726
    Height = 319
    ExplicitWidth = 726
    ExplicitHeight = 319
    inherited pgcBrowse: TcxPageControl
      Width = 724
      Height = 317
      ExplicitWidth = 724
      ExplicitHeight = 317
      ClientRectBottom = 316
      ClientRectRight = 723
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 722
        ExplicitHeight = 315
        inherited cxGrid: TcxGrid
          Width = 722
          Height = 315
          ExplicitWidth = 722
          ExplicitHeight = 315
          inherited cxGridView: TcxGridDBTableView
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridColBelumJatuhTemp
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridCol1_7
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridCol8_14
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridCol15_21
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridCol22_28
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridColLebihBesar28
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = cxGridColTotal
              end>
            OptionsView.Footer = True
            object cxGridColOrgCode: TcxGridDBColumn
              DataBinding.FieldName = 'ORG_CODE'
            end
            object cxGridColOrgName: TcxGridDBColumn
              DataBinding.FieldName = 'ORG_NAME'
            end
            object cxGridColTOP: TcxGridDBColumn
              DataBinding.FieldName = 'ORG_TOP'
            end
            object cxGridColBelumJatuhTemp: TcxGridDBColumn
              DataBinding.FieldName = 'Belum Jatuh Tempo'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
            object cxGridCol1_7: TcxGridDBColumn
              DataBinding.FieldName = '1-7 Hari'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
            object cxGridCol8_14: TcxGridDBColumn
              DataBinding.FieldName = '8-14 Hari'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
            object cxGridCol15_21: TcxGridDBColumn
              DataBinding.FieldName = '15-21 Hari'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
            object cxGridCol22_28: TcxGridDBColumn
              DataBinding.FieldName = '22-28 Hari'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
            object cxGridColLebihBesar28: TcxGridDBColumn
              DataBinding.FieldName = '> 28'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
            object cxGridColTotal: TcxGridDBColumn
              DataBinding.FieldName = 'TOTAL'
              PropertiesClassName = 'TcxCurrencyEditProperties'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 726
    ExplicitWidth = 726
    inherited lblHeader: TLabel
      Width = 83
      Caption = 'AGING PIUTANG'
      ExplicitWidth = 83
    end
    inherited lblFilterData: TcxLabel
      Left = 336
      ExplicitLeft = 336
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 397
      ExplicitLeft = 397
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 549
      ExplicitLeft = 549
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 644
      ExplicitLeft = 644
    end
    inherited lblsdFilter: TcxLabel
      Left = 489
      Caption = 'Periode '
      ExplicitLeft = 489
      ExplicitWidth = 57
      Width = 57
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 352
    Width = 726
    ExplicitTop = 352
    ExplicitWidth = 726
    inherited pnlFooter: TPanel
      Width = 726
      ExplicitWidth = 726
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 649
        Action = actClose
        ExplicitLeft = 649
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 726
      ExplicitWidth = 726
      inherited lbEscape: TLabel
        Left = 652
        Height = 17
        ExplicitLeft = 652
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
