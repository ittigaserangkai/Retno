inherited frmAPCard: TfrmAPCard
  Caption = 'AP Card'
  ClientHeight = 197
  ClientWidth = 684
  ExplicitWidth = 700
  ExplicitHeight = 236
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 684
    Height = 141
    ExplicitWidth = 684
    ExplicitHeight = 141
    object lblFilterData: TcxLabel
      Left = 15
      Top = 6
      AutoSize = False
      Caption = 'Periode'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 24
      Width = 58
      AnchorY = 18
    end
    object dtAwalFilter: TcxDateEdit
      Left = 94
      Top = 7
      Margins.Top = 4
      Margins.Bottom = 4
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 89
    end
    object lblsdFilter: TcxLabel
      Left = 187
      Top = 6
      Margins.Left = 0
      Margins.Right = 0
      AutoSize = False
      Caption = 's/d'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 24
      Width = 21
      AnchorY = 18
    end
    object dtAkhirFilter: TcxDateEdit
      Left = 212
      Top = 7
      Margins.Top = 4
      Margins.Bottom = 4
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 89
    end
    object lblOrganisasi: TcxLabel
      Left = 7
      Top = 38
      Caption = 'Organisasi'
      Transparent = True
    end
    object cbbOrganisasi: TcxExtLookupComboBox
      Left = 94
      Top = 36
      TabOrder = 5
      Width = 207
    end
  end
  inherited pnlHeader: TPanel
    Width = 684
    ExplicitWidth = 684
    inherited lblHeader: TLabel
      Width = 44
      Caption = 'AP Card'
      ExplicitWidth = 44
    end
  end
  inherited pnlFooter: TPanel
    Top = 162
    Width = 684
    ExplicitTop = 162
    ExplicitWidth = 684
    inherited btnClose: TcxButton
      Left = 607
      ExplicitLeft = 607
    end
  end
  inherited pnlShortCut: TPanel
    Top = 141
    Width = 684
    ExplicitTop = 141
    ExplicitWidth = 684
    inherited lbEscape: TLabel
      Left = 610
      Height = 17
      ExplicitLeft = 610
    end
  end
  inherited actReport: TActionList
    Left = 560
    Top = 40
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
