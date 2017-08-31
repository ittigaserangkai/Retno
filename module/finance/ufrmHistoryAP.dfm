inherited frmHistoryAP: TfrmHistoryAP
  Caption = 'History Report'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    ExplicitHeight = 260
    object lblNoAP: TLabel
      Left = 41
      Top = 17
      Width = 27
      Height = 16
      Caption = 'No AP'
      Transparent = True
    end
    object edNoAP: TcxButtonEdit
      Left = 72
      Top = 13
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edNoAPPropertiesButtonClick
      TabOrder = 0
      Width = 273
    end
    object lblTgl: TcxLabel
      Left = 27
      Top = 69
      Caption = 'Tanggal'
      Transparent = True
    end
    object lblKodeOrg: TcxLabel
      Left = 11
      Top = 42
      Caption = 'Organisasi'
      Transparent = True
    end
    object edKodeOrg: TcxTextEdit
      Left = 72
      Top = 40
      Enabled = False
      TabOrder = 3
      Width = 121
    end
    object edNamaOrg: TcxTextEdit
      Left = 200
      Top = 40
      Enabled = False
      TabOrder = 4
      Width = 145
    end
    object dtTglAP: TcxDateEdit
      Left = 72
      Top = 67
      Enabled = False
      TabOrder = 5
      Width = 121
    end
    object edTotal: TcxCurrencyEdit
      Left = 72
      Top = 94
      Enabled = False
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 6
      Width = 121
    end
    object lblTotal: TcxLabel
      Left = 40
      Top = 96
      Caption = 'Total'
      Transparent = True
    end
  end
  inherited actReport: TActionList
    Left = 448
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
