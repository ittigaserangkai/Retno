inherited frmDialogBeginBalancePOS: TfrmDialogBeginBalancePOS
  Left = 295
  Top = 232
  Caption = 'frmDialogBeginBalancePOS'
  ClientHeight = 194
  ClientWidth = 506
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 522
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 506
    Height = 138
    ExplicitWidth = 506
    ExplicitHeight = 138
    object lbl1: TLabel
      Left = 15
      Top = 18
      Width = 47
      Height = 16
      Caption = 'POS Code'
    end
    object lbl2: TLabel
      Left = 15
      Top = 42
      Width = 52
      Height = 16
      Caption = 'Cashier ID'
    end
    object lbl3: TLabel
      Left = 15
      Top = 68
      Width = 89
      Height = 16
      Caption = 'Beginning Balance'
    end
    object lbl4: TLabel
      Left = 15
      Top = 92
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object cbpCashierID: TcxExtLookupComboBox
      Left = 107
      Top = 40
      TabOrder = 1
      Width = 201
    end
    object curredtBeginBalance: TcxCurrencyEdit
      Left = 107
      Top = 66
      TabOrder = 3
      OnEnter = curredtBeginBalanceEnter
      Width = 121
    end
    object edtDescrp: TEdit
      Left = 107
      Top = 91
      Width = 385
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object cbpPosCode: TcxExtLookupComboBox
      Left = 107
      Top = 14
      TabOrder = 0
      Width = 102
    end
    object edtCashierName: TEdit
      Left = 311
      Top = 41
      Width = 181
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      Visible = False
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 138
    Width = 506
    ExplicitTop = 138
    ExplicitWidth = 506
    inherited pnlFooter: TPanel
      Width = 506
      ExplicitWidth = 506
      inherited btnClose: TcxButton
        Left = 429
        Action = actCancel
        ExplicitLeft = 429
      end
      inherited btnSave: TcxButton
        Left = 336
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 336
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 259
        ExplicitLeft = 259
      end
    end
    inherited pnlSortCut: TPanel
      Width = 506
      ExplicitWidth = 506
      inherited lbCTRLEnter: TLabel
        Left = 331
        Height = 15
        ExplicitLeft = 331
      end
      inherited lbEscape: TLabel
        Left = 422
        Height = 15
        ExplicitLeft = 422
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 255
        ExplicitLeft = 255
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
