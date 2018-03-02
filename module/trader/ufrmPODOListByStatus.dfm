inherited frmPODOListByStatus: TfrmPODOListByStatus
  Caption = 'PO & DO Trader By Status'
  ClientHeight = 332
  ClientWidth = 518
  ExplicitWidth = 534
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 518
    Height = 276
    ExplicitWidth = 120
    ExplicitHeight = 260
    object lblPeriode: TLabel
      Left = 13
      Top = 14
      Width = 37
      Height = 16
      Caption = 'Periode'
    end
    object lblSD: TLabel
      Left = 190
      Top = 14
      Width = 19
      Height = 16
      Caption = 's.d.'
    end
    object lblStatus: TLabel
      Left = 18
      Top = 70
      Width = 32
      Height = 16
      Caption = 'Status'
    end
    object lblNoBukti: TLabel
      Left = 8
      Top = 43
      Width = 42
      Height = 16
      Caption = 'No Bukti'
    end
    object lblSDNoBukti: TLabel
      Left = 190
      Top = 43
      Width = 19
      Height = 16
      Caption = 's.d.'
    end
    object dtpAwal: TDateTimePicker
      Left = 65
      Top = 10
      Width = 121
      Height = 24
      Date = 43159.675070104170000000
      Time = 43159.675070104170000000
      TabOrder = 0
    end
    object dtpAkhir: TDateTimePicker
      Left = 213
      Top = 10
      Width = 121
      Height = 24
      Date = 43159.675070104170000000
      Time = 43159.675070104170000000
      TabOrder = 1
    end
    object edtNoBuktiAwal: TEdit
      Left = 65
      Top = 40
      Width = 121
      Height = 22
      TabOrder = 2
      OnExit = edtNoBuktiAwalExit
    end
    object edtNoBuktiAkhir: TEdit
      Left = 213
      Top = 40
      Width = 121
      Height = 22
      TabOrder = 3
      OnExit = edtNoBuktiAkhirExit
    end
    object cbbStatus: TComboBox
      Left = 65
      Top = 68
      Width = 269
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'SEMUA'
      Items.Strings = (
        'SEMUA'
        'CREATED'
        'DELIVERED'
        'CANCELED')
    end
  end
  inherited pnlHeader: TPanel
    Width = 518
    ExplicitWidth = 120
  end
  inherited pnlFooter: TPanel
    Top = 297
    Width = 518
    ExplicitTop = -35
    ExplicitWidth = 120
    inherited btnClose: TcxButton
      Left = 441
      ExplicitLeft = 43
    end
  end
  inherited pnlShortCut: TPanel
    Top = 276
    Width = 518
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited lbEscape: TLabel
      Left = 444
      Height = 17
    end
  end
  inherited actReport: TActionList
    Left = 448
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
