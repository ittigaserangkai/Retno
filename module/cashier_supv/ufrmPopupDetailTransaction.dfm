object frmPopupDetailTransaction: TfrmPopupDetailTransaction
  Left = 128
  Top = 190
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmPopupDetailTransaction'
  ClientHeight = 291
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 24
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'DETAIL TRANSACTION'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl2: TPanel
    Left = 0
    Top = 24
    Width = 816
    Height = 267
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object pnl3: TPanel
      Left = 2
      Top = 2
      Width = 812
      Height = 263
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 0
      object pnl4: TPanel
        Left = 11
        Top = 214
        Width = 790
        Height = 38
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          790
          38)
        object Label1: TLabel
          Left = 9
          Top = 12
          Width = 52
          Height = 16
          Caption = 'Cashier ID'
        end
        object Label2: TLabel
          Left = 134
          Top = 12
          Width = 68
          Height = 16
          Caption = 'Cashier Name'
        end
        object Label3: TLabel
          Left = 381
          Top = 11
          Width = 23
          Height = 16
          Caption = 'Shift'
        end
        object lblClose: TcxLabel
          Left = 756
          Top = 14
          Cursor = crHandPoint
          Anchors = [akRight, akBottom]
          Caption = 'Close'
          ParentFont = False
          OnClick = lblCloseClick
        end
        object edtCashierID: TEdit
          Left = 64
          Top = 8
          Width = 57
          Height = 24
          BevelInner = bvLowered
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
        end
        object edtCashierNm: TEdit
          Left = 205
          Top = 7
          Width = 164
          Height = 24
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
        end
        object edtShift: TEdit
          Left = 408
          Top = 7
          Width = 57
          Height = 24
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
        end
      end
      object cxGrid: TcxGrid
        Left = 11
        Top = 11
        Width = 790
        Height = 203
        Align = alClient
        TabOrder = 1
        LockedStateImageOptions.Text = 'Mohon ditunggu...'
        LookAndFeel.NativeStyle = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 755
        ExplicitHeight = 155
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
          Styles.ContentEven = DMClient.cxStyleGridHeader
          Styles.Header = DMClient.cxStyleGridEven
        end
        object cxlvMaster: TcxGridLevel
          GridView = cxGridView
        end
      end
    end
  end
end
