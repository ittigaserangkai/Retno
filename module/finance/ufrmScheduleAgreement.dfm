inherited frmScheduleAgreement: TfrmScheduleAgreement
  Left = 136
  Top = 78
  Caption = 'frmPrintInvoice'
  ClientHeight = 500
  ClientWidth = 702
  OldCreateOrder = True
  ExplicitWidth = 718
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 702
    Height = 411
    ExplicitWidth = 702
    ExplicitHeight = 411
    object lbl9: TLabel [0]
      Left = 1
      Top = 113
      Width = 700
      Height = 18
      Align = alTop
      Caption = 'Report List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 61
    end
    inherited pgcBrowse: TcxPageControl
      Top = 131
      Width = 700
      Height = 279
      TabOrder = 1
      ExplicitTop = 131
      ExplicitWidth = 700
      ExplicitHeight = 279
      ClientRectBottom = 278
      ClientRectRight = 699
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 698
        ExplicitHeight = 277
        inherited cxGrid: TcxGrid
          Width = 698
          Height = 277
          ExplicitWidth = 698
          ExplicitHeight = 277
          inherited cxGridView: TcxGridDBTableView
            object cxcolAgreementNo: TcxGridDBColumn
              Caption = 'Agreement No.'
              Width = 84
            end
            object cxcolDateStart: TcxGridDBColumn
              Caption = 'Date Start'
            end
            object cxcolDateEnd: TcxGridDBColumn
              Caption = 'Date End'
            end
            object cxcolCustomerCode: TcxGridDBColumn
              Caption = 'Customer Code'
              Width = 89
            end
            object cxcolCustomerName: TcxGridDBColumn
              Caption = 'Customer Name'
              Width = 109
            end
            object cxcolDescription: TcxGridDBColumn
              Caption = 'Description'
              Width = 164
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
      Width = 700
      Height = 112
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl7: TLabel
        Left = 30
        Top = 43
        Width = 34
        Height = 18
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 30
        Top = 16
        Width = 74
        Height = 18
        Caption = 'Product Type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 30
        Top = 69
        Width = 38
        Height = 18
        Caption = 'Report'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object cbbStatus: TComboBox
        Left = 129
        Top = 40
        Width = 352
        Height = 24
        Style = csDropDownList
        TabOrder = 2
      end
      object btnShowList: TcxButton
        Left = 491
        Top = 67
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
        TabOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowListClick
      end
      object cbbReport: TComboBox
        Left = 129
        Top = 67
        Width = 352
        Height = 24
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'INVOICE')
      end
      object chkAll: TCheckBox
        Left = 491
        Top = 13
        Width = 97
        Height = 17
        Caption = 'All Product Type'
        TabOrder = 1
        OnClick = chkAllClick
      end
      object edbProductCode: TcxButtonEdit
        Left = 129
        Top = 13
        Properties.Buttons = <
          item
            Caption = '..'
          end>
        TabOrder = 0
        Text = '0'
        OnKeyUp = edbProductCodeKeyUp
        Width = 127
      end
      object edtProductName: TEdit
        Left = 260
        Top = 13
        Width = 221
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 702
    ExplicitWidth = 702
    inherited lblFilterData: TcxLabel
      Left = 348
      Visible = True
      ExplicitLeft = 348
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 409
      Visible = True
      ExplicitLeft = 409
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 525
      Visible = True
      ExplicitLeft = 525
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 620
      ExplicitLeft = 620
    end
    inherited lblsdFilter: TcxLabel
      Left = 501
      Visible = True
      ExplicitLeft = 501
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 444
    Width = 702
    ExplicitTop = 444
    ExplicitWidth = 702
    inherited pnlFooter: TPanel
      Width = 702
      ExplicitWidth = 702
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
        Left = 625
        Action = actClose
        ExplicitLeft = 625
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited lbEscape: TLabel
        Left = 628
        ExplicitLeft = 628
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
