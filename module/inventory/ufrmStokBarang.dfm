inherited frmStokBarang: TfrmStokBarang
  Left = 406
  Top = 218
  Caption = 'Stock Barang'
  ClientHeight = 485
  ClientWidth = 694
  OldCreateOrder = True
  ExplicitWidth = 710
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 694
    Height = 396
    ExplicitWidth = 694
    ExplicitHeight = 396
    inherited pgcBrowse: TcxPageControl
      Top = 97
      Width = 692
      Height = 298
      TabOrder = 1
      ExplicitTop = 97
      ExplicitWidth = 692
      ExplicitHeight = 298
      ClientRectBottom = 297
      ClientRectRight = 691
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 690
        ExplicitHeight = 296
        inherited cxGrid: TcxGrid
          Width = 690
          Height = 296
          ExplicitWidth = 690
          ExplicitHeight = 296
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 692
      Height = 96
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 9
        Top = 63
        Width = 62
        Height = 16
        Caption = 'Kode Barang'
      end
      object lbl2: TLabel
        Left = 9
        Top = 36
        Width = 60
        Height = 16
        Caption = 'Kode Suplier'
      end
      object lbl3: TLabel
        Left = 9
        Top = 9
        Width = 59
        Height = 16
        Caption = 'Tipe Barang'
      end
      object edtKodeSup: TcxButtonEdit
        Left = 81
        Top = 33
        Properties.Buttons = <>
        TabOrder = 0
        OnKeyUp = edtKodeSupKeyUp
        Width = 121
      end
      object edtKodeBrg: TcxButtonEdit
        Left = 81
        Top = 60
        Properties.Buttons = <>
        TabOrder = 1
        OnKeyUp = edtKodeBrgKeyUp
        Width = 121
      end
      object edtNamaSuplier: TEdit
        Left = 210
        Top = 33
        Width = 121
        Height = 22
        ReadOnly = True
        TabOrder = 2
      end
      object edtNamaBrg: TEdit
        Left = 210
        Top = 60
        Width = 121
        Height = 22
        ReadOnly = True
        TabOrder = 3
      end
      object chkSupplier: TCheckBox
        Left = 342
        Top = 37
        Width = 55
        Height = 17
        Caption = 'Semua'
        TabOrder = 4
      end
      object chkBarang: TCheckBox
        Left = 342
        Top = 60
        Width = 61
        Height = 17
        Caption = 'Semua'
        TabOrder = 5
      end
      object cbbTipe: TComboBox
        Left = 81
        Top = 6
        Width = 121
        Height = 24
        Style = csDropDownList
        TabOrder = 6
      end
      object chkTipe: TCheckBox
        Left = 213
        Top = 6
        Width = 61
        Height = 17
        Caption = 'Semua'
        TabOrder = 7
      end
      object grp1: TGroupBox
        Left = 408
        Top = 8
        Width = 137
        Height = 81
        Caption = 'Report Option'
        TabOrder = 8
        object chkPODetail: TCheckBox
          Left = 4
          Top = 16
          Width = 125
          Height = 17
          Caption = 'Tampilkan Detail PO'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkHargaJual: TCheckBox
          Left = 4
          Top = 40
          Width = 125
          Height = 17
          Caption = 'Tampilkan Harga Jual'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chk1: TCheckBox
          Left = 4
          Top = 64
          Width = 125
          Height = 17
          Caption = 'Tampilkan Qty Nol (0)'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 694
    ExplicitWidth = 694
    inherited lblHeader: TLabel
      Width = 85
      Caption = 'STOCK BARANG'
      ExplicitWidth = 85
    end
    inherited lblFilterData: TcxLabel
      Left = 340
      ExplicitLeft = 340
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 401
      ExplicitLeft = 401
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 517
      ExplicitLeft = 517
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 612
      ExplicitLeft = 612
    end
    inherited lblsdFilter: TcxLabel
      Left = 493
      ExplicitLeft = 493
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 429
    Width = 694
    ExplicitTop = 429
    ExplicitWidth = 694
    inherited pnlFooter: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited btnAdd: TcxButton
        Action = actAdd
        Visible = False
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Visible = False
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 617
        Action = actClose
        ExplicitLeft = 617
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited lbEscape: TLabel
        Left = 620
        Height = 17
        ExplicitLeft = 620
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 344
    Top = 224
  end
end
