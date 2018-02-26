inherited frmDialogHistoryBarang: TfrmDialogHistoryBarang
  Caption = 'Dialog History Barang'
  ExplicitWidth = 570
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    ExplicitTop = -1
    object lblKode: TLabel
      Left = 100
      Top = 17
      Width = 24
      Height = 16
      Caption = 'Kode'
    end
    object lblNama: TLabel
      Left = 97
      Top = 45
      Width = 27
      Height = 16
      Caption = 'Nama'
    end
    object lblMerkNamaBarang: TLabel
      Left = 20
      Top = 73
      Width = 104
      Height = 16
      Caption = 'Merk && Nama Barang'
    end
    object lblKodeNamaSupplier: TLabel
      Left = 17
      Top = 101
      Width = 107
      Height = 16
      Caption = 'Kode && Nama Supplier'
    end
    object lblKodeExternal: TLabel
      Left = 55
      Top = 129
      Width = 69
      Height = 16
      Caption = 'Kode External'
    end
    object edKode: TcxTextEdit
      Left = 144
      Top = 13
      TabOrder = 0
      Text = 'edKode'
      Width = 121
    end
    object edNama: TcxTextEdit
      Left = 144
      Top = 41
      TabOrder = 1
      Text = 'edNama'
      Width = 347
    end
    object edNamaBarang: TcxTextEdit
      Left = 144
      Top = 69
      TabOrder = 2
      Text = 'edNamaBarang'
      Width = 347
    end
    object edKodeNamaSupplier: TcxTextEdit
      Left = 144
      Top = 97
      TabOrder = 3
      Text = 'edKodeNamaSupplier'
      Width = 347
    end
    object edExternalCode: TcxTextEdit
      Left = 144
      Top = 125
      TabOrder = 4
      Text = 'edExternalCode'
      Width = 121
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
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
end
