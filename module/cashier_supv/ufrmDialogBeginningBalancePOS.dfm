inherited frmDialogBeginBalancePOS: TfrmDialogBeginBalancePOS
  Left = 295
  Top = 232
  Caption = 'Beginning Balance POS'
  ClientHeight = 194
  ClientWidth = 506
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnDestroy = FormDestroy
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
      Top = 17
      Width = 47
      Height = 16
      Caption = 'POS Code'
    end
    object lbl2: TLabel
      Left = 15
      Top = 43
      Width = 52
      Height = 16
      Caption = 'Cashier ID'
    end
    object lbl3: TLabel
      Left = 15
      Top = 69
      Width = 89
      Height = 16
      Caption = 'Beginning Balance'
    end
    object lbl4: TLabel
      Left = 15
      Top = 95
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object cbpCashierID: TcxExtLookupComboBox
      Left = 107
      Top = 40
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cbpCashierIDPropertiesEditValueChanged
      TabOrder = 1
      Width = 201
    end
    object curredtBeginBalance: TcxCurrencyEdit
      Left = 107
      Top = 66
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 3
      OnEnter = curredtBeginBalanceEnter
      Width = 121
    end
    object cbpPosCode: TcxExtLookupComboBox
      Left = 107
      Top = 14
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      TabOrder = 0
      Width = 102
    end
    object edtCashierName: TcxTextEdit
      Left = 310
      Top = 40
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 182
    end
    object edtDescrp: TcxTextEdit
      Left = 107
      Top = 92
      TabOrder = 4
      Width = 385
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
        ExplicitLeft = 336
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 259
        Action = actPrint
        ExplicitLeft = 259
      end
    end
    inherited pnlSortCut: TPanel
      Width = 506
      ExplicitWidth = 506
      inherited lbCTRLEnter: TLabel
        Left = 331
        ExplicitLeft = 331
      end
      inherited lbEscape: TLabel
        Left = 422
        ExplicitLeft = 422
      end
      inherited lblCTRLP: TLabel
        Left = 255
        ExplicitLeft = 255
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 440
    Top = 8
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
