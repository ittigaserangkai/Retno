inherited frmDialogInputSupplierForNotSO: TfrmDialogInputSupplierForNotSO
  Left = 294
  Top = 175
  Caption = 'frmDialogInputSupplierForNotSO'
  ClientHeight = 156
  ClientWidth = 435
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 451
  ExplicitHeight = 195
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 435
    Height = 100
    ExplicitWidth = 435
    ExplicitHeight = 100
    object lbl1: TLabel
      Left = 40
      Top = 16
      Width = 67
      Height = 16
      Caption = 'Supplier Code'
    end
    object lbl2: TLabel
      Left = 36
      Top = 43
      Width = 69
      Height = 16
      Caption = 'Supplier Name'
    end
    object cbpCode: TcxExtLookupComboBox
      Left = 324
      Top = 13
      TabOrder = 2
      Visible = False
      OnKeyDown = cbpCodeKeyDown
      OnKeyUp = cbpCodeKeyUp
      Width = 69
    end
    object edtName: TEdit
      Left = 117
      Top = 45
      Width = 289
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      Text = 'PT. BAHAGIA SUMBER ABADI (SOLO)'
    end
    object edtKode: TcxButtonEdit
      Left = 117
      Top = 16
      Properties.Buttons = <
        item
        end>
      TabOrder = 0
      Text = '0'
      OnExit = edtKodeExit
      OnKeyPress = edtKodeKeyPress
      OnKeyUp = edtKodeKeyUp
      Width = 92
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 100
    Width = 435
    ExplicitTop = 100
    ExplicitWidth = 435
    inherited pnlFooter: TPanel
      Width = 435
      ExplicitWidth = 435
      inherited btnClose: TcxButton
        Left = 358
        Action = actCancel
        ExplicitLeft = 358
      end
      inherited btnSave: TcxButton
        Left = 265
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 265
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 435
      ExplicitWidth = 435
      inherited lbCTRLEnter: TLabel
        Left = 260
        Height = 15
        ExplicitLeft = 260
      end
      inherited lbEscape: TLabel
        Left = 351
        Height = 15
        ExplicitLeft = 351
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
