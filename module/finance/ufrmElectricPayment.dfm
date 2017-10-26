inherited frmElectricPayment: TfrmElectricPayment
  Left = 213
  Top = 171
  Caption = 'Electric Payment'
  ClientHeight = 447
  ClientWidth = 633
  OldCreateOrder = True
  ExplicitWidth = 649
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 633
    Height = 358
    ExplicitWidth = 120
    ExplicitHeight = 300
    inherited pgcBrowse: TcxPageControl
      Top = 231
      Width = 631
      Height = 126
      TabOrder = 1
      ExplicitTop = 231
      ExplicitWidth = 118
      ExplicitHeight = 68
      ClientRectBottom = 125
      ClientRectRight = 630
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 66
        inherited cxGrid: TcxGrid
          Width = 629
          Height = 124
          ExplicitWidth = 116
          ExplicitHeight = 66
          inherited cxGridView: TcxGridDBTableView
            object cxcolNo: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcolBankAccount: TcxGridDBColumn
              Caption = 'Bank Account No'
            end
            object cxcolDocument: TcxGridDBColumn
              Caption = 'Document No'
            end
            object cxcolReceiptDate: TcxGridDBColumn
              Caption = 'Receipt Date'
            end
            object cxcolAmount: TcxGridDBColumn
              Caption = 'Amount'
            end
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 631
      Height = 230
      Align = alTop
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 118
      object lbl6: TLabel
        Left = 20
        Top = 15
        Width = 76
        Height = 16
        Caption = 'Customer Code'
      end
      object lbl1: TLabel
        Left = 20
        Top = 75
        Width = 57
        Height = 16
        Caption = 'Invoice No.'
      end
      object lbl4: TLabel
        Left = 20
        Top = 75
        Width = 65
        Height = 16
        Caption = 'Receipt Date'
      end
      object lbl5: TLabel
        Left = 250
        Top = 75
        Width = 58
        Height = 16
        Caption = 'Payment No'
      end
      object lbl8: TLabel
        Left = 20
        Top = 105
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl11: TLabel
        Left = 20
        Top = 164
        Width = 77
        Height = 16
        Caption = 'Amount Invoice'
      end
      object lbl12: TLabel
        Left = 20
        Top = 194
        Width = 82
        Height = 16
        Caption = 'Amount Payment'
      end
      object lbl2: TLabel
        Left = 20
        Top = 45
        Width = 53
        Height = 16
        Caption = 'Invoice No'
      end
      object lbl3: TLabel
        Left = 20
        Top = 133
        Width = 67
        Height = 16
        Caption = 'Bank Account'
      end
      object cbpCustomerCode: TcxExtLookupComboBox
        Left = 115
        Top = 15
        TabOrder = 0
        Width = 125
      end
      object edtCustomerName: TEdit
        Left = 250
        Top = 15
        Width = 337
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtPaymentNo: TEdit
        Left = 325
        Top = 75
        Width = 161
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtDescription: TEdit
        Left = 115
        Top = 105
        Width = 370
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtAmountInvoice: TcxCurrencyEdit
        Left = 115
        Top = 164
        TabOrder = 8
        Width = 125
      end
      object edtTotalPayment: TcxCurrencyEdit
        Left = 115
        Top = 194
        TabOrder = 4
        Width = 125
      end
      object cbpInvoiceNo: TcxExtLookupComboBox
        Left = 115
        Top = 45
        TabOrder = 5
        Width = 125
      end
      object dtpRecv: TDateTimePicker
        Left = 115
        Top = 75
        Width = 125
        Height = 24
        Date = 39380.000000000000000000
        Time = 39380.000000000000000000
        TabOrder = 1
      end
      object cbpBankAccount: TcxExtLookupComboBox
        Left = 115
        Top = 133
        TabOrder = 7
        Width = 125
      end
      object edtBankAccount: TEdit
        Left = 250
        Top = 133
        Width = 337
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
      end
      object btnShow: TcxButton
        Left = 262
        Top = 192
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show'
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
        TabOrder = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 633
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 91
      Caption = 'Electric Payment'
      ExplicitWidth = 91
    end
    inherited lblFilterData: TcxLabel
      Left = 279
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 340
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 456
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 551
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 432
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 391
    Width = 633
    ExplicitTop = -110
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 633
      ExplicitWidth = 120
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
        Left = 556
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 633
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 559
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
