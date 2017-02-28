inherited frmLokasi: TfrmLokasi
  Left = 336
  Top = 287
  Caption = 'Location'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 247
    ExplicitHeight = 247
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 277
    Width = 534
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 277
    ExplicitWidth = 542
    inherited pnlFooter: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited btnClose: TcxButton
        Left = 460
        ExplicitLeft = 460
      end
      inherited btnAdd: TcxButton
        Action = actAddLokasi
      end
      inherited btnUpdate: TcxButton
        Left = 91
        Action = actEditLokasi
        ExplicitLeft = 91
      end
      inherited btnDelete: TcxButton
        Action = actDeleteLokasi
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshLokasi
      end
    end
    inherited pnlSortCut: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited lbl5: TLabel
        Left = 452
        ExplicitLeft = 452
      end
    end
  end
  object actlstLokasi: TActionList
    Left = 440
    Top = 16
    object actAddLokasi: TAction
      Caption = 'Add'
      OnExecute = actAddLokasiExecute
    end
    object actEditLokasi: TAction
      Caption = 'Edit'
      OnExecute = actEditLokasiExecute
    end
    object actDeleteLokasi: TAction
      Caption = 'Delete'
      OnExecute = actDeleteLokasiExecute
    end
    object actRefreshLokasi: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshLokasiExecute
    end
  end
end
