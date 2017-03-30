inherited frmDiscountMember: TfrmDiscountMember
  Left = 203
  Top = 159
  Caption = 'Discount Member'
  ClientHeight = 464
  ClientWidth = 697
  OldCreateOrder = True
  ExplicitWidth = 713
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 697
    Height = 321
    ExplicitWidth = 697
    ExplicitHeight = 321
    inherited pgcBrowse: TcxPageControl
      Top = 89
      Width = 675
      Height = 221
      TabOrder = 1
      ExplicitTop = 89
      ExplicitWidth = 675
      ExplicitHeight = 221
      ClientRectBottom = 220
      ClientRectRight = 674
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 673
        ExplicitHeight = 219
        inherited cxGrid: TcxGrid
          Width = 673
          Height = 219
          ExplicitWidth = 673
          ExplicitHeight = 219
        end
      end
    end
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 675
      Height = 78
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object btnShow: TcxButton
        Left = 302
        Top = 46
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C30E0000C30E00000000000000000000FF00FFFF00FF
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
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowClick
      end
      object grp1: TGroupBox
        Left = 1
        Top = 1
        Width = 296
        Height = 73
        Caption = 'Pencarian'
        TabOrder = 1
        object edtSearchKode: TEdit
          Left = 120
          Top = 21
          Width = 169
          Height = 20
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
        end
        object edtSearchNama: TEdit
          Left = 120
          Top = 45
          Width = 169
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
          Width = 97
          Height = 17
          Caption = 'Member Type'
          TabOrder = 1
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 697
    ExplicitWidth = 697
    inherited lblHeader: TLabel
      Width = 103
      Caption = 'DISCOUNT MEMBER'
      ExplicitWidth = 103
    end
    inherited lblFilterData: TcxLabel
      Left = 343
      ExplicitLeft = 343
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 404
      ExplicitLeft = 404
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 520
      ExplicitLeft = 520
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 615
      ExplicitLeft = 615
    end
    inherited lblsdFilter: TcxLabel
      Left = 496
      ExplicitLeft = 496
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 354
    Width = 697
    TabOrder = 3
    ExplicitTop = 354
    ExplicitWidth = 697
    inherited pnlFooter: TPanel
      Width = 697
      ExplicitWidth = 697
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
        Left = 620
        Action = actClose
        ExplicitLeft = 620
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 697
      ExplicitWidth = 697
      inherited lbEscape: TLabel
        Left = 623
        Height = 17
      end
    end
  end
  inline fraFooter5Button1: TfraFooter5Button [3]
    Left = 0
    Top = 410
    Width = 697
    Height = 54
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 410
    ExplicitWidth = 697
    ExplicitHeight = 54
    inherited pnlFooter: TPanel
      Top = 19
      Width = 697
      ExplicitTop = 19
      ExplicitWidth = 697
      inherited btnClose: TcxButton
        Left = 615
        OnClick = fraFooter5Button1btnCloseClick
        ExplicitLeft = 615
      end
      inherited btnAdd: TcxButton
        Caption = 'Add'
      end
      inherited btnUpdate: TcxButton
        Caption = 'Edit'
      end
    end
    inherited pnlSortCut: TPanel
      Width = 697
      Height = 19
      ExplicitWidth = 697
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
        Left = 607
        Top = 1
        ExplicitLeft = 615
        ExplicitTop = 1
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
