object frmPopupFamilyMember: TfrmPopupFamilyMember
  Left = 224
  Top = 198
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Display Family Member'
  ClientHeight = 292
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 24
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'DISPLAY ANGGOTA KELUARGA'
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
    Top = 65
    Width = 480
    Height = 227
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 1
    DesignSize = (
      480
      227)
    object lblClose: TcxLabel
      Left = 428
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      OnClick = lblCloseClick
    end
    object lblEditFamily: TcxLabel
      Left = 364
      Top = 4
      Cursor = crHandPoint
      Caption = 'Edit Family'
      ParentFont = False
      OnClick = lblEditFamilyClick
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 438
      Height = 185
      Align = alClient
      TabOrder = 2
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      ExplicitLeft = 2
      ExplicitTop = 56
      ExplicitWidth = 426
      ExplicitHeight = 238
      object cxGridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        FilterRow.Visible = True
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.GroupByBox = False
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'STATUS DLM KELUARGA'
          Width = 139
        end
        object cxGridViewColumn2: TcxGridDBColumn
          Caption = 'NAMA LENGKAP'
          Width = 155
        end
        object cxGridViewColumn3: TcxGridDBColumn
          Caption = 'TANGGAL LAHIR'
        end
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 24
    Width = 480
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lbl4: TLabel
      Left = 22
      Top = 12
      Width = 69
      Height = 13
      Caption = 'Member Name'
    end
    object lbl5: TLabel
      Left = 282
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Card No.'
    end
    object edtMemberName: TEdit
      Left = 113
      Top = 9
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtCardNo: TEdit
      Left = 337
      Top = 9
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
