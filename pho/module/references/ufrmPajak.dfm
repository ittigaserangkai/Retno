inherited frmPajak: TfrmPajak
  Left = 261
  Top = 178
  Caption = 'Tax'
  ClientHeight = 314
  ClientWidth = 532
  OldCreateOrder = True
  ExplicitWidth = 548
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 532
    Height = 228
    ExplicitWidth = 532
    ExplicitHeight = 228
  end
  inherited pnlHeader: TPanel
    Width = 532
    ExplicitWidth = 532
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 258
    Width = 532
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 258
    ExplicitWidth = 532
    inherited pnlFooter: TPanel
      Width = 532
      ExplicitWidth = 532
      inherited btnClose: TcxButton
        Left = 450
        ExplicitLeft = 450
      end
      inherited btnAdd: TcxButton
        Action = actAddPajak
      end
      inherited btnUpdate: TcxButton
        Action = actEditPajak
      end
      inherited btnDelete: TcxButton
        Action = actDeletePajak
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshPajak
      end
    end
    inherited pnlSortCut: TPanel
      Width = 532
      ExplicitWidth = 532
      inherited lbl5: TLabel
        Left = 442
        ExplicitLeft = 452
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstPajak: TActionList
    Left = 440
    Top = 8
    object actAddPajak: TAction
      Caption = 'Add'
      OnExecute = actAddPajakExecute
    end
    object actEditPajak: TAction
      Caption = 'Edit'
      OnExecute = actEditPajakExecute
    end
    object actDeletePajak: TAction
      Caption = 'Delete'
      OnExecute = actDeletePajakExecute
    end
    object actRefreshPajak: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshPajakExecute
    end
  end
end
