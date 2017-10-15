inherited frmKuponBotol: TfrmKuponBotol
  Caption = 'Transaksi Kupon Botol'
  ClientWidth = 747
  ExplicitWidth = 763
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 147
    Width = 747
    Height = 200
    inherited pgcBrowse: TcxPageControl
      Width = 745
      Height = 198
      ClientRectBottom = 197
      ClientRectRight = 744
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 697
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 743
          Height = 196
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 747
    inherited lblFilterData: TcxLabel
      Left = 393
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 454
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 570
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 665
    end
    inherited lblsdFilter: TcxLabel
      Left = 546
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Width = 747
    inherited pnlFooter: TPanel
      Width = 747
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
        Left = 670
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 747
      inherited lbEscape: TLabel
        Left = 673
        Height = 17
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 33
    Width = 747
    Height = 114
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    object cxLabel1: TcxLabel
      Left = 8
      Top = 6
      Caption = 'Date'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 32
      Caption = 'Voucher No'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 58
      Caption = 'Member Code'
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 8
      Top = 84
      Caption = 'member name'
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 356
      Top = 6
      Caption = 'POS Trans. No'
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 356
      Top = 32
      Caption = 'Status'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 356
      Top = 58
      Caption = 'Description'
      Transparent = True
    end
    object dtpTanggal: TcxDateEdit
      Left = 88
      Top = 5
      TabOrder = 7
      Width = 89
    end
    object edTransactionNo: TcxButtonEdit
      Left = 88
      Top = 31
      Hint = '[Input Voucher No.]'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edTransactionNoPropertiesButtonClick
      TabOrder = 8
      Text = '[Input Voucher No.]'
      Width = 137
    end
    object edtKodeMember: TcxTextEdit
      Left = 88
      Top = 57
      Properties.ReadOnly = True
      TabOrder = 9
      Width = 137
    end
    object edtMemberName: TcxTextEdit
      Left = 88
      Top = 83
      Properties.ReadOnly = True
      TabOrder = 10
      Width = 265
    end
    object edtPOSTransNo: TcxTextEdit
      Left = 435
      Top = 5
      Properties.ReadOnly = True
      TabOrder = 11
      Width = 137
    end
    object edtStatus: TcxTextEdit
      Left = 435
      Top = 31
      Properties.ReadOnly = True
      TabOrder = 12
      Width = 137
    end
    object edtKeterangan: TcxTextEdit
      Left = 435
      Top = 57
      Properties.ReadOnly = True
      TabOrder = 13
      Width = 265
    end
    object cxLabel8: TcxLabel
      Left = 359
      Top = 84
      Caption = 'Total Price'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object curredtTotalPrice: TcxCurrencyEdit
      Left = 435
      Top = 83
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 15
      Width = 137
    end
  end
  inherited actlstBrowse: TActionList
    Left = 584
    Top = 224
  end
end
