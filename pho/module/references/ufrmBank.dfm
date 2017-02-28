inherited frmBank: TfrmBank
  Left = 284
  Top = 210
  Caption = 'Bank'
  ClientHeight = 343
  ClientWidth = 539
  OldCreateOrder = True
  ExplicitWidth = 555
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 539
    Height = 257
    ExplicitWidth = 539
    ExplicitHeight = 257
    object pnlBodyUp: TPanel
      Left = 11
      Top = 11
      Width = 517
      Height = 38
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 41
        Height = 16
        Caption = 'Search :'
      end
      object edtPencarian: TEdit
        Left = 52
        Top = 8
        Width = 201
        Height = 24
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 0
        OnChange = edtPencarianChange
        OnKeyPress = edtPencarianKeyPress
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 539
    ExplicitWidth = 539
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 287
    Width = 539
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 287
    ExplicitWidth = 539
    inherited pnlFooter: TPanel
      Width = 539
      ExplicitWidth = 539
      inherited btnClose: TcxButton
        Left = 457
        ExplicitLeft = 457
      end
      inherited btnAdd: TcxButton
        Action = actAddBank
      end
      inherited btnUpdate: TcxButton
        Action = actEditBank
      end
      inherited btnDelete: TcxButton
        Action = actDeleteBank
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshBank
      end
    end
    inherited pnlSortCut: TPanel
      Width = 539
      ExplicitWidth = 539
      inherited lbl5: TLabel
        Left = 449
        ExplicitLeft = 452
      end
    end
  end
  object actlstBank: TActionList
    Left = 440
    Top = 8
    object actAddBank: TAction
      Caption = 'Add'
      OnExecute = actAddBankExecute
    end
    object actEditBank: TAction
      Caption = 'Edit'
      OnExecute = actEditBankExecute
    end
    object actDeleteBank: TAction
      Caption = 'Delete'
      OnExecute = actDeleteBankExecute
    end
    object actRefreshBank: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshBankExecute
    end
  end
end
