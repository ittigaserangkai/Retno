inherited frmSummaryARBalance: TfrmSummaryARBalance
  Caption = 'Summary AR Balance'
  ClientHeight = 364
  ClientWidth = 602
  ExplicitWidth = 618
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 602
    Height = 308
    ExplicitWidth = 602
    ExplicitHeight = 308
    object dtPeriodeAwal: TcxDateEdit
      Left = 77
      Top = 28
      TabOrder = 0
      Width = 121
    end
    object dtPeriodeAkhir: TcxDateEdit
      Left = 229
      Top = 28
      TabOrder = 1
      Width = 121
    end
    object lblSD: TcxLabel
      Left = 202
      Top = 30
      Caption = 's.d.'
    end
    object lblPeriode: TcxLabel
      Left = 32
      Top = 30
      Caption = 'Periode'
    end
  end
  inherited pnlHeader: TPanel
    Width = 602
    ExplicitWidth = 602
  end
  inherited pnlFooter: TPanel
    Top = 329
    Width = 602
    ExplicitTop = 329
    ExplicitWidth = 602
    inherited btnClose: TcxButton
      Left = 525
      ExplicitLeft = 525
    end
  end
  inherited pnlShortCut: TPanel
    Top = 308
    Width = 602
    ExplicitTop = 308
    ExplicitWidth = 602
    inherited lbEscape: TLabel
      Left = 528
      Height = 17
      ExplicitLeft = 528
    end
  end
  object cxrdgrpJenisLaporan: TcxRadioGroup [4]
    Left = 77
    Top = 58
    Caption = 'Jenis Laporan'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Detail'
        Value = 0
      end
      item
        Caption = 'Summary'
        Value = 1
      end>
    ItemIndex = 0
    TabOrder = 4
    Height = 46
    Width = 273
  end
  inherited actReport: TActionList
    Left = 568
    Top = 264
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
