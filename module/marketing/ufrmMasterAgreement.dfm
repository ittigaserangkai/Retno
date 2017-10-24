inherited frmMasterAgreement: TfrmMasterAgreement
  Left = 165
  Top = 99
  Caption = 'Master Agreement'
  ClientHeight = 497
  ClientWidth = 758
  KeyPreview = True
  OldCreateOrder = True
  OnKeyUp = FormKeyUp
  ExplicitWidth = 774
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 758
    Height = 411
    ExplicitWidth = 758
    ExplicitHeight = 411
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 736
      Height = 198
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblInput: TLabel
        Left = 24
        Top = 34
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object lblComboGrid: TLabel
        Left = 24
        Top = 8
        Width = 76
        Height = 16
        Caption = 'Customer Code'
      end
      object lbl9: TLabel
        Left = 24
        Top = 62
        Width = 73
        Height = 16
        Caption = 'No. Agreement'
      end
      object lbl3: TLabel
        Left = 24
        Top = 89
        Width = 73
        Height = 16
        Caption = 'Effective Date'
      end
      object lbl10: TLabel
        Left = 24
        Top = 116
        Width = 64
        Height = 16
        Caption = 'Term Periode'
      end
      object lbl7: TLabel
        Left = 224
        Top = 118
        Width = 46
        Height = 16
        Caption = 'Invoice #'
      end
      object lbl8: TLabel
        Left = 24
        Top = 143
        Width = 45
        Height = 16
        Caption = 'Tax Code'
      end
      object lbl1: TLabel
        Left = 24
        Top = 171
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl11: TLabel
        Left = 248
        Top = 143
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lbl12: TLabel
        Left = 351
        Top = 143
        Width = 34
        Height = 16
        Caption = 'PPH 23'
      end
      object lblPeriode1: TLabel
        Left = 163
        Top = 118
        Width = 52
        Height = 16
        Caption = '/semester'
      end
      object lbl13: TLabel
        Left = 188
        Top = 89
        Width = 4
        Height = 16
        Caption = '-'
      end
      object lblF5: TLinkLabel
        Left = 282
        Top = 65
        Width = 147
        Height = 20
        Cursor = crHandPoint
        Caption = 'F5 for Search No. Agreement'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        TabOrder = 14
        OnClick = lblF5Click
      end
      object edtSupName: TEdit
        Left = 196
        Top = 32
        Width = 248
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object btnShow: TcxButton
        Left = 352
        Top = 81
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Caption = '&Show'
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
        TabOrder = 3
        OnClick = btnShowClick
      end
      object edtCustName: TEdit
        Left = 196
        Top = 5
        Width = 248
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNoAgreement: TEdit
        Left = 104
        Top = 60
        Width = 173
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnKeyDown = edtNoAgreementKeyDown
      end
      object dtStart: TcxDateEdit
        Left = 104
        Top = 87
        TabOrder = 4
        Width = 80
      end
      object dtEnd: TcxDateEdit
        Left = 196
        Top = 87
        TabOrder = 5
        Width = 80
      end
      object edtPPH: TEdit
        Left = 394
        Top = 141
        Width = 49
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
      end
      object edtDesc: TEdit
        Left = 103
        Top = 169
        Width = 339
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object edtPPN: TEdit
        Left = 279
        Top = 141
        Width = 49
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtPKP: TEdit
        Left = 104
        Top = 141
        Width = 57
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object intedtInvoice: TcxCurrencyEdit
        Left = 280
        Top = 112
        EditValue = 0.000000000000000000
        TabOrder = 8
        Width = 49
      end
      object intedtPeriode: TcxCurrencyEdit
        Left = 104
        Top = 112
        EditValue = 0.000000000000000000
        TabOrder = 10
        Width = 57
      end
      object cbCustCode: TcxLookupComboBox
        Left = 104
        Top = 3
        Properties.ListColumns = <>
        TabOrder = 12
        Width = 89
      end
      object cbSupCode: TcxLookupComboBox
        Left = 104
        Top = 31
        Properties.ListColumns = <>
        TabOrder = 13
        Width = 89
      end
    end
    object pnl2: TPanel
      Left = 11
      Top = 359
      Width = 736
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      DesignSize = (
        736
        41)
      object lbl5: TLabel
        Left = 22
        Top = 8
        Width = 49
        Height = 16
        Caption = 'Unit Price'
      end
      object lbl2: TLabel
        Left = 520
        Top = 8
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object lblPeriode2: TLabel
        Left = 161
        Top = 8
        Width = 52
        Height = 16
        Caption = '/semester'
      end
      object edtUnitPrice: TEdit
        Left = 84
        Top = 6
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object btnEditSchedule: TcxButton
        Left = 274
        Top = 6
        Width = 179
        Height = 27
        Cursor = crHandPoint
        Action = actEditScheduleMasterAgreement
        Anchors = [akLeft, akBottom]
        Caption = 'Edit Schedule (CTRL - H)'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E000000000000000000007F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFDCDCDC
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCDCDCDCDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDC003250003250003250003250003250003250DCDCDC7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDC0062962020206BC6FF6BC6FF6BC6FF4B79FF003250003250FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFCC66000062968ED4FF8ED4FF3399FF3399FF4B79FF4B79FF0032500032
          50FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF
          00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFBFBFBFFFFFFF
          DCDCDCFFFFFFDCDCDC0062968ED4FF3399FF3399FF3399FF3399FF4B79FF6060
          60002573002573FF00FF7F7F7FFFFFFFFF00FFFFFFFFFFFFFF7F7F7FFFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFBFBFBFFFFFFF
          FFFFFFCC6600CC6600CC660000629600629666CCFF66CCFF3399FF9F9F9F9F9F
          9F4848FF4848FF0025737F7F7FFFFFFFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7FFFFFFFFFFFFFFFFFFFFF00FF7F7F7FFFFFFFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCFFFFFFDCDCDCFFFFFFDCDCDCDCDCDC00629600629666CCFFFFFFFF6B8F
          FF4848FF4848FF0025737F7F7FFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FF7F7F7FBFBFBFFFFFFF
          FFFFFFCC6600CC6600CC6600CC6600CC6600DCDCDCDCDCDC006296006296B1C7
          FFB1C7FF6B8FFF0025737F7F7FFFFFFFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7FFF00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FBFBFBFFFFFFF
          FFFFFFFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCDCDCDC7F7F7FFF00FF0000
          99000099000099FF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFBFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 1
      end
      object curredtTotal: TcxCurrencyEdit
        Left = 552
        Top = 8
        TabOrder = 2
        Width = 137
      end
    end
    object pcMasterAgreement: TcxPageControl
      Left = 11
      Top = 209
      Width = 736
      Height = 150
      Align = alClient
      TabOrder = 2
      Properties.ActivePage = tsKontrak
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 150
      ClientRectRight = 736
      ClientRectTop = 27
      object tsKontrak: TcxTabSheet
        Caption = 'F2 - Detil Agreement'
        ImageIndex = 0
        object cxGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 736
          Height = 123
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          object grdGridView: TcxGridDBTableView
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
            object cxcolGridViewColumn1: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcolGridViewColumn2: TcxGridDBColumn
              Caption = 'Product Code'
            end
            object cxcolGridViewColumn3: TcxGridDBColumn
              Caption = 'Product Description'
            end
            object cxcolGridViewColumn4: TcxGridDBColumn
              Caption = 'Qty Order'
            end
            object cxcolGridViewColumn5: TcxGridDBColumn
              Caption = 'Total Amount'
            end
          end
          object grdlvlMaster: TcxGridLevel
            GridView = grdGridView
          end
        end
      end
      object tsJadwalInvoice: TcxTabSheet
        Caption = 'F3 - Invoice Schedule'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 289
        ExplicitHeight = 166
        object cxgrd1: TcxGrid
          Left = 0
          Top = 0
          Width = 736
          Height = 123
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitWidth = 698
          ExplicitHeight = 302
          object grdInvoice: TcxGridDBTableView
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
            object cxcol1: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcol2: TcxGridDBColumn
              Caption = 'Invoice Date'
            end
            object cxcol3: TcxGridDBColumn
              Caption = 'Invoice Term(s)'
            end
            object cxcol4: TcxGridDBColumn
              Caption = 'Invoice No'
            end
            object cxcol5: TcxGridDBColumn
              Caption = 'Invoice DueDate'
            end
            object cxcol6: TcxGridDBColumn
              Caption = 'Status'
            end
            object cxcol7: TcxGridDBColumn
              Caption = 'Total Invoice'
            end
          end
          object grdlvlMaster1: TcxGridLevel
            GridView = grdInvoice
          end
        end
      end
      object tsJadwalAccrual: TcxTabSheet
        Caption = 'F4 - Accrual Schedule'
        ImageIndex = 2
        ExplicitLeft = 48
        ExplicitTop = 3
        ExplicitWidth = 289
        ExplicitHeight = 166
        object cxgrd2: TcxGrid
          Left = 0
          Top = 0
          Width = 736
          Height = 123
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitLeft = 112
          ExplicitTop = -16
          ExplicitWidth = 369
          ExplicitHeight = 206
          object grdAccrual: TcxGridDBTableView
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
            object cxcol8: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcol9: TcxGridDBColumn
              Caption = 'Accrual Date'
            end
            object cxcol10: TcxGridDBColumn
              Caption = 'Periode'
            end
            object cxcol11: TcxGridDBColumn
              Caption = 'Accual No'
            end
            object cxcol12: TcxGridDBColumn
              Caption = 'Status'
            end
            object cxcol13: TcxGridDBColumn
              Caption = 'Total Accrual'
            end
          end
          object grdlvlMaster2: TcxGridLevel
            GridView = grdAccrual
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 758
    ExplicitWidth = 758
    inherited lblHeader: TLabel
      Width = 129
      Height = 18
      Caption = 'List Master Agreement'
      ExplicitWidth = 129
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 441
    Width = 758
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 441
    ExplicitWidth = 758
    inherited pnlFooter: TPanel
      Width = 758
      ExplicitWidth = 758
      inherited btnClose: TcxButton
        Left = 676
        OnClick = fraFooter5Button1btnCloseClick
        ExplicitLeft = 676
      end
      inherited btnAdd: TcxButton
        Action = actAddMasterAgreement
      end
      inherited btnUpdate: TcxButton
        Action = actEditMasterAgreement
      end
      inherited btnDelete: TcxButton
        Action = actDeleteMasterAgreement
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshMasterAgreement
      end
    end
    inherited pnlSortCut: TPanel
      Width = 758
      ExplicitWidth = 758
      inherited lbl5: TLabel
        Left = 668
        ExplicitLeft = 670
      end
    end
  end
  object actlst1: TActionList
    Left = 651
    Top = 57
    object actAddMasterAgreement: TAction
      Caption = 'Add'
      OnExecute = actAddMasterAgreementExecute
    end
    object actEditMasterAgreement: TAction
      Caption = 'Edit'
      OnExecute = actEditMasterAgreementExecute
    end
    object actDeleteMasterAgreement: TAction
      Caption = 'Delete'
      OnExecute = actDeleteMasterAgreementExecute
    end
    object actRefreshMasterAgreement: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshMasterAgreementExecute
    end
    object actEditScheduleMasterAgreement: TAction
      Caption = 'Edit Schedule'
      OnExecute = actEditScheduleMasterAgreementExecute
    end
  end
end
