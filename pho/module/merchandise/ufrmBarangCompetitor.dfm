inherited frmBarangCompetitor: TfrmBarangCompetitor
  Left = 144
  Top = 150
  Caption = 'Competitor'#39's Product'
  ClientHeight = 451
  ClientWidth = 702
  OldCreateOrder = True
  ExplicitWidth = 718
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 702
    Height = 362
    BorderWidth = 0
    ExplicitWidth = 702
    ExplicitHeight = 306
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 89
      Width = 700
      Height = 141
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 89
      ExplicitWidth = 700
      ExplicitHeight = 85
      ClientRectBottom = 141
      ClientRectRight = 700
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 700
        ExplicitHeight = 85
        inherited cxGrid: TcxGrid
          Width = 700
          Height = 141
          ExplicitWidth = 700
          ExplicitHeight = 85
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'PLU'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'Convers (%)'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'Harga Jual'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'Satuan'
            end
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 700
      Height = 88
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl2: TLabel
        Left = 28
        Top = 34
        Width = 89
        Height = 16
        Caption = 'Survey start date'
      end
      object lbl3: TLabel
        Left = 270
        Top = 34
        Width = 44
        Height = 16
        Caption = 'end date'
      end
      object lbl4: TLabel
        Left = 12
        Top = 60
        Width = 104
        Height = 16
        Caption = 'Search Product Code'
      end
      object lbl1: TLabel
        Left = 32
        Top = 9
        Width = 85
        Height = 16
        Caption = 'Competitor Code'
      end
      object dtStart: TcxDateEdit
        Left = 119
        Top = 32
        TabOrder = 1
        Width = 137
      end
      object dtEnd: TcxDateEdit
        Left = 318
        Top = 32
        TabOrder = 2
        Width = 138
      end
      object edtProductCode: TEdit
        Left = 119
        Top = 57
        Width = 337
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        OnChange = edtProductCodeChange
      end
      object edtcompttCode: TEdit
        Left = 119
        Top = 6
        Width = 78
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtcompttCodeChange
      end
      object btnShow: TcxButton
        Left = 464
        Top = 56
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
        TabOrder = 4
        OnClick = btnShowClick
      end
    end
    object pnlButtom: TPanel
      Left = 1
      Top = 230
      Width = 700
      Height = 131
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 174
      object lbl5: TLabel
        Left = 11
        Top = 8
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object lbl6: TLabel
        Left = 12
        Top = 32
        Width = 69
        Height = 16
        Caption = 'Supplier Name'
      end
      object Label1: TLabel
        Left = 51
        Top = 56
        Width = 30
        Height = 16
        Caption = 'Disc 1'
      end
      object lbl7: TLabel
        Left = 51
        Top = 79
        Width = 30
        Height = 16
        Caption = 'Disc 2'
      end
      object lbl8: TLabel
        Left = 52
        Top = 102
        Width = 30
        Height = 16
        Caption = 'Disc 3'
      end
      object lbl9: TLabel
        Left = 138
        Top = 57
        Width = 7
        Height = 16
        Caption = '%'
      end
      object lbl10: TLabel
        Left = 138
        Top = 103
        Width = 7
        Height = 16
        Caption = '%'
      end
      object lbl11: TLabel
        Left = 138
        Top = 80
        Width = 7
        Height = 16
        Caption = '%'
      end
      object lbl13: TLabel
        Left = 214
        Top = 100
        Width = 29
        Height = 16
        Caption = 'Netto'
      end
      object lbl16: TLabel
        Left = 355
        Top = 102
        Width = 6
        Height = 16
        Caption = '/'
      end
      object lbl17: TLabel
        Left = 416
        Top = 77
        Width = 37
        Height = 16
        Caption = 'Regular'
      end
      object lbl18: TLabel
        Left = 462
        Top = 77
        Width = 59
        Height = 16
        Caption = 'Mark Up (%)'
      end
      object lbl19: TLabel
        Left = 461
        Top = 100
        Width = 58
        Height = 16
        Caption = 'Selling Price'
      end
      object lbl20: TLabel
        Left = 159
        Top = 79
        Width = 83
        Height = 16
        Caption = 'Purchasing Price'
      end
      object lbl15: TLabel
        Left = 355
        Top = 80
        Width = 6
        Height = 16
        Caption = '/'
      end
      object edtProductname: TEdit
        Left = 86
        Top = 8
        Width = 547
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = 'GAGA SAMBAL EXTRA HOT 48/140ML/PCS'
      end
      object edtSuplierName: TEdit
        Left = 86
        Top = 31
        Width = 313
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'WOISL WICAKSANA OVERSEASE INTERNAL TBK SOLO'
      end
      object edtDisc1: TEdit
        Left = 86
        Top = 54
        Width = 48
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = '0,00'
      end
      object edtDisc3: TEdit
        Left = 86
        Top = 100
        Width = 48
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        Text = '0,00'
      end
      object edtDisc2: TEdit
        Left = 86
        Top = 77
        Width = 48
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        Text = '0,00'
      end
      object curedtPurchPrice: TcxCurrencyEdit
        Left = 248
        Top = 77
        TabOrder = 5
        Width = 105
      end
      object curedtNettoPrice: TcxCurrencyEdit
        Left = 248
        Top = 100
        TabOrder = 7
        Width = 105
      end
      object edtSatBuy: TEdit
        Left = 363
        Top = 77
        Width = 35
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Text = 'CRT'
      end
      object edtSatNetto: TEdit
        Left = 363
        Top = 100
        Width = 35
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
        Text = 'PCS'
      end
      object edtmarkUp: TEdit
        Left = 526
        Top = 77
        Width = 48
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
        Text = '10,00'
      end
      object CURedtSellingPrice: TcxCurrencyEdit
        Left = 526
        Top = 100
        TabOrder = 10
        Width = 105
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 702
    ExplicitWidth = 702
    inherited lblFilterData: TcxLabel
      Left = 348
      ExplicitLeft = 348
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 409
      ExplicitLeft = 409
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 525
      ExplicitLeft = 525
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 620
      ExplicitLeft = 620
    end
    inherited lblsdFilter: TcxLabel
      Left = 501
      ExplicitLeft = 501
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 395
    Width = 702
    ExplicitTop = 339
    ExplicitWidth = 702
    inherited pnlFooter: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited btnClose: TcxButton
        Left = 625
        Action = actClose
        ExplicitLeft = 625
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 628
        Height = 17
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
  object actlstBarangCompetitor: TActionList
    Left = 576
    Top = 8
    object actAddBarangKompetitor: TAction
      Caption = 'Add'
    end
    object actEditBarangKompetitor: TAction
      Caption = 'Edit'
    end
    object actDeleteBarangKompetitor: TAction
      Caption = 'Delete'
      OnExecute = actDeleteBarangKompetitorExecute
    end
    object actRefreshBarangKompetitor: TAction
      Caption = 'Refresh'
    end
  end
end
