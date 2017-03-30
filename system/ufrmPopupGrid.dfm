object frmPopupGrid: TfrmPopupGrid
  Left = 343
  Top = 123
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 259
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlFooter: TPanel
    Left = 0
    Top = 201
    Width = 400
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object pnlFooterBtn: TPanel
      Left = 0
      Top = 23
      Width = 400
      Height = 35
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        400
        35)
      object btnClose: TcxButton
        Left = 318
        Top = 3
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Close'
        ModalResult = 2
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
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlSortCut: TPanel
      Left = 0
      Top = 0
      Width = 400
      Height = 23
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 13284267
      TabOrder = 1
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 201
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 1
    object pnlHeader: TPanel
      Left = 2
      Top = 2
      Width = 396
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      Color = 15198183
      TabOrder = 0
      object lblHeader: TLabel
        Left = 0
        Top = 14
        Width = 72
        Height = 14
        Align = alClient
        Alignment = taCenter
        Caption = 'Label Header'
        Color = 15198177
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblTopHeader: TLabel
        Left = 0
        Top = 0
        Width = 3
        Height = 14
        Align = alTop
        Alignment = taCenter
        Color = 15198177
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 33
      Width = 396
      Height = 166
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 594
      ExplicitHeight = 310
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
