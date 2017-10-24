inherited frmInvoice: TfrmInvoice
  Left = 296
  Top = 116
  Caption = 'Invoice'
  ClientHeight = 494
  ClientWidth = 643
  OldCreateOrder = True
  ExplicitWidth = 659
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 643
    Height = 405
    ExplicitWidth = 643
    ExplicitHeight = 311
    inherited pgcBrowse: TcxPageControl
      Top = 223
      Width = 641
      Height = 140
      TabOrder = 2
      ExplicitTop = 223
      ExplicitWidth = 641
      ExplicitHeight = 46
      ClientRectBottom = 139
      ClientRectRight = 640
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 639
        ExplicitHeight = 44
        inherited cxGrid: TcxGrid
          Width = 639
          Height = 138
          ExplicitWidth = 639
          ExplicitHeight = 44
          inherited cxGridView: TcxGridDBTableView
            object cxcolCode: TcxGridDBColumn
              Caption = 'PRODUCT CODE'
              Width = 83
            end
            object cxcolDESCRIPTION: TcxGridDBColumn
              Caption = 'DESCRIPTION'
              Width = 168
            end
            object cxcolQTY: TcxGridDBColumn
              Caption = 'QTY'
            end
            object cxcolUOM: TcxGridDBColumn
              Caption = 'UOM'
            end
            object cxcolHARGA: TcxGridDBColumn
              Caption = 'HARGA'
              Width = 75
            end
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 641
      Height = 222
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 76
        Height = 16
        Caption = 'Customer Code'
      end
      object lbl2: TLabel
        Left = 8
        Top = 33
        Width = 60
        Height = 16
        Caption = 'Suplier code'
      end
      object lbl3: TLabel
        Left = 8
        Top = 59
        Width = 70
        Height = 16
        Caption = 'Agreement No'
      end
      object lbl4: TLabel
        Left = 376
        Top = 59
        Width = 80
        Height = 16
        Caption = 'Total Agreement'
      end
      object lbl5: TLabel
        Left = 8
        Top = 96
        Width = 78
        Height = 16
        Caption = 'No. Of Schedule'
      end
      object lbl6: TLabel
        Left = 8
        Top = 120
        Width = 64
        Height = 16
        Caption = 'Invoice Date'
      end
      object lbl7: TLabel
        Left = 8
        Top = 147
        Width = 53
        Height = 16
        Caption = 'Invoice No'
      end
      object lbl9: TLabel
        Left = 8
        Top = 192
        Width = 68
        Height = 16
        Caption = 'Invoice Desc.'
      end
      object lbl10: TLabel
        Left = 408
        Top = 96
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl11: TLabel
        Left = 408
        Top = 120
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lbl12: TLabel
        Left = 408
        Top = 144
        Width = 34
        Height = 16
        Caption = 'PPH 23'
      end
      object lbl13: TLabel
        Left = 408
        Top = 168
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object edtCustomer: TEdit
        Left = 224
        Top = 8
        Width = 385
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtSuplier: TEdit
        Left = 224
        Top = 33
        Width = 385
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object dtRecv: TcxDateEdit
        Left = 96
        Top = 122
        TabOrder = 9
        Width = 137
      end
      object edtInvoiceNo: TEdit
        Left = 96
        Top = 147
        Width = 137
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object edtInvoiceDesc: TEdit
        Left = 96
        Top = 192
        Width = 361
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 14
      end
      object edtStatusInvoice: TEdit
        Left = 464
        Top = 192
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 15
      end
      object btnViewInvoice: TcxButton
        Left = 240
        Top = 146
        Width = 105
        Height = 27
        Cursor = crHandPoint
        Caption = 'View Invoice'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E000000000000000000007F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00
          FF003250003250FF00FFBFBFBFFFFFFFBFBFBF7F7F7F9F9F9F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF7F7F7F7F7F7FFF00FFBFBFBFDCDCDC
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FF003D
          B90033FF0099CC003250BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBF606060003DB90033
          FFB1C7FF0055FF0032507F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF003DB90033FFB1C7
          FF0055FF0033FF0032509F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCDCDCDCDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF003DB90033FFB1C7FF0055
          FF0033FF003250FF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFBFBFBFFFFFFF
          DCDCDCDCDCDCBFBFBFFF9900CC6600CC6600CC6600BFBFBFBFBFBF0055FF0033
          FF003250FF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F
          7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFBFBFBFFFFFFF
          DCDCDCBFBFBFFF9900DE9A3EDE9A3EDE9A3ED78300CC66009F9F9F7F7F7F0032
          50FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFF9900DE9A3EFFCC99FFCC99FFCC99DE9A3ED78300663333003250FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCFF9900FFE2B4FFE2B4FFE2B4FFCC99FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFF9900FFE2B4FFFFDEFFFFFFFFE2B4FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCFF9900DE9A3EFFFFFFFFFFDEFFE2B4FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FDCDCDCFF00FFFF00FFFF
          00FFBFBFBFBFBFBF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFDCDCDCCC6600DE9A3EFFE2B4FFE2B4DE9A3E6633337F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF9F9F9FDCDCDCFFFFFFFF
          FFFFFFFFFF7F7F7FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFFFFFFDCDCDCCC6600663333663333663333BFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF9F9F9F9F9F9F7F
          7F7F7F7F7FFF00FFBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFDCDCDCFFFFFFDCDCDCDCDCDCDCDCDC7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFC0C0C0FFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9F
          9F9F7F7F7F9F9F9FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 11
        OnClick = btnViewInvoiceClick
      end
      object edbCustomerCode: TcxButtonEdit
        Left = 96
        Top = 5
        Properties.Buttons = <
          item
            Caption = '..'
            Kind = bkText
          end>
        TabOrder = 0
        Text = '0'
        OnKeyPress = edbCustomerCodeKeyPress
        OnKeyUp = edbCustomerCodeKeyUp
        Width = 124
      end
      object edbSupplierCode: TcxButtonEdit
        Left = 96
        Top = 33
        Properties.Buttons = <
          item
            Caption = '..'
            Kind = bkText
          end>
        TabOrder = 2
        Text = '0'
        OnKeyUp = edbSupplierCodeKeyUp
        Width = 124
      end
      object edbAgreementNo: TcxButtonEdit
        Left = 96
        Top = 59
        Properties.Buttons = <
          item
            Caption = '..'
            Kind = bkText
          end>
        TabOrder = 4
        Text = '0'
        OnKeyUp = edbAgreementNoKeyUp
        Width = 124
      end
      object curredtTotalAgreement: TcxCurrencyEdit
        Left = 464
        Top = 59
        ParentFont = False
        TabOrder = 5
        Width = 145
      end
      object edbInvoiceSchedule: TcxButtonEdit
        Left = 96
        Top = 96
        Properties.Buttons = <>
        TabOrder = 6
        Text = '0'
        OnKeyUp = edbInvoiceScheduleKeyUp
        Width = 65
      end
      object curredtTotalSubTotal: TcxCurrencyEdit
        Left = 464
        Top = 96
        ParentFont = False
        TabOrder = 7
        Width = 121
      end
      object curredtTotalPPN: TcxCurrencyEdit
        Left = 464
        Top = 120
        ParentFont = False
        TabOrder = 8
        Width = 121
      end
      object curredtTotalPPH23: TcxCurrencyEdit
        Left = 464
        Top = 144
        ParentFont = False
        TabOrder = 10
        Width = 121
      end
      object curredtTotal: TcxCurrencyEdit
        Left = 464
        Top = 168
        ParentFont = False
        TabOrder = 13
        Width = 121
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 363
      Width = 641
      Height = 41
      Align = alBottom
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 269
      object lbl14: TLabel
        Left = 5
        Top = 9
        Width = 28
        Height = 16
        Caption = 'Desc.'
      end
      object edtDescription: TEdit
        Left = 36
        Top = 11
        Width = 477
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 643
    ExplicitWidth = 643
    inherited lblHeader: TLabel
      Width = 43
      Caption = 'INVOICE'
      ExplicitWidth = 43
    end
    inherited lblFilterData: TcxLabel
      Left = 289
      ExplicitLeft = 289
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 350
      ExplicitLeft = 350
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 466
      ExplicitLeft = 466
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 561
      ExplicitLeft = 561
    end
    inherited lblsdFilter: TcxLabel
      Left = 442
      ExplicitLeft = 442
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 438
    Width = 643
    ExplicitTop = 344
    ExplicitWidth = 643
    inherited pnlFooter: TPanel
      Width = 643
      ExplicitWidth = 643
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
        Left = 566
        Action = actClose
        ExplicitLeft = 566
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 643
      ExplicitWidth = 643
      inherited lbEscape: TLabel
        Left = 569
        Height = 17
        ExplicitLeft = 569
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
