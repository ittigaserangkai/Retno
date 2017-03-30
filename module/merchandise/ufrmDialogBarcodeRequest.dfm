inherited frmDialogBarcodeRequest: TfrmDialogBarcodeRequest
  Left = 272
  Top = 143
  Caption = 'Add Barcode Requestition'
  ClientHeight = 487
  ClientWidth = 672
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 688
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 672
    Height = 431
    ExplicitWidth = 672
    ExplicitHeight = 431
    inherited cxGrid: TcxGrid
      Top = 233
      Width = 668
      Height = 155
      TabOrder = 2
      ExplicitTop = 233
      ExplicitWidth = 668
      ExplicitHeight = 155
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 668
      Height = 231
      Align = alTop
      Color = 15198183
      TabOrder = 0
      DesignSize = (
        668
        231)
      object lbl1: TLabel
        Left = 16
        Top = 35
        Width = 49
        Height = 16
        Caption = 'SUPPLIER '
      end
      object lbl3: TLabel
        Left = 16
        Top = 64
        Width = 56
        Height = 16
        Caption = 'UNIT PRICE'
      end
      object lbl6: TLabel
        Left = 16
        Top = 10
        Width = 15
        Height = 16
        Caption = 'NO'
      end
      object bvl1: TBevel
        Left = 14
        Top = 90
        Width = 633
        Height = 7
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
        ExplicitWidth = 635
      end
      object Label2: TLabel
        Left = 224
        Top = 10
        Width = 44
        Height = 16
        Caption = 'TANGGAL'
      end
      object edtSupplierName: TEdit
        Left = 224
        Top = 36
        Width = 344
        Height = 22
        TabStop = False
        Color = 15066597
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtBarNo: TEdit
        Left = 98
        Top = 10
        Width = 119
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = edtBarNoKeyPress
      end
      object dtTgl: TcxDateEdit
        Left = 279
        Top = 10
        TabOrder = 1
        OnKeyPress = dtTglKeyPress
        Width = 130
      end
      object grpProduct: TGroupBox
        Left = 0
        Top = 96
        Width = 425
        Height = 129
        Caption = 'Insert Product'
        TabOrder = 2
        object lbl2: TLabel
          Left = 16
          Top = 27
          Width = 47
          Height = 16
          Caption = 'PRODUCT'
        end
        object Label3: TLabel
          Left = 15
          Top = 47
          Width = 23
          Height = 16
          Caption = 'UOM'
        end
        object lbl4: TLabel
          Left = 16
          Top = 73
          Width = 21
          Height = 16
          Caption = 'QTY'
        end
        object lbl5: TLabel
          Tag = 152
          Left = 16
          Top = 105
          Width = 62
          Height = 16
          Caption = 'TOTAL PRICE'
        end
        object edtProductName: TEdit
          Left = 224
          Top = 20
          Width = 193
          Height = 22
          TabStop = False
          BorderStyle = bsNone
          Color = 15066597
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object cbUOM: TComboBox
          Left = 96
          Top = 45
          Width = 122
          Height = 24
          Style = csDropDownList
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = cbUOMKeyPress
        end
        object IntEdtQty: TcxCurrencyEdit
          Left = 98
          Top = 73
          EditValue = 0
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0.00;(,0.00)'
          TabOrder = 3
          OnExit = IntEdtQtyExit
          OnKeyDown = IntEdtQtyKeyDown
          OnKeyPress = IntEdtQtyKeyPress
          Width = 119
        end
        object btnAddRow: TcxButton
          Left = 222
          Top = 94
          Width = 107
          Height = 27
          Cursor = crHandPoint
          Caption = 'Add'
          OptionsImage.Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FF005032005032005032005032005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60606060606060
            6060606060606060FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00734A009900009900009900005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            FFFFFFFFFF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00734A00B93D009900009900005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00734A00963100B93D009900005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00734A00B93D00963100B93D005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF005032005032
            00503200503200503200503200B93D00B93D0096310050320050320050320050
            32005032005032FF00FF606060606060606060606060606060606060FFFFFFFF
            00FFFF00FF606060606060606060606060606060606060FF00FF00990066FF99
            00B93D00B93D00B93D00B93D00B93D00B93D00B93D00963100B93D0099000099
            00009900005032FF00FF606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF606060FFFFFF0099008EFFAB
            8EFFAB66FF9966FF9933CC6633CC6600B93D00B93D00B93D00963100B93D0099
            00009900005032FF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF00990066FF99
            8EFFAB8EFFAB66FF9966FF9966FF9933CC6600B93D00B93D00B93D00963100B9
            3D009900005032FF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF009900009900
            00990000990000990000990066FF9933CC6600B93D00503200734A00734A0073
            4A00734A005032FF00FF606060606060606060606060606060606060FF00FFFF
            00FFFF00FF606060606060606060606060606060606060FFFFFFFF00FFFF00FF
            FF00FFFF00FFFF00FF00990066FF9966FF9900B93D005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
            FF00FFFF00FFFF00FF00990066FF9966FF9900B93D005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0099008EFFAB66FF9900B93D005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00990066FF998EFFAB00B93D005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF
            00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF009900009900009900009900005032FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60606060606060
            6060606060606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OptionsImage.NumGlyphs = 2
          TabOrder = 2
          OnClick = btnAddRowClick
        end
        object edbProductCode: TcxButtonEdit
          Left = 97
          Top = 19
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 4
          Text = 'cxButtonEdit1'
          Width = 121
        end
        object curredtTotal: TcxCurrencyEdit
          Left = 98
          Top = 99
          EditValue = 0.000000000000000000
          TabOrder = 5
          OnExit = IntEdtQtyExit
          OnKeyDown = IntEdtQtyKeyDown
          OnKeyPress = IntEdtQtyKeyPress
          Width = 119
        end
        object edbUOM: TcxButtonEdit
          Left = 224
          Top = 46
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 6
          Text = 'cxButtonEdit1'
          Width = 121
        end
      end
      object grpPurchaseOrder: TGroupBox
        Left = 432
        Top = 104
        Width = 233
        Height = 121
        Caption = 'Insert Received PO'
        TabOrder = 3
        object lbl7: TLabel
          Left = 9
          Top = 23
          Width = 34
          Height = 16
          Caption = 'PO No.'
        end
        object lbl8: TLabel
          Left = 8
          Top = 52
          Width = 41
          Height = 16
          Caption = 'PO Date'
        end
        object lblStatusPO: TLabel
          Left = 54
          Top = 84
          Width = 59
          Height = 16
          Alignment = taRightJustify
          Caption = 'lblStatusPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl9: TLabel
          Left = 8
          Top = 84
          Width = 32
          Height = 16
          Caption = 'Status'
        end
        object edtPONo: TEdit
          Left = 56
          Top = 20
          Width = 113
          Height = 22
          Ctl3D = False
          MaxLength = 10
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = edtPONoKeyPress
        end
        object bSearchPO: TcxButton
          Left = 179
          Top = 19
          Width = 41
          Height = 25
          Caption = 'F2'
          OptionsImage.Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E000000000000000000007F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00
            FF003250003250FF00FFBFBFBFFFFFFFBFBFBF7F7F7F9F9F9F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF7F7F7F7F7F7FFF00FFBFBFBFDCDCDC
            BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FF003D
            B90033FF0099CC003250BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFF00FF7F7F7FBFBFBFFFFFFF
            DCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBF606060003DB90033
            FFB1C7FF0055FF0032507F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
            BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF003DB90033FFB1C7
            FF0055FF0033FF0032509F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
            DCDCDCDCDCDCDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF003DB90033FFB1C7FF0055
            FF0033FF003250FF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
            FFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFBFBFBFFFFFFF
            DCDCDCDCDCDCBFBFBFFF9900CC6600CC6600CC6600BFBFBFBFBFBF0055FF0033
            FF003250FF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F
            7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFBFBFBFFFFFFF
            DCDCDCBFBFBFFF9900DE9A3EDE9A3EDE9A3ED78300CC66009F9F9F7F7F7F0032
            50FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF
            00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFBFBFBFFFFFFF
            FFFFFFFF9900DE9A3EFFCC99FFCC99FFCC99DE9A3ED78300663333003250FF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFBFBFBFFFFFFF
            DCDCDCFF9900FFE2B4FFE2B4FFE2B4FFCC99FFCC99DE9A3E663333FF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
            FFFFFFFF9900FFE2B4FFFFDEFFFFFFFFE2B4FFCC99DE9A3E663333FF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
            DCDCDCFF9900DE9A3EFFFFFFFFFFDEFFE2B4FFCC99DE9A3E663333FF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FDCDCDCFF00FFFF00FFFF
            00FFBFBFBFBFBFBF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
            FFFFFFDCDCDCCC6600DE9A3EFFE2B4FFE2B4DE9A3E6633337F7F7FFF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF9F9F9FDCDCDCFFFFFFFF
            FFFFFFFFFF7F7F7FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
            FFFFFFFFFFFFDCDCDCCC6600663333663333663333BFBFBF7F7F7FFF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF9F9F9F9F9F9F7F
            7F7F7F7F7FFF00FFBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
            FFFFFFFFFFFFFFFFFFDCDCDCFFFFFFDCDCDCDCDCDCDCDCDC7F7F7FFF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFC0C0C0FFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
            FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9F
            9F9F7F7F7F9F9F9FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF}
          OptionsImage.NumGlyphs = 2
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          OnClick = bSearchPOClick
        end
        object edtDatePO: TcxDateEdit
          Left = 55
          Top = 52
          TabOrder = 2
          Width = 114
        end
      end
      object edbSupplierCode: TcxButtonEdit
        Left = 97
        Top = 34
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 5
        Text = 'edbSupplierCode'
        Width = 121
      end
      object curredtUnitPrice: TcxCurrencyEdit
        Left = 98
        Top = 60
        EditValue = 0.000000000000000000
        TabOrder = 6
        OnExit = IntEdtQtyExit
        OnKeyDown = IntEdtQtyKeyDown
        OnKeyPress = IntEdtQtyKeyPress
        Width = 119
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 388
      Width = 668
      Height = 41
      Align = alBottom
      Color = 15198183
      TabOrder = 1
      DesignSize = (
        668
        41)
      object Label1: TLabel
        Left = 15
        Top = 13
        Width = 98
        Height = 16
        Caption = 'GRAND TOTAL PRICE'
      end
      object lblDelete: TcxLabel
        Left = 539
        Top = 17
        Anchors = [akRight, akBottom]
        Caption = 'Remove Row (Ctrl + R)'
        ParentFont = False
        OnClick = lblDeleteClick
      end
      object curreditTotalPrice: TcxCurrencyEdit
        Left = 122
        Top = 10
        EditValue = 0.000000000000000000
        TabOrder = 1
        OnExit = IntEdtQtyExit
        OnKeyDown = IntEdtQtyKeyDown
        OnKeyPress = IntEdtQtyKeyPress
        Width = 110
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 431
    Width = 672
    ExplicitTop = 431
    ExplicitWidth = 672
    inherited pnlFooter: TPanel
      Width = 672
      ExplicitWidth = 672
      inherited btnClose: TcxButton
        Left = 595
        Action = actCancel
        ExplicitLeft = 595
      end
      inherited btnSave: TcxButton
        Left = 502
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 502
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 425
        ExplicitLeft = 425
      end
    end
    inherited pnlSortCut: TPanel
      Width = 672
      ExplicitWidth = 672
      inherited lbCTRLEnter: TLabel
        Left = 497
        ExplicitLeft = 497
      end
      inherited lbEscape: TLabel
        Left = 588
        ExplicitLeft = 588
      end
      inherited lblCTRLP: TLabel
        Left = 421
        ExplicitLeft = 421
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
