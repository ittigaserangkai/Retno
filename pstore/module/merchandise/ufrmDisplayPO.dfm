inherited frmDisplayPO: TfrmDisplayPO
  Left = 217
  Top = 91
  Caption = 'Display PO'
  ClientHeight = 486
  ClientWidth = 773
  KeyPreview = True
  OldCreateOrder = True
  ExplicitWidth = 789
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 773
    Height = 456
    BevelInner = bvRaised
    BorderWidth = 0
    ExplicitWidth = 773
    ExplicitHeight = 456
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 769
      Height = 124
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 17
        Top = 7
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lbl5: TLabel
        Left = 265
        Top = 4
        Width = 41
        Height = 16
        Caption = 'Date PO'
      end
      object lbl6: TLabel
        Left = 19
        Top = 27
        Width = 33
        Height = 16
        Caption = 'SO No.'
        Visible = False
      end
      object lbl7: TLabel
        Left = 265
        Top = 28
        Width = 40
        Height = 16
        Caption = 'Date SO'
        Visible = False
      end
      object lbl8: TLabel
        Left = 12
        Top = 73
        Width = 39
        Height = 16
        Caption = 'Supplier'
      end
      object lbl2: TLabel
        Left = 265
        Top = 50
        Width = 42
        Height = 16
        Caption = 'Date DO'
      end
      object lbl4: TLabel
        Left = 18
        Top = 50
        Width = 35
        Height = 16
        Caption = 'DO No.'
      end
      object lbl9: TLabel
        Left = 37
        Top = 97
        Width = 13
        Height = 16
        Caption = 'NP'
      end
      object lbl10: TLabel
        Left = 635
        Top = 4
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl13: TLabel
        Left = 661
        Top = 51
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl14: TLabel
        Left = 640
        Top = 73
        Width = 39
        Height = 16
        Caption = 'PPn. BM'
      end
      object lbl12: TLabel
        Left = 636
        Top = 27
        Width = 44
        Height = 16
        Caption = 'Discount'
      end
      object lbl11: TLabel
        Left = 635
        Top = 96
        Width = 44
        Height = 16
        Caption = 'Total Beli'
      end
      object lbl3: TLabel
        Left = 402
        Top = 4
        Width = 57
        Height = 16
        Caption = 'Total Order'
        Visible = False
      end
      object lbl15: TLabel
        Left = 548
        Top = 4
        Width = 29
        Height = 16
        Caption = 'Bonus'
        Visible = False
      end
      object lbl16: TLabel
        Left = 407
        Top = 28
        Width = 51
        Height = 16
        Caption = 'Total Colie'
        Visible = False
      end
      object lbl17: TLabel
        Left = 517
        Top = 28
        Width = 59
        Height = 16
        Caption = 'Recv. Bonus'
        Visible = False
      end
      object lbl24: TLabel
        Left = 200
        Top = 94
        Width = 18
        Height = 15
        Caption = 'new'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lblStatusPO: TLabel
        Left = 540
        Top = 100
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
      object edtPONo: TEdit
        Left = 55
        Top = 4
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtPONoChange
        OnKeyPress = edtPONoKeyPress
      end
      object dtDatePO: TcxDateEdit
        Left = 309
        Top = 4
        TabOrder = 1
        Width = 90
      end
      object dtDateSO: TcxDateEdit
        Left = 309
        Top = 27
        TabOrder = 3
        Visible = False
        Width = 90
      end
      object edtSONo: TEdit
        Left = 55
        Top = 27
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Visible = False
      end
      object edtSuplierCode: TEdit
        Left = 55
        Top = 73
        Width = 50
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
        Text = 'ITTS1'
      end
      object edtSuplierName: TEdit
        Left = 106
        Top = 73
        Width = 495
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object edtDONo: TEdit
        Left = 55
        Top = 50
        Width = 106
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = edtDONoKeyPress
      end
      object dtDateDO: TcxDateEdit
        Left = 309
        Top = 50
        TabOrder = 5
        Width = 90
      end
      object edtNP: TEdit
        Left = 55
        Top = 96
        Width = 140
        Height = 22
        Color = clBtnFace
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
        Text = '0000010029'
        OnKeyPress = edtDONoKeyPress
      end
      object jvcuredtSubTotal: TcxCurrencyEdit
        Left = 684
        Top = 3
        TabOrder = 13
        Width = 99
      end
      object jvcuredtPPN: TcxCurrencyEdit
        Left = 684
        Top = 49
        TabOrder = 15
        Width = 99
      end
      object jvcuredtPPNBM: TcxCurrencyEdit
        Left = 684
        Top = 72
        TabOrder = 16
        Width = 99
      end
      object jvcuredtDiscount: TcxCurrencyEdit
        Left = 684
        Top = 26
        TabOrder = 14
        Width = 99
      end
      object jvcuredtTotalBeli: TcxCurrencyEdit
        Left = 684
        Top = 95
        TabOrder = 17
        Width = 99
      end
      object edtjfBonus: TcxCurrencyEdit
        Left = 581
        Top = 4
        TabOrder = 8
        Visible = False
        Width = 51
      end
      object edtjfTotalColie: TcxCurrencyEdit
        Left = 463
        Top = 27
        TabOrder = 7
        Visible = False
        Width = 51
      end
      object edtjfRecvBonus: TcxCurrencyEdit
        Left = 581
        Top = 27
        TabOrder = 9
        Visible = False
        Width = 51
      end
      object edtjfTotalOrder: TcxCurrencyEdit
        Left = 463
        Top = 4
        TabOrder = 6
        Visible = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 51
      end
      object chkAllUnit: TCheckBox
        Left = 411
        Top = 54
        Width = 97
        Height = 17
        Caption = 'All Unit'
        TabOrder = 18
        Visible = False
      end
      object btnBrowsePoNo: TcxButton
        Left = 162
        Top = 3
        Width = 41
        Height = 25
        Caption = 'F2'
        OptionsImage.ImageIndex = 30
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 19
        OnClick = btnBrowsePoNoClick
      end
      object btnSlipNew: TcxButton
        Left = 210
        Top = 3
        Width = 47
        Height = 25
        Caption = 'Slip'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 20
        OnClick = btnSlipNewClick
      end
      object btnSlip: TcxButton
        Left = 170
        Top = 35
        Width = 47
        Height = 25
        Caption = 'Slip'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 21
        OnClick = btnSlipNewClick
      end
      object btnChekListNp: TcxButton
        Left = 226
        Top = 96
        Width = 151
        Height = 25
        Caption = 'Check List NP (Ctrl-D)'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 22
        OnClick = btnSlipNewClick
      end
      object btnCetakNP: TcxButton
        Left = 386
        Top = 96
        Width = 87
        Height = 25
        Caption = 'NP (Ctrl-P)'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 23
        OnClick = btnSlipNewClick
      end
    end
    inline fraFooter5Button1: TfraFooter5Button
      Left = 2
      Top = 398
      Width = 769
      Height = 56
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 398
      ExplicitWidth = 769
      inherited pnlFooter: TPanel
        Width = 769
        ExplicitWidth = 769
        inherited bvlSeparator: TBevel
          Left = 89
          Visible = False
          ExplicitLeft = 89
        end
        inherited btnClose: TcxButton
          Left = 687
          ExplicitLeft = 687
        end
        inherited btnAdd: TcxButton
          Action = actSaveGoodReceiving
          OptionsImage.Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000FF00FF663333
            6633336633336633336633336633336633336633336633336633336633336633
            33663333663333FF00FFFF00FF60606060606060606060606060606060606060
            6060606060606060606060606060606060606060606060000000FF00FFD78300
            FFCACC993300D4E3FFD4E3FFD4D4FFD4E3FFD4D4FFD4E3FFD4D4FFD4D4FF9933
            00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF606060FFFFFF606060FFFFFFFF00FFD78300
            FFE2B4993300D4E3FFCC9999CC9999CC9999CC9999CC9999CC9999D4D4FF9933
            00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
            FFCACC993300D4E3FFD4E3FFD4E3FFD4E3FFD4D4FFD4E3FFD4D4FFD4E3FF9933
            00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
            FFE2B4993300F0D4FFCC9999CC9999CC9999CC9999CC9999CC9999D4D4FF9933
            00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
            FFCACC993300D4E3FFF0D4FFD4E3FFD4E3FFD4E3FFD4E3FFD4D4FFD4E3FF9933
            00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
            FFE2B4FFCACC993300993300993300993300993300993300993300993300CC99
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF60606060606060606060
            6060606060606060606060606060FF00FFFF00FF606060FFFFFFFF00FFD78300
            FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC99CC9999CC99
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF606060FFFFFFFF00FFD78300
            FFE2B4FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC99CC99
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
            FFCACCFFCC99FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
            FFE2B4FFCACC606060404040404040404040404040404040404040FFCC99CC99
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF60606060606060606060
            6060606060606060606060FF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
            FFCACCFFCC99606060DCDCDCDCDCDCBFBFBF9F9F9FBFBFBF7F7F7F404040FFCC
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF606060FF00FFFF00FF606060FFFFFFFF00FFD78300
            FFE2B4FFCACC606060DCDCDCFFFFFFDCDCDCBFBFBF9F9F9FBFBFBF404040CC99
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFFF
            00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFD78300
            FFCACCFFCC99606060DCDCDCFFFFFFDCDCDCDCDCDCBFBFBF9F9F9F404040CC99
            99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFFF
            00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFD78300
            D78300D78300D78300D78300D78300D78300D78300D78300D78300D78300D783
            00D78300FF00FFFF00FFFF00FF60606060606060606060606060606060606060
            6060606060606060606060606060606060606060FFFFFFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF}
          Visible = False
        end
        inherited btnUpdate: TcxButton
          Left = 256
          Width = 111
          Caption = 'Cetak Ulang NP'
          Visible = False
          ExplicitLeft = 256
          ExplicitWidth = 111
        end
        inherited btnDelete: TcxButton
          Left = 414
          Visible = False
          ExplicitLeft = 414
        end
        inherited btnRefresh: TcxButton
          Left = 97
          Width = 90
          Action = actClearGoodReceiving
          OptionsImage.Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFCC6600CC6600500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            CC6600D78300D78300CC6600500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FF606060FF
            FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC6600
            FF9900DE9A3ED78300D78300CC6600500000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FF60
            6060FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFCC6600FFCC99
            FF9900FF9900DE9A3ED78300D78300CC6600500000FF00FFFF00FFFF00FF5000
            00500000500000500000606060FFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF
            00FF606060FFFFFFFF00FFFF00FF606060606060606060606060D78300CC6600
            CC6600FF9900FF9900DE9A3E500000500000500000FF00FFFF00FFFF00FFCC66
            00CC6600CC6600500000606060606060606060FFFFFFFF00FFFF00FF60606060
            6060606060FFFFFFFF00FFFF00FF606060FFFFFFFF00FF606060FF00FFFF00FF
            CC6600FFAA00FF9900FF9900500000FF00FFFF00FFFF00FFFF00FFFF00FFCC66
            00D78300CC6600500000FF00FFFF00FF606060FFFFFFFF00FFFF00FF606060FF
            FFFFFFFFFFFFFFFFFF00FFFF00FF606060FFFFFFFF00FF606060FF00FFFF00FF
            CC6600FFCC99FFAA00FF9900CC6600500000FF00FFFF00FFFF00FFCC6600D783
            00D78300CC6600500000FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FF60
            6060FFFFFFFF00FFFF00FF606060FFFFFFFF00FFFFFFFF606060FF00FFFF00FF
            FF00FFCC6600FFCC99FFAA00FF9900CC6600500000500000500000D78300D783
            00D78300500000FF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF
            00FF606060606060606060FFFFFFFF00FFFF00FF606060FF00FFFF00FFFF00FF
            FF00FFCC6600FFCC99FFCC99FFAA00FF9900CC6600CC6600CC6600DE9A3ED783
            00D78300500000FF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF606060FF00FFFF00FFFF00FF
            FF00FFFF00FFCC6600FFCC99FFCC99FFAA00FF9900FF9900FF9900DE9A3EDE9A
            3E500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFFFFFFFF
            00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF606060FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFCC6600CC6600FFCC99FFAA00FF9900FF9900CC6600CC66
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060606060FF
            FFFFFFFFFFFFFFFFFFFFFF606060606060FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFCC6600CC6600CC6600CC6600FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60
            6060606060606060606060FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Visible = False
          ExplicitLeft = 97
          ExplicitWidth = 90
        end
      end
      inherited pnlSortCut: TPanel
        Width = 769
        ExplicitWidth = 769
        inherited lbl1: TLabel
          Left = 10
          Width = 79
          Caption = 'CTRL-S [Simpan]'
          Visible = False
          ExplicitLeft = 10
          ExplicitWidth = 79
        end
        inherited lbl2: TLabel
          Left = 95
          Width = 107
          Caption = 'CTRL-F5 [Clear Value]'
          Visible = False
          ExplicitLeft = 95
          ExplicitWidth = 107
        end
        inherited lbl3: TLabel
          Left = 254
          Width = 123
          Caption = 'CTRL-C [Cetak Ulang NP]'
          Visible = False
          ExplicitLeft = 254
          ExplicitWidth = 123
        end
        inherited lbl4: TLabel
          Left = 435
          Visible = False
          ExplicitLeft = 435
        end
        inherited lbl5: TLabel
          Left = 679
          ExplicitLeft = 698
        end
      end
    end
    object pnl1: TPanel
      Left = 2
      Top = 126
      Width = 769
      Height = 208
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 5
      Caption = 'pnl1'
      TabOrder = 2
      object cxGrid: TcxGrid
        Left = 6
        Top = 6
        Width = 757
        Height = 196
        Align = alClient
        TabOrder = 0
        LockedStateImageOptions.Text = 'Mohon ditunggu...'
        ExplicitLeft = 0
        ExplicitTop = 137
        ExplicitWidth = 610
        ExplicitHeight = 102
        object cxGridView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.InfoText = 'ketik teks yang dicari...'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'klik untuk memfilter data'
          FilterRow.Visible = True
          NewItemRow.InfoText = 'Baris baru'
          OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
          OptionsView.GroupByBox = False
          object cxGridViewColumn1: TcxGridDBColumn
            Caption = 'NO'
          end
          object cxGridViewColumn2: TcxGridDBColumn
            Caption = 'KODE BARANG'
          end
          object cxGridViewColumn3: TcxGridDBColumn
            Caption = 'NAMA BARANG'
          end
          object cxGridViewColumn4: TcxGridDBColumn
            Caption = 'UOM'
          end
          object cxGridViewColumn5: TcxGridDBColumn
            Caption = 'HARGA'
          end
          object cxGridViewColumn6: TcxGridDBColumn
            Caption = 'QTY ORDER'
          end
          object cxGridViewColumn7: TcxGridDBColumn
            Caption = 'QTY RECV'
          end
          object cxGridViewColumn8: TcxGridDBColumn
            Caption = 'IS BONUS FOR BONUS'
          end
        end
        object cxlvMaster: TcxGridLevel
          GridView = cxGridView
        end
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 334
      Width = 769
      Height = 64
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 3
      object lbl18: TLabel
        Left = 15
        Top = 35
        Width = 46
        Height = 16
        Caption = 'Disc.1(%)'
      end
      object lbl19: TLabel
        Left = 110
        Top = 36
        Width = 46
        Height = 16
        Caption = 'Disc.2(%)'
      end
      object lbl20: TLabel
        Left = 348
        Top = 36
        Width = 52
        Height = 16
        Caption = 'Total Disc.'
        Visible = False
      end
      object lbl21: TLabel
        Left = 208
        Top = 36
        Width = 49
        Height = 16
        Caption = 'Nilai Disc.'
      end
      object lbl22: TLabel
        Left = 574
        Top = 35
        Width = 114
        Height = 16
        Caption = 'Selling Price After Disc.'
        Visible = False
      end
      object lbl23: TLabel
        Left = 15
        Top = 6
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object edtProductName: TEdit
        Left = 90
        Top = 6
        Width = 614
        Height = 22
        Color = 15198183
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'SOFTEXSAFE & SOFT PANTYLINER 48/20'#39'S (PCS)'
      end
      object edtjfDisc1: TcxCurrencyEdit
        Left = 64
        Top = 35
        TabOrder = 1
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 39
      end
      object edtjfDisc2: TcxCurrencyEdit
        Left = 159
        Top = 35
        TabOrder = 2
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 39
      end
      object jvcuredtNilaiDisc: TcxCurrencyEdit
        Left = 258
        Top = 35
        TabOrder = 3
        Width = 82
      end
      object jvcuredtTotalDisc: TcxCurrencyEdit
        Left = 403
        Top = 35
        TabOrder = 4
        Visible = False
        Width = 164
      end
      object jvcuredtSellPrice: TcxCurrencyEdit
        Left = 693
        Top = 34
        TabOrder = 5
        Visible = False
        Width = 93
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 773
    ExplicitWidth = 773
  end
  object actlst1: TActionList
    Left = 624
    object actSaveGoodReceiving: TAction
      Caption = 'Save'
    end
    object actClearGoodReceiving: TAction
      Caption = 'Clear Value'
      OnExecute = actClearGoodReceivingExecute
    end
  end
end
