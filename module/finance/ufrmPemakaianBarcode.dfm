inherited frmPemakaianBarcode: TfrmPemakaianBarcode
  Left = 243
  Top = 102
  Caption = 'Barcode Usage'
  ClientHeight = 415
  ClientWidth = 677
  OldCreateOrder = True
  ExplicitWidth = 693
  ExplicitHeight = 454
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 677
    Height = 326
    ExplicitWidth = 677
    ExplicitHeight = 326
    inherited pgcBrowse: TcxPageControl
      Top = 119
      Width = 675
      Height = 155
      TabOrder = 2
      ExplicitTop = 119
      ExplicitWidth = 675
      ExplicitHeight = 155
      ClientRectBottom = 154
      ClientRectRight = 674
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 673
        ExplicitHeight = 153
        inherited cxGrid: TcxGrid
          Width = 673
          Height = 153
          ExplicitWidth = 673
          ExplicitHeight = 153
          inherited cxGridView: TcxGridDBTableView
            object cxcolGridViewColumn1: TcxGridDBColumn
              Caption = 'SUPPLIER CODE'
            end
            object cxcolGridViewColumn2: TcxGridDBColumn
              Caption = 'SUPPLIER NAME'
            end
            object cxcolGridViewColumn3: TcxGridDBColumn
              Caption = 'QTY'
            end
            object cxcolGridViewColumn4: TcxGridDBColumn
              Caption = 'TOTAL PRICE PER SUPPLIER'
            end
            object cxcolGridViewColumn5: TcxGridDBColumn
              Caption = 'NO POTONGAN'
            end
            object cxcolGridViewColumn6: TcxGridDBColumn
              Caption = 'ID'
            end
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 675
      Height = 118
      Align = alTop
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl2: TLabel
        Left = 8
        Top = 32
        Width = 59
        Height = 16
        Caption = 'Suplier Type'
      end
      object lbl3: TLabel
        Left = 8
        Top = 58
        Width = 25
        Height = 16
        Caption = 'Price'
      end
      object lbl4: TLabel
        Left = 8
        Top = 82
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object dtBarcode: TcxDateEdit
        Left = 80
        Top = 8
        TabOrder = 0
        OnKeyUp = dtBarcodeKeyUp
        Width = 137
      end
      object cbbTipeSuplier: TComboBox
        Left = 80
        Top = 32
        Width = 137
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyUp = cbbTipeSuplierKeyUp
      end
      object curredtHarga: TcxCurrencyEdit
        Left = 80
        Top = 58
        TabOrder = 2
        OnEnter = curredtHargaEnter
        OnKeyUp = curredtHargaKeyUp
        Width = 137
      end
      object edtDescription: TEdit
        Left = 80
        Top = 82
        Width = 489
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        OnKeyUp = edtDescriptionKeyUp
      end
      object btnSave: TcxButton
        AlignWithMargins = True
        Left = 573
        Top = 80
        Width = 72
        Height = 25
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Save'
        OptionsImage.ImageIndex = 2
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 4
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 274
      Width = 675
      Height = 51
      Align = alBottom
      Color = 15198183
      TabOrder = 1
      object lbl5: TLabel
        Left = 16
        Top = 26
        Width = 72
        Height = 16
        Caption = 'Total Quantity'
      end
      object lbl6: TLabel
        Left = 231
        Top = 27
        Width = 52
        Height = 16
        Caption = 'Total Price'
      end
      object lblDeleteRow: TLabel
        Left = 144
        Top = 2
        Width = 116
        Height = 16
        Caption = 'Ctrl + R (Remove A Row)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblDeleteRowClick
      end
      object lblAddRow: TLabel
        Left = 16
        Top = 2
        Width = 113
        Height = 16
        Caption = 'Ctrl + T (Add New Row)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblAddRowClick
      end
      object intedtTotalQty: TcxCurrencyEdit
        Left = 96
        Top = 24
        TabOrder = 0
        Width = 121
      end
      object curredtTotalPrice: TcxCurrencyEdit
        Left = 288
        Top = 24
        TabOrder = 1
        Width = 121
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 677
    ExplicitWidth = 677
    inherited lblHeader: TLabel
      Width = 90
      Caption = 'BARCODE USAGE'
      ExplicitWidth = 90
    end
    inherited lblFilterData: TcxLabel
      Left = 323
      ExplicitLeft = 323
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 384
      ExplicitLeft = 384
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 500
      ExplicitLeft = 500
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 595
      ExplicitLeft = 595
    end
    inherited lblsdFilter: TcxLabel
      Left = 476
      ExplicitLeft = 476
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 359
    Width = 677
    ExplicitTop = 359
    ExplicitWidth = 677
    inherited pnlFooter: TPanel
      Width = 677
      ExplicitWidth = 677
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
        Left = 600
        Action = actClose
        ExplicitLeft = 600
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 677
      ExplicitWidth = 677
      inherited lbEscape: TLabel
        Left = 603
        ExplicitLeft = 603
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
    object actDeletePemakaianBarcode: TAction
      Caption = '&Delete'
      OnExecute = actDeletePemakaianBarcodeExecute
    end
  end
end
