inherited frmHariLibur: TfrmHariLibur
  Left = 293
  Top = 220
  Caption = 'Day Off'
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 247
    ExplicitHeight = 238
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
    ExplicitTop = 268
    ExplicitWidth = 540
    inherited pnlFooter: TPanel
      Width = 540
      ExplicitWidth = 540
      inherited btnClose: TcxButton
        Left = 460
        ExplicitLeft = 460
      end
      inherited btnAdd: TcxButton
        Action = actAddHariLibur
        Caption = 'Add'
      end
      inherited btnUpdate: TcxButton
        Action = actEditHariLibur
        Caption = 'Edit'
      end
      inherited btnDelete: TcxButton
        Action = actDeleteHariLibur
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshHariLibur
      end
    end
    inherited pnlSortCut: TPanel
      Width = 540
      ExplicitWidth = 540
      inherited lbl5: TLabel
        Left = 452
        ExplicitLeft = 452
      end
    end
  end
  object actlstHariLibur: TActionList
    Left = 464
    Top = 8
    object actAddHariLibur: TAction
      Caption = 'actAddHariLibur'
      OnExecute = actAddHariLiburExecute
    end
    object actEditHariLibur: TAction
      Caption = 'actEditHariLibur'
      OnExecute = actEditHariLiburExecute
    end
    object actDeleteHariLibur: TAction
      Caption = 'actDeleteHariLibur'
      OnExecute = actDeleteHariLiburExecute
    end
    object actRefreshHariLibur: TAction
      Caption = 'actRefreshHariLibur'
      OnExecute = actRefreshHariLiburExecute
    end
  end
end
