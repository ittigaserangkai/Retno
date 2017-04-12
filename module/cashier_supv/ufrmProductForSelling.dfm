inherited frmProductForSelling: TfrmProductForSelling
  Left = 222
  Top = 137
  Caption = 'Master Product For Selling'
  ClientHeight = 419
  ClientWidth = 694
  OldCreateOrder = True
  ExplicitWidth = 710
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 694
    Height = 333
    ExplicitWidth = 694
    ExplicitHeight = 333
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 672
      Height = 311
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 14
        Width = 94
        Height = 18
        Caption = 'PRODUCT CODE'
      end
      object lbl2: TLabel
        Left = 16
        Top = 68
        Width = 33
        Height = 18
        Caption = 'MERK'
      end
      object lbl3: TLabel
        Left = 16
        Top = 41
        Width = 96
        Height = 18
        Caption = 'PRODUCT NAME'
      end
      object lbl4: TLabel
        Left = 16
        Top = 95
        Width = 34
        Height = 18
        Caption = 'ALIAS'
      end
      object lbl5: TLabel
        Left = 296
        Top = 176
        Width = 91
        Height = 18
        Caption = 'CATALOG CODE'
      end
      object lbl6: TLabel
        Left = 16
        Top = 149
        Width = 94
        Height = 18
        Caption = 'PRODUCT TYPE'
      end
      object lbl7: TLabel
        Left = 16
        Top = 176
        Width = 82
        Height = 18
        Caption = 'UOM SELLING'
      end
      object lbl8: TLabel
        Left = 16
        Top = 122
        Width = 84
        Height = 18
        Caption = 'OUTLET CODE'
      end
      object edtProdName: TEdit
        Left = 123
        Top = 38
        Width = 358
        Height = 24
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'TRADISIONAL'
      end
      object edtProdMerk: TEdit
        Left = 123
        Top = 65
        Width = 249
        Height = 24
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'PASAR'
      end
      object edtProdMerkName: TEdit
        Left = 123
        Top = 92
        Width = 358
        Height = 24
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Text = 'PATRA (ANEKA BUAH LOKAL)'
      end
      object edtCatalog: TEdit
        Left = 395
        Top = 173
        Width = 230
        Height = 24
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
        Text = '00019928001'
      end
      object edtProdType: TEdit
        Left = 123
        Top = 146
        Width = 162
        Height = 24
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        Text = 'BARANG SENDIRI'
      end
      object edtOutlet: TEdit
        Left = 123
        Top = 119
        Width = 84
        Height = 24
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        Text = '01'
      end
      object pnl2: TPanel
        Left = 16
        Top = 206
        Width = 265
        Height = 96
        BevelOuter = bvLowered
        TabOrder = 8
        object lbl9: TLabel
          Left = 8
          Top = 24
          Width = 165
          Height = 18
          Caption = 'SELLING PRICE AFTER PPN:'
        end
        object jvcurrSellPrice: TcxCurrencyEdit
          Left = 8
          Top = 46
          TabStop = False
          ParentFont = False
          TabOrder = 0
          Width = 249
        end
      end
      object pnl3: TPanel
        Left = 294
        Top = 206
        Width = 331
        Height = 97
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 15198183
        Enabled = False
        TabOrder = 9
        object lbl10: TLabel
          Left = 20
          Top = 9
          Width = 39
          Height = 18
          Caption = 'STOCK'
        end
        object lbl11: TLabel
          Left = 20
          Top = 36
          Width = 94
          Height = 18
          Caption = 'SELLING TODAY'
        end
        object lbl12: TLabel
          Left = 20
          Top = 63
          Width = 100
          Height = 18
          Caption = 'CURRENT STOCK'
        end
        object edtUOMSTock1: TEdit
          Left = 261
          Top = 6
          Width = 62
          Height = 24
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtUOMStock2: TEdit
          Left = 261
          Top = 33
          Width = 62
          Height = 24
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtUOMStock3: TEdit
          Left = 261
          Top = 60
          Width = 62
          Height = 24
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
        end
        object jvSelling: TcxCurrencyEdit
          Left = 136
          Top = 33
          TabOrder = 3
          Width = 121
        end
        object jvStock: TcxCurrencyEdit
          Left = 136
          Top = 6
          TabOrder = 4
          Width = 121
        end
        object jvCurrentStock: TcxCurrencyEdit
          Left = 136
          Top = 60
          TabOrder = 5
          Width = 121
        end
      end
      object edProductCode: TcxButtonEdit
        Left = 123
        Top = 11
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        OnKeyDown = edProductCodeKeyDown
        Width = 126
      end
      object cbUOMJual: TComboBox
        Left = 123
        Top = 172
        Width = 84
        Height = 26
        BevelKind = bkFlat
        Style = csDropDownList
        TabOrder = 6
        OnChange = cbUOMJualChange
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 694
    ExplicitWidth = 694
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 363
    Width = 694
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 363
    ExplicitWidth = 694
    inherited pnlFooter: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited bvlSeparator: TBevel
        Visible = False
      end
      inherited btnClose: TcxButton
        Left = 612
        ExplicitLeft = 612
      end
      inherited btnAdd: TcxButton
        Visible = False
      end
      inherited btnUpdate: TcxButton
        Visible = False
      end
      inherited btnDelete: TcxButton
        Visible = False
      end
      inherited btnRefresh: TcxButton
        Visible = False
      end
    end
    inherited pnlSortCut: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited lbl1: TLabel
        Visible = False
      end
      inherited lbl2: TLabel
        Visible = False
      end
      inherited lbl3: TLabel
        Visible = False
      end
      inherited lbl4: TLabel
        Visible = False
      end
      inherited lbl5: TLabel
        Left = 604
        ExplicitLeft = 606
      end
    end
  end
end
