inherited frmDialogVoucher: TfrmDialogVoucher
  Left = 285
  Top = 174
  Caption = 'Dialog Voucher'
  ClientHeight = 371
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 315
    ExplicitHeight = 315
    inherited cxGrid: TcxGrid
      Top = 187
      Height = 126
      TabOrder = 1
      ExplicitTop = 188
      ExplicitHeight = 126
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'CUSTOMER'
        end
        object cxcolGridViewColumn1: TcxGridDBColumn
          Caption = 'NO VOUCHER'
          Width = 93
        end
        object cxcolGridViewColumn2: TcxGridDBColumn
          Caption = 'NOMINAL'
          Width = 87
        end
        object cxcolGridViewColumn5: TcxGridDBColumn
          Caption = 'STATUS'
        end
        object cxcolGridViewColumn3: TcxGridDBColumn
          Caption = 'NO TRANSAKSI'
          Width = 79
        end
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 550
      Height = 185
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 16
        Top = 30
        Width = 77
        Height = 16
        Caption = 'Owner Voucher'
      end
      object Label1: TLabel
        Left = 16
        Top = 55
        Width = 50
        Height = 16
        Caption = 'Tgl Dibuat'
      end
      object lblInput: TLabel
        Left = 16
        Top = 105
        Width = 19
        Height = 16
        Caption = 'Qty'
      end
      object Label2: TLabel
        Left = 16
        Top = 80
        Width = 54
        Height = 16
        Caption = 'Tgl Berlaku'
      end
      object Label3: TLabel
        Left = 238
        Top = 80
        Width = 17
        Height = 16
        Caption = 's/d'
      end
      object Label4: TLabel
        Left = 16
        Top = 130
        Width = 82
        Height = 16
        Caption = 'Nominal Voucher'
      end
      object Label5: TLabel
        Left = 199
        Top = 107
        Width = 33
        Height = 16
        Caption = 'lembar'
      end
      object Label6: TLabel
        Left = 16
        Top = 5
        Width = 76
        Height = 16
        Caption = 'Nomor Voucher'
      end
      object Label7: TLabel
        Left = 18
        Top = 157
        Width = 70
        Height = 16
        Caption = 'Nominal Bayar'
      end
      object cbpDataCombo: TcxExtLookupComboBox
        Left = 104
        Top = 27
        TabOrder = 0
        Width = 89
      end
      object dtTgl: TcxDateEdit
        Left = 104
        Top = 52
        TabOrder = 1
        Width = 128
      end
      object JvDateEdit1: TcxDateEdit
        Left = 104
        Top = 77
        TabOrder = 2
        Width = 128
      end
      object JvDateEdit2: TcxDateEdit
        Left = 261
        Top = 77
        TabOrder = 3
        Width = 128
      end
      object cxTextEdit1: TcxTextEdit
        Left = 199
        Top = 27
        TabOrder = 4
        Width = 194
      end
      object cxTextEdit2: TcxTextEdit
        Left = 104
        Top = 102
        TabOrder = 5
        Width = 89
      end
      object cxTextEdit3: TcxTextEdit
        Left = 104
        Top = 127
        TabOrder = 6
        Width = 128
      end
      object cxTextEdit4: TcxTextEdit
        Left = 104
        Top = 2
        TabOrder = 7
        Width = 128
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 315
    ExplicitTop = 315
    inherited pnlFooter: TPanel
      inherited btnClose: TcxButton
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      inherited lbCTRLEnter: TLabel
        Height = 15
      end
      inherited lbEscape: TLabel
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Height = 15
      end
    end
  end
  object cxTextEdit5: TcxTextEdit [2]
    Left = 106
    Top = 154
    TabOrder = 2
    Width = 128
  end
  inherited actlstMasterDialog: TActionList
    object actGenerateVouchers: TAction
      Caption = 'Generate Vouchers'
      ImageIndex = 14
    end
  end
  object ActionManager1: TActionManager
    Left = 498
    Top = 122
    StyleName = 'Platform Default'
  end
end
