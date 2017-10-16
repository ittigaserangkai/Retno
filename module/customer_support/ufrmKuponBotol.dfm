inherited frmKuponBotol: TfrmKuponBotol
  Left = 353
  Top = 279
  Caption = 'Transaksi Kupon Botol'
  ClientHeight = 361
  ClientWidth = 709
  Position = poDesigned
  ExplicitWidth = 725
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 147
    Width = 709
    Height = 158
    ExplicitTop = 147
    ExplicitWidth = 747
    ExplicitHeight = 200
    inherited pgcBrowse: TcxPageControl
      Width = 707
      Height = 156
      ExplicitWidth = 745
      ExplicitHeight = 198
      ClientRectBottom = 155
      ClientRectRight = 706
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 743
        ExplicitHeight = 196
        inherited cxGrid: TcxGrid
          Width = 705
          Height = 154
          ExplicitWidth = 743
          ExplicitHeight = 196
          object cxGridViewDetail: TcxGridTableView [1]
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Position = spFooter
                Column = colTotal
              end
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = colTotal
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;(,0.00)'
                Kind = skSum
                Column = colTotal
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object colPLU: TcxGridColumn
              Caption = 'PLU'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 37
            end
            object colProductName: TcxGridColumn
              Caption = 'PRODUCT NAME'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 98
            end
            object colUoM: TcxGridColumn
              Caption = 'UOM'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 40
            end
            object colQty: TcxGridColumn
              Caption = 'QTY'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.##;(,0.##)'
              Properties.ReadOnly = True
              Properties.SpinButtons.Visible = False
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 40
            end
            object colSellPrice: TcxGridColumn
              Caption = 'SELL PRICE'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Properties.SpinButtons.Visible = False
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 73
            end
            object colDisc: TcxGridColumn
              Caption = 'DISC'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.##;(,0.##)'
              Properties.ReadOnly = True
              Properties.SpinButtons.Visible = False
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 40
            end
            object colSellPriceDisc: TcxGridColumn
              Caption = 'SELL PRICE DISC'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Properties.SpinButtons.Visible = False
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 99
            end
            object colTotal: TcxGridColumn
              Caption = 'TOTAL'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Properties.SpinButtons.Visible = False
              HeaderAlignmentHorz = taCenter
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 51
            end
          end
          inherited cxlvMaster: TcxGridLevel
            GridView = cxGridViewDetail
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 709
    ExplicitWidth = 747
    inherited lblFilterData: TcxLabel
      Left = 355
      ExplicitLeft = 393
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 416
      ExplicitLeft = 454
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 532
      ExplicitLeft = 570
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 627
      ExplicitLeft = 665
    end
    inherited lblsdFilter: TcxLabel
      Left = 508
      ExplicitLeft = 546
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 305
    Width = 709
    ExplicitTop = -56
    ExplicitWidth = 747
    inherited pnlFooter: TPanel
      Width = 709
      ExplicitWidth = 747
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
        Left = 632
        Action = actClose
        ExplicitLeft = 670
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 709
      ExplicitWidth = 747
      inherited lbEscape: TLabel
        Left = 635
        Height = 17
        ExplicitLeft = 673
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 33
    Width = 709
    Height = 114
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    ExplicitLeft = -8
    ExplicitTop = 35
    ExplicitWidth = 736
    object cxLabel1: TcxLabel
      Left = 8
      Top = 6
      Caption = 'Date'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 32
      Caption = 'Voucher No'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 58
      Caption = 'Member Code'
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 8
      Top = 84
      Caption = 'member name'
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 356
      Top = 6
      Caption = 'POS Trans. No'
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 356
      Top = 32
      Caption = 'Status'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 356
      Top = 58
      Caption = 'Description'
      Transparent = True
    end
    object dtpTanggal: TcxDateEdit
      Left = 88
      Top = 5
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      Width = 89
    end
    object edTransactionNo: TcxButtonEdit
      Left = 88
      Top = 31
      Hint = '[Input Voucher No.]'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = edTransactionNoPropertiesButtonClick
      TabOrder = 8
      Text = '[Input Voucher No.]'
      Width = 137
    end
    object edtKodeMember: TcxTextEdit
      Left = 88
      Top = 57
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 9
      Width = 137
    end
    object edtMemberName: TcxTextEdit
      Left = 88
      Top = 83
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 10
      Width = 265
    end
    object edtPOSTransNo: TcxTextEdit
      Left = 435
      Top = 5
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 11
      Width = 137
    end
    object edtStatus: TcxTextEdit
      Left = 435
      Top = 31
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 12
      Width = 137
    end
    object edtKeterangan: TcxTextEdit
      Left = 435
      Top = 57
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 13
      Width = 265
    end
    object cxLabel8: TcxLabel
      Left = 359
      Top = 83
      Caption = 'Total Price'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object curredtTotalPrice: TcxCurrencyEdit
      Left = 435
      Top = 83
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 15
      Width = 137
    end
  end
  inherited actlstBrowse: TActionList
    Left = 632
    Top = 40
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
