object frmPopupDetailCashback: TfrmPopupDetailCashback
  Left = 440
  Top = 371
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmPopupDetailCashback'
  ClientHeight = 269
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 24
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'DETAIL CASHBACK'
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
    Width = 423
    Height = 245
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 10
    TabOrder = 1
    object pnl3: TPanel
      Left = 11
      Top = 211
      Width = 401
      Height = 23
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        401
        23)
      object lblClose: TcxLabel
        Left = 368
        Top = 2
        Cursor = crHandPoint
        Anchors = [akRight, akBottom]
        Caption = 'Close'
        ParentFont = False
        Transparent = True
        OnClick = lblCloseClick
      end
    end
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 401
      Height = 200
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 397
      ExplicitHeight = 101
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
        object cxcolTime: TcxGridDBColumn
          Caption = 'TIME'
        end
        object cxcolCard: TcxGridDBColumn
          Caption = 'CARD'
        end
        object cxcolTransaction: TcxGridDBColumn
          Caption = 'TRANSACTION'
        end
        object cxcolCashback: TcxGridDBColumn
          Caption = 'CASHBACK'
        end
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
end
