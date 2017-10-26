inherited frmListAgreementDetil: TfrmListAgreementDetil
  Left = 231
  Top = 107
  Caption = 'Listing Agreement Detil'
  ClientHeight = 477
  ClientWidth = 698
  OldCreateOrder = True
  ExplicitWidth = 714
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 698
    Height = 388
    ExplicitWidth = 120
    ExplicitHeight = 413
    object lbl9: TLabel [0]
      Left = 1
      Top = 79
      Width = 696
      Height = 18
      Align = alTop
      Caption = 'Agreement List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 83
    end
    inherited pgcBrowse: TcxPageControl
      Top = 97
      Width = 696
      Height = 290
      TabOrder = 1
      ExplicitTop = 79
      ExplicitWidth = 118
      ExplicitHeight = 333
      ClientRectBottom = 289
      ClientRectRight = 695
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 116
        ExplicitHeight = 331
        inherited cxGrid: TcxGrid
          Width = 694
          Height = 288
          ExplicitWidth = 116
          ExplicitHeight = 331
          inherited cxGridView: TcxGridDBTableView
            object cxcolDate: TcxGridDBColumn
              Caption = 'Date'
            end
            object cxcolJournalNo: TcxGridDBColumn
              Caption = 'Journal No.'
            end
            object cxcolDateEntry: TcxGridDBColumn
              Caption = 'Date Entry'
            end
            object cxcolJournalCode: TcxGridDBColumn
              Caption = 'Journal Code'
            end
            object cxcolReferenceNo: TcxGridDBColumn
              Caption = 'Reference No.'
            end
            object cxcolDescription: TcxGridDBColumn
              Caption = 'Description'
            end
            object cxcolPosted: TcxGridDBColumn
              Caption = 'Posted'
            end
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 696
      Height = 78
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 118
      object lbl3: TLabel
        Left = 14
        Top = 26
        Width = 84
        Height = 18
        Caption = 'Customer Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 243
        Top = 29
        Width = 12
        Height = 18
        Caption = 'to'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object btnShowList: TcxButton
        Left = 426
        Top = 23
        Width = 120
        Height = 30
        Cursor = crHandPoint
        Caption = 'Show Listing'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF500019
          500019FF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          993300500019FF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FF9F9F9FFFFFFFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          993300993300500019FF00FFFF00FF663333993300993300500019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FF9F9F9FFFFFFFFF00FF9F
          9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          993300993300993300500019FF00FF663333993300993300993300500019FF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF9F9F9FFFFFFF9F
          9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF663333
          9933009933009933009933005000196633339933009933009933009933005000
          19FF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FF9F9F9F9F
          9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF663333
          CC6600993300CC6600993300CC6600663333993300CC6600993300CC66009933
          00500019FF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FF663333
          993300CC6600993300CC6600993300993300CC6600993300CC6600993300CC66
          00993300500019FF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FF663333
          CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC66
          00CC6600663333FF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FF663333
          CC6600FF9900CC6600FF9900CC6600663333FF9900CC6600FF9900CC6600FF99
          00663333FF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFFFFFF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF663333
          FF9900FF9900FF9900FF9900663333663333FF9900FF9900FF9900FF99006633
          33FF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFFFFFF9F9F9F9F
          9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF663333
          FF9900FF9900FF9900663333FF00FF663333FF9900FF9900FF9900663333FF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFFFFFF9F9F9FFF00FF9F
          9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF663333
          FF9900FF9900663333FF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFFFFFF9F9F9FFF00FFFF00FF9F
          9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          FFFFDE663333FF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          663333FF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 2
        OnClick = btnShowListClick
      end
      object edtmemberNo1: TEdit
        Left = 107
        Top = 28
        Width = 125
        Height = 22
        MaxLength = 8
        TabOrder = 0
        OnKeyPress = edtmemberNo1KeyPress
        OnKeyUp = edtmemberNo1KeyUp
      end
      object edtMemberNo2: TEdit
        Left = 267
        Top = 28
        Width = 125
        Height = 22
        MaxLength = 8
        TabOrder = 1
        OnKeyPress = edtMemberNo2KeyPress
        OnKeyUp = edtMemberNo2KeyUp
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 698
    ExplicitWidth = 120
    inherited lblFilterData: TcxLabel
      Left = 344
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 405
      ExplicitLeft = -173
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 521
      ExplicitLeft = -57
    end
    inherited btnSearch: TcxButton
      Left = 616
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 497
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 421
    Width = 698
    ExplicitTop = -112
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 698
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
        Left = 621
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 698
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 624
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
