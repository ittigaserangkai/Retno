inherited frmInvMovementQTY: TfrmInvMovementQTY
  Left = 227
  Top = 96
  BorderStyle = bsSingle
  Caption = 'Laporan Inventory Movement Quantity'
  ClientHeight = 474
  ClientWidth = 727
  WindowState = wsNormal
  ExplicitWidth = 733
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 727
    Height = 385
    BorderWidth = 0
    ExplicitWidth = 733
    ExplicitHeight = 466
    object Label1: TLabel [0]
      Left = 384
      Top = 121
      Width = 34
      Height = 16
      Caption = 'Search'
    end
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 117
      Width = 725
      Height = 267
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 164
      ExplicitWidth = 731
      ExplicitHeight = 301
      ClientRectBottom = 266
      ClientRectRight = 724
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 729
        ExplicitHeight = 299
        inherited cxGrid: TcxGrid
          Width = 723
          Height = 265
          ExplicitWidth = 729
          ExplicitHeight = 299
          inherited cxGridView: TcxGridDBTableView
            object cxcolDate: TcxGridDBColumn
              Caption = 'Date'
            end
            object cxcolPLU: TcxGridDBColumn
              Caption = 'PLU'
            end
            object cxcolBeginning: TcxGridDBColumn
              Caption = 'Beginning'
            end
            object cxcolReceiving: TcxGridDBColumn
              Caption = 'Receiving'
            end
            object cxcolRetur: TcxGridDBColumn
              Caption = 'Retur'
            end
            object cxcolSalesPOS: TcxGridDBColumn
              Caption = 'Sales POS'
            end
            object cxcolSalesKRING: TcxGridDBColumn
              Caption = 'Sales Kring'
            end
            object cxcolAdjustmentIN: TcxGridDBColumn
              Caption = 'Adjustment In'
            end
            object cxcolAdjustmentOUT: TcxGridDBColumn
              Caption = 'Adjustment Out'
            end
            object cxcolWastage: TcxGridDBColumn
              Caption = 'Wastage'
            end
            object cxcolEnding: TcxGridDBColumn
              Caption = 'Ending'
            end
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 725
      Height = 116
      Align = alTop
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 731
      object Label2: TLabel
        Left = 20
        Top = 1
        Width = 49
        Height = 16
        Caption = 'Pilih Filter'
      end
      object chkMutasi: TCheckBox
        Left = 15
        Top = 97
        Width = 171
        Height = 17
        Caption = 'Hanya Yang Ada Mutasi Stock'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 14
        Width = 489
        Height = 78
        TabOrder = 0
        object rbAll: TRadioButton
          Left = 6
          Top = 12
          Width = 43
          Height = 17
          Caption = 'All'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbMerchandise: TRadioButton
          Left = 6
          Top = 29
          Width = 94
          Height = 17
          Caption = 'Division'
          TabOrder = 1
        end
        object rbPLU: TRadioButton
          Left = 6
          Top = 53
          Width = 94
          Height = 17
          Caption = 'PLU'
          TabOrder = 2
        end
        object cbpMerchandise: TcxExtLookupComboBox
          Left = 102
          Top = 26
          TabOrder = 3
          OnExit = cbpMerchandiseExit
          Width = 61
        end
        object edtMerchandName: TEdit
          Left = 165
          Top = 26
          Width = 307
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
        end
        object edProductName: TEdit
          Left = 165
          Top = 50
          Width = 307
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object edPLU: TcxButtonEdit
          Left = 102
          Top = 51
          ParentFont = False
          Properties.Buttons = <
            item
            end>
          TabOrder = 6
          OnExit = edPLUExit
          Width = 61
        end
      end
      object btnInitialisasi: TButton
        Left = 509
        Top = 87
        Width = 75
        Height = 25
        Caption = 'Inisialisasi'
        TabOrder = 3
        OnClick = btnInitialisasiClick
      end
      object btnExport: TcxButton
        Left = 603
        Top = 75
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Caption = 'Proses'
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
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnExportClick
      end
      object Button2: TButton
        Left = 584
        Top = 29
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 5
        Visible = False
        OnClick = Button2Click
      end
      object edtPLU: TcxButtonEdit
        Left = 600
        Top = 21
        ParentFont = False
        Properties.Buttons = <>
        TabOrder = 6
        Text = '[Input PLU]'
        Visible = False
        Width = 103
      end
      object chkAllUnit: TCheckBox
        Left = 223
        Top = 97
        Width = 106
        Height = 17
        Caption = 'Semua Unit'
        Enabled = False
        TabOrder = 2
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 727
    ExplicitWidth = 733
    inherited lblHeader: TLabel
      Width = 237
      Caption = 'LAPORAN INVENTORY MOVEMENT QUANTITY'
      ExplicitWidth = 237
    end
    inherited lblFilterData: TcxLabel
      Left = 373
      ExplicitLeft = 379
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 434
      ExplicitLeft = 440
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 550
      ExplicitLeft = 556
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 645
      ExplicitLeft = 651
    end
    inherited lblsdFilter: TcxLabel
      Left = 526
      ExplicitLeft = 532
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 418
    Width = 727
    ExplicitTop = 499
    ExplicitWidth = 733
    inherited pnlFooter: TPanel
      Width = 727
      ExplicitWidth = 733
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
        Left = 650
        Action = actClose
        ExplicitLeft = 656
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 727
      ExplicitWidth = 733
      inherited lbEscape: TLabel
        Left = 653
        Height = 17
      end
    end
  end
end
