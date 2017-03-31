inherited frmDialogDetilPayment: TfrmDialogDetilPayment
  Left = 210
  Top = 131
  Caption = 'Detail Payment'
  ClientHeight = 446
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 570
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 390
    BorderWidth = 10
    ExplicitHeight = 390
    object pnl1: TPanel
      Left = 12
      Top = 12
      Width = 530
      Height = 205
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 80
        Top = 8
        Width = 72
        Height = 22
        Caption = 'Penjualan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 344
        Top = 8
        Width = 91
        Height = 22
        Caption = 'Pembayaran'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 16
        Top = 32
        Width = 48
        Height = 16
        Caption = 'Total Nilai'
      end
      object lbl4: TLabel
        Left = 16
        Top = 56
        Width = 33
        Height = 16
        Caption = 'Diskon'
      end
      object lbl5: TLabel
        Left = 16
        Top = 104
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl6: TLabel
        Left = 16
        Top = 128
        Width = 74
        Height = 16
        Caption = 'Total Penjualan'
      end
      object lbl7: TLabel
        Left = 16
        Top = 152
        Width = 80
        Height = 16
        Caption = 'Nilai Pembulatan'
      end
      object lbl8: TLabel
        Left = 280
        Top = 32
        Width = 58
        Height = 16
        Caption = 'Bayar Tunai'
      end
      object lbl9: TLabel
        Left = 320
        Top = 56
        Width = 49
        Height = 16
        Caption = 'Kembalian'
      end
      object lbl10: TLabel
        Left = 320
        Top = 80
        Width = 55
        Height = 16
        Caption = 'Nilai Bersih'
      end
      object lbl11: TLabel
        Left = 280
        Top = 104
        Width = 28
        Height = 16
        Caption = 'Kartu'
      end
      object lbl12: TLabel
        Left = 280
        Top = 128
        Width = 48
        Height = 16
        Caption = 'No. Kartu'
      end
      object lbl13: TLabel
        Left = 280
        Top = 152
        Width = 46
        Height = 16
        Caption = 'Otorisasi'
      end
      object edtTotalNilai: TEdit
        Left = 104
        Top = 32
        Width = 169
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtDiskon: TEdit
        Left = 104
        Top = 56
        Width = 169
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtPPn: TEdit
        Left = 104
        Top = 104
        Width = 169
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtTotPenjualan: TEdit
        Left = 104
        Top = 128
        Width = 169
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtPembulatan: TEdit
        Left = 104
        Top = 152
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtBayarTunai: TEdit
        Left = 384
        Top = 32
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtKembalian: TEdit
        Left = 384
        Top = 56
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtNilaiBersih: TEdit
        Left = 384
        Top = 80
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtKartu: TEdit
        Left = 344
        Top = 104
        Width = 185
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtNoKartu: TEdit
        Left = 344
        Top = 128
        Width = 185
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
      end
      object edtOtorisasi: TEdit
        Left = 344
        Top = 152
        Width = 185
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
      end
      object edtAmount: TEdit
        Left = 384
        Top = 176
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
    end
    object pnl2: TPanel
      Left = 12
      Top = 217
      Width = 530
      Height = 161
      Align = alClient
      Color = 15198183
      TabOrder = 1
      object lbl14: TLabel
        Left = 16
        Top = 8
        Width = 57
        Height = 16
        Caption = 'Total TUNAI'
      end
      object lbl15: TLabel
        Left = 16
        Top = 32
        Width = 57
        Height = 16
        Caption = 'Debet Card'
      end
      object lbl16: TLabel
        Left = 16
        Top = 56
        Width = 59
        Height = 16
        Caption = 'Credit Card'
      end
      object lbl19: TLabel
        Left = 16
        Top = 104
        Width = 54
        Height = 16
        Caption = 'Nilai Kupon'
      end
      object lbl20: TLabel
        Left = 16
        Top = 128
        Width = 62
        Height = 16
        Caption = 'Bayar Kupon'
      end
      object lbl21: TLabel
        Left = 280
        Top = 8
        Width = 30
        Height = 16
        Caption = 'Kupon'
      end
      object lbl23: TLabel
        Left = 320
        Top = 8
        Width = 25
        Height = 16
        Caption = 'Botol'
      end
      object lbl25: TLabel
        Left = 280
        Top = 104
        Width = 55
        Height = 16
        Caption = 'NIlai Kupon'
      end
      object lbl26: TLabel
        Left = 280
        Top = 128
        Width = 102
        Height = 16
        Caption = 'Bayar Dengan Kupon'
      end
      object edtTotalTunai: TEdit
        Left = 104
        Top = 8
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtDebetCard: TEdit
        Left = 104
        Top = 32
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtCreditCard: TEdit
        Left = 104
        Top = 56
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtNilaiKupon: TEdit
        Left = 104
        Top = 104
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtBayarKupon: TEdit
        Left = 104
        Top = 128
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtKuponBotol: TEdit
        Left = 384
        Top = 8
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtNilaiKpn: TEdit
        Left = 384
        Top = 104
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtByrDgnKpn: TEdit
        Left = 384
        Top = 128
        Width = 145
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 390
    ExplicitTop = 390
    inherited pnlFooter: TPanel
      inherited btnClose: TcxButton
        Action = actCancel
        Caption = 'Close'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF001950
          001950001950001950001950001950001950001950001950001950001950FF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FF007373009696
          66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF66CCFF0019
          50FF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FF007373009696
          99FFFF9DDBFF99FFFF9DDBFF99FFFF9DDBFF9DDBFF9DDBFF9DDBFF66CCFF0019
          50FF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF007373FFFFFF
          00969699FFFF99FFFFFFFFFF99FFFF9DDBFF99FFFF9DDBFF9DDBFF9DDBFF66CC
          FF001950FF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF007373FFFFFF
          00969699FFFFFFFFFF99FFFFFFFFFF99FFFF9DDBFF99FFFF99FFFF9DDBFF9DDB
          FF001950FF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF007373FFFFFF
          99FFFF0096969DDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9DDBFF99FFFF9DDB
          FF66CCFF001950FF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF007373FFFFFF
          99FFFF0096960050500050500050500050500050500050500050500050500050
          50005050001950FF00FF7F7F7FFFFFFFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF007373FFFFFF
          99FFFF99FFFF99FFFF99FFFF9DDBFF99FFFF9DDBFF9DDBFF66CCFF007373FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF007373FFFFFF
          99FFFF99FFFF99FFFFFFFFFF007373007373007373007373007373001950FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFFFFFF7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF007373FFFFFF
          FFFFFFFFFFFFFFFFFF007373FF00FFFF00FFFF00FFFF00FF0000990000FF0019
          50FF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF00FFFF
          00FFFF00FFFFFFFF7F7F7FFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF007373
          007373007373007373FF00FFFF00FFFF00FFFF00FF0000994848FF4848FF0000
          FF001950FF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF
          00FFFFFFFF7F7F7FFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000996B8FFF4873FF4848FF4848
          FF0000FF001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000990000996B8FFF4873FF4848
          FF001950001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000996B8FFF4848FF4873
          FF001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000996B8FFF6B8FFF6B8F
          FF001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000990000990000990000
          99001950FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FF}
      end
      inherited btnSave: TcxButton
        Action = actSave
        Visible = False
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 307
        ExplicitLeft = 307
      end
    end
    inherited pnlSortCut: TPanel
      inherited lbCTRLEnter: TLabel
        Left = 386
        Height = 15
        Visible = False
        ExplicitLeft = 386
      end
      inherited lbEscape: TLabel
        Left = 477
        Width = 72
        Height = 15
        Caption = 'Escape [Close]'
        ExplicitLeft = 477
        ExplicitWidth = 72
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 310
        ExplicitLeft = 310
      end
    end
  end
end
