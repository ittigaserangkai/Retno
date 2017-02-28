inherited frmSysParm: TfrmSysParm
  Left = 269
  Top = 109
  Caption = 'System Parameter'
  ClientHeight = 477
  ClientWidth = 627
  OldCreateOrder = True
  ExplicitWidth = 643
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 627
    Height = 393
    ExplicitWidth = 627
    ExplicitHeight = 393
    object pnlMain: TPanel
      Left = 11
      Top = 89
      Width = 605
      Height = 293
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      object cxGrid: TcxGrid
        Left = 11
        Top = 11
        Width = 583
        Height = 271
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 128
        ExplicitTop = 25
        ExplicitWidth = 329
        ExplicitHeight = 119
        object cxGridViewSysParam: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridViewSysParam
        end
      end
    end
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 605
      Height = 78
      Align = alTop
      Color = 15198183
      TabOrder = 1
      object grp1: TGroupBox
        Left = 1
        Top = 1
        Width = 265
        Height = 73
        Caption = 'Pencarian'
        TabOrder = 0
        object edtSearchKode: TEdit
          Left = 72
          Top = 21
          Width = 161
          Height = 20
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
        end
        object edtSearchNama: TEdit
          Left = 72
          Top = 45
          Width = 161
          Height = 20
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 3
        end
        object chkKode: TCheckBox
          Left = 16
          Top = 23
          Width = 41
          Height = 17
          Caption = 'Kode'
          TabOrder = 0
        end
        object chkNama: TCheckBox
          Left = 16
          Top = 47
          Width = 49
          Height = 17
          Caption = 'Nama'
          TabOrder = 1
        end
      end
      object btnShow: TcxButton
        Left = 272
        Top = 48
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300993300500019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300993300993300500019FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0000009933009933009933009933005000
          19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300CC6600993300CC66009933
          00500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600993300CC6600993300CC66
          00993300500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600CC6600CC6600CC6600CC66
          00CC6600663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900CC6600FF9900CC6600FF99
          00663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900FF99006633
          33FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900663333FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OptionsImage.NumGlyphs = 2
        TabOrder = 1
        OnClick = btnShowClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 627
    ExplicitWidth = 627
    inherited lblHeader: TLabel
      Width = 112
      Caption = 'SYSTEM PARAMETER'
      ExplicitWidth = 112
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 423
    Width = 627
    Height = 54
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 423
    ExplicitWidth = 627
    ExplicitHeight = 54
    inherited pnlFooter: TPanel
      Top = 19
      Width = 627
      ExplicitTop = 19
      ExplicitWidth = 627
      inherited btnClose: TcxButton
        Left = 545
        ExplicitLeft = 545
      end
      inherited btnAdd: TcxButton
        Caption = 'Add'
        OnClick = fraFooter5Button1btnAddClick
      end
      inherited btnUpdate: TcxButton
        Caption = 'Edit'
        OnClick = fraFooter5Button1btnUpdateClick
      end
      inherited btnDelete: TcxButton
        OnClick = fraFooter5Button1btnDeleteClick
      end
      inherited btnRefresh: TcxButton
        OnClick = fraFooter5Button1btnRefreshClick
      end
    end
    inherited pnlSortCut: TPanel
      Width = 627
      Height = 19
      ExplicitWidth = 627
      ExplicitHeight = 19
      inherited lbl1: TLabel
        Top = 1
        ExplicitTop = 1
      end
      inherited lbl2: TLabel
        Top = 1
        Caption = 'CTRL-E (Edit)'
        ExplicitTop = 1
      end
      inherited lbl3: TLabel
        Top = 1
        Visible = False
        ExplicitTop = 1
      end
      inherited lbl4: TLabel
        Top = 1
        ExplicitTop = 1
      end
      inherited lbl5: TLabel
        Left = 537
        Top = 1
        ExplicitLeft = 547
        ExplicitTop = 1
      end
    end
  end
end
