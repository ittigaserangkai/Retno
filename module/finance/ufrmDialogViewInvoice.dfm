inherited frmDialogViewInvoice: TfrmDialogViewInvoice
  Left = 207
  Top = 131
  Caption = 'View Invoice'#39
  ClientHeight = 425
  ClientWidth = 662
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 678
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 662
    Height = 369
    BorderWidth = 10
    ExplicitWidth = 662
    ExplicitHeight = 369
    object pnl1: TPanel
      Left = 12
      Top = 12
      Width = 638
      Height = 213
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 53
        Height = 16
        Caption = 'Invoice No'
      end
      object lbl2: TLabel
        Left = 8
        Top = 32
        Width = 48
        Height = 16
        Caption = 'Customer'
      end
      object lbl3: TLabel
        Left = 8
        Top = 56
        Width = 74
        Height = 16
        Caption = 'Agreement No.'
      end
      object lbl4: TLabel
        Left = 400
        Top = 56
        Width = 80
        Height = 16
        Caption = 'Total Agreement'
      end
      object lbl5: TLabel
        Left = 8
        Top = 80
        Width = 63
        Height = 16
        Caption = 'Schedule No.'
      end
      object lbl6: TLabel
        Left = 144
        Top = 80
        Width = 64
        Height = 16
        Caption = 'Invoice Date'
      end
      object lbl10: TLabel
        Left = 432
        Top = 88
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl11: TLabel
        Left = 432
        Top = 112
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lbl12: TLabel
        Left = 432
        Top = 136
        Width = 34
        Height = 16
        Caption = 'PPH 23'
      end
      object lbl13: TLabel
        Left = 432
        Top = 160
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object lbl8: TLabel
        Left = 8
        Top = 104
        Width = 72
        Height = 16
        Caption = 'Invoice Status'
      end
      object lbl9: TLabel
        Left = 8
        Top = 184
        Width = 68
        Height = 16
        Caption = 'Invoice Desc.'
      end
      object edtInvoiceNo: TEdit
        Left = 88
        Top = 8
        Width = 249
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyUp = edtInvoiceNoKeyUp
      end
      object edtCustomer: TEdit
        Left = 88
        Top = 32
        Width = 545
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object btnSearch: TcxButton
        Left = 349
        Top = 5
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Caption = 'Search'
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
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnSearchClick
      end
      object edtAgreementNo: TEdit
        Left = 88
        Top = 56
        Width = 249
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object curredtTotalAgreement: TcxCurrencyEdit
        Left = 488
        Top = 56
        ParentFont = False
        TabOrder = 4
        Width = 145
      end
      object edtNoJadwal: TEdit
        Left = 88
        Top = 80
        Width = 33
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtInvoiceDate: TEdit
        Left = 216
        Top = 80
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object curredtTotal: TcxCurrencyEdit
        Left = 488
        Top = 160
        TabOrder = 7
        Width = 145
      end
      object curredtTotalPPH23: TcxCurrencyEdit
        Left = 488
        Top = 136
        TabOrder = 8
        Width = 145
      end
      object curredtTotalPPN: TcxCurrencyEdit
        Left = 488
        Top = 112
        TabOrder = 9
        Width = 145
      end
      object curredtTotalSubTotal: TcxCurrencyEdit
        Left = 488
        Top = 88
        TabOrder = 10
        Width = 145
      end
      object edtStatus: TEdit
        Left = 88
        Top = 104
        Width = 129
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object edtDescription: TEdit
        Left = 88
        Top = 184
        Width = 545
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
    end
    object pnl2: TPanel
      Left = 12
      Top = 225
      Width = 638
      Height = 132
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 1
      object cxGrid: TcxGrid
        Left = 11
        Top = 11
        Width = 616
        Height = 110
        Align = alClient
        TabOrder = 0
        LockedStateImageOptions.Text = 'Mohon ditunggu...'
        LookAndFeel.NativeStyle = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 698
        ExplicitHeight = 277
        object cxGridView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.DisplayMode = fpdmManual
          FindPanel.InfoText = 'ketik teks yang dicari...'
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 
            'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
            'er'
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          NewItemRow.InfoText = 'Baris baru'
          OptionsData.Editing = False
          OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxcolCode: TcxGridDBColumn
            Caption = 'PRODUCT CODE'
            Width = 89
          end
          object cxcolDescription: TcxGridDBColumn
            Caption = 'Description'
            Width = 164
          end
          object cxcolQTY: TcxGridDBColumn
            Caption = 'QTY'
          end
          object cxcolUOM: TcxGridDBColumn
            Caption = 'UOM'
          end
          object cxcolTotal: TcxGridDBColumn
            Caption = 'T O T A L'
          end
        end
        object cxlvMaster: TcxGridLevel
          GridView = cxGridView
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 369
    Width = 662
    ExplicitTop = 369
    ExplicitWidth = 662
    inherited pnlFooter: TPanel
      Width = 662
      ExplicitWidth = 662
      inherited btnClose: TcxButton
        Left = 585
        Action = actCancel
        Caption = 'Close'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF001950
          001950001950001950001950001950001950001950001950001950001950FF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FF007373009696
          66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF0019
          50FF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FF007373009696
          99FFFF9DDBFF99FFFF9DDBFF99FFFF9DDBFF9DDBFF9DDBFF9DDBFF66CCFF0019
          50FF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF007373FFFFFF
          00969699FFFF99FFFFFFFFFF99FFFF9DDBFF99FFFF9DDBFF9DDBFF9DDBFF66CC
          FF001950FF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF007373FFFFFF
          00969699FFFFFFFFFF99FFFFFFFFFF99FFFF9DDBFF99FFFF99FFFF9DDBFF9DDB
          FF001950FF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF007373FFFFFF
          99FFFF0096969DDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9DDBFF99FFFF9DDB
          FF66CCFF001950FF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF007373FFFFFF
          99FFFF0096960050500050500050500050500050500050500050500050500050
          50005050001950FF00FF7F7F7FFFFFFFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF007373FFFFFF
          99FFFF99FFFF99FFFF99FFFF9DDBFF99FFFF9DDBFF9DDBFF66CCFF007373FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF007373FFFFFF
          99FFFF99FFFF99FFFFFFFFFF007373007373007373007373007373001950FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFFFFFF7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF007373FFFFFF
          FFFFFFFFFFFFFFFFFF007373FF00FFFF00FFFF00FFFF00FF0000990000FF0019
          50FF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF00FFFF
          00FFFF00FFFFFFFF7F7F7FFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF007373
          007373007373007373FF00FFFF00FFFF00FFFF00FF0000994848FF4848FF0000
          FF001950FF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF
          00FFFFFFFF7F7F7FFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000996B8FFF4873FF4848FF4848
          FF0000FF001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000990000996B8FFF4873FF4848
          FF001950001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000996B8FFF4848FF4873
          FF001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000996B8FFF6B8FFF6B8F
          FF001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000990000990000990000
          99001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FF}
        ExplicitLeft = 585
      end
      inherited btnSave: TcxButton
        Left = 492
        Action = actSave
        Visible = False
        ExplicitLeft = 492
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 415
        Action = actPrint
        ExplicitLeft = 415
      end
    end
    inherited pnlSortCut: TPanel
      Width = 662
      ExplicitWidth = 662
      inherited lbCTRLEnter: TLabel
        Left = 487
        Height = 15
        ExplicitLeft = 487
      end
      inherited lbEscape: TLabel
        Left = 578
        Height = 15
        ExplicitLeft = 578
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 411
        Height = 15
        ExplicitLeft = 411
      end
    end
  end
end
