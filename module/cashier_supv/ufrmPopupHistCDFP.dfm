object frmPopupHistCDFP: TfrmPopupHistCDFP
  Left = 370
  Top = 216
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmPopupHistCDFP'
  ClientHeight = 234
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 24
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'HISTORY CASH DROPING - FINAL PAYMENT'
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
    Top = 56
    Width = 559
    Height = 178
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 1
    DesignSize = (
      559
      178)
    object lblClose: TcxLabel
      Left = 507
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      OnClick = lblCloseClick
    end
    object pnl4: TPanel
      Left = 21
      Top = 125
      Width = 517
      Height = 32
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object lbl5: TLabel
        Left = 7
        Top = 6
        Width = 24
        Height = 16
        Caption = 'Note'
      end
      object lbl6: TLabel
        Left = 161
        Top = 6
        Width = 42
        Height = 16
        Caption = 'Input By'
      end
      object edtNote: TEdit
        Left = 34
        Top = 6
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = 'Final Payment'
      end
      object edtSupervisorID: TEdit
        Left = 204
        Top = 5
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'Adi'
      end
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 517
      Height = 104
      Align = alClient
      TabOrder = 2
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
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
  object pnl3: TPanel
    Left = 0
    Top = 24
    Width = 559
    Height = 32
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lbl3: TLabel
      Left = 12
      Top = 6
      Width = 24
      Height = 16
      Caption = 'Date'
    end
    object lbl2: TLabel
      Left = 253
      Top = 6
      Width = 23
      Height = 16
      Caption = 'Shift'
    end
    object lbl1: TLabel
      Left = 140
      Top = 6
      Width = 47
      Height = 16
      Caption = 'POS Code'
    end
    object lbl4: TLabel
      Left = 324
      Top = 6
      Width = 51
      Height = 16
      Caption = 'Cashier Id'
    end
    object dt1: TcxDateEdit
      Left = 38
      Top = 5
      TabOrder = 0
      Width = 97
    end
    object edtShift: TEdit
      Left = 279
      Top = 5
      Width = 39
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      Text = '1'
    end
    object edtPOSCode: TEdit
      Left = 190
      Top = 5
      Width = 57
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      Text = '01'
    end
    object edtCashierID: TEdit
      Left = 379
      Top = 5
      Width = 57
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      Text = '0001'
    end
    object edtCashierName: TEdit
      Left = 437
      Top = 5
      Width = 110
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      Text = 'Ani'
    end
  end
end
