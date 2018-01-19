inherited frmDialogTransferBarang: TfrmDialogTransferBarang
  Caption = 'Transfer Barang'
  ClientHeight = 453
  ClientWidth = 715
  ExplicitWidth = 731
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 715
    Height = 397
    object pnlHeader: TPanel
      Left = 2
      Top = 2
      Width = 711
      Height = 127
      Align = alTop
      TabOrder = 0
      object lblNO: TLabel
        Left = 54
        Top = 8
        Width = 32
        Height = 16
        Caption = 'Nomor'
      end
      object lblTanggal: TLabel
        Left = 49
        Top = 38
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lblGudang: TLabel
        Left = 28
        Top = 68
        Width = 58
        Height = 16
        Caption = 'Gudang Asal'
      end
      object lblGudangTujuan: TLabel
        Left = 13
        Top = 98
        Width = 73
        Height = 16
        Caption = 'Gudang Tujuan'
      end
      object lblKeteranan: TLabel
        Left = 316
        Top = 8
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object edNO: TcxTextEdit
        Tag = 1
        Left = 90
        Top = 4
        TabOrder = 0
        Width = 106
      end
      object dtTanggal: TcxDateEdit
        Left = 90
        Top = 34
        TabOrder = 1
        Width = 106
      end
      object cbbGudang: TcxExtLookupComboBox
        Left = 90
        Top = 64
        TabOrder = 2
        Width = 183
      end
      object cbbGudangTujuan: TcxExtLookupComboBox
        Left = 90
        Top = 94
        TabOrder = 3
        Width = 183
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 380
        Top = 4
        Properties.ScrollBars = ssVertical
        TabOrder = 4
        Height = 114
        Width = 317
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 397
    Width = 715
    inherited pnlFooter: TPanel
      Width = 715
      inherited btnClose: TcxButton
        Left = 638
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 545
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 468
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 715
      inherited lbCTRLEnter: TLabel
        Left = 540
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 631
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 464
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 680
    Top = 184
  end
end
