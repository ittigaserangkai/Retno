inherited frmDialogDataCostumer: TfrmDialogDataCostumer
  Left = 330
  Top = 231
  Caption = 'frmDialogDataCostumer'
  ClientHeight = 269
  ClientWidth = 373
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 389
  ExplicitHeight = 308
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 373
    Height = 213
    ExplicitWidth = 373
    ExplicitHeight = 213
    object lbl1: TLabel
      Left = 23
      Top = 56
      Width = 78
      Height = 16
      Caption = 'Customer Name'
    end
    object lbl2: TLabel
      Left = 23
      Top = 93
      Width = 77
      Height = 16
      Caption = 'Contact Person'
    end
    object lbl3: TLabel
      Left = 23
      Top = 170
      Width = 39
      Height = 16
      Caption = 'Address'
    end
    object lbl4: TLabel
      Left = 23
      Top = 131
      Width = 70
      Height = 16
      Caption = 'Phone Number'
    end
    object Label1: TLabel
      Left = 23
      Top = 20
      Width = 76
      Height = 16
      Caption = 'Customer Code'
    end
    object edtName: TEdit
      Left = 115
      Top = 54
      Width = 175
      Height = 22
      MaxLength = 128
      TabOrder = 1
      Text = 'edtName'
      OnKeyPress = edtCodeKeyPress
    end
    object edtContact: TEdit
      Left = 115
      Top = 91
      Width = 140
      Height = 22
      MaxLength = 16
      TabOrder = 2
      Text = 'edtContact'
      OnKeyPress = edtCodeKeyPress
    end
    object edtAddress: TEdit
      Left = 115
      Top = 168
      Width = 232
      Height = 22
      MaxLength = 128
      TabOrder = 4
      Text = 'edtAddress'
      OnKeyPress = edtCodeKeyPress
    end
    object edtPhone: TEdit
      Left = 115
      Top = 129
      Width = 140
      Height = 22
      MaxLength = 16
      TabOrder = 3
      Text = 'edtPhone'
      OnKeyPress = edtCodeKeyPress
    end
    object edtCode: TEdit
      Left = 115
      Top = 18
      Width = 72
      Height = 22
      MaxLength = 2
      TabOrder = 0
      Text = 'edtCode'
      OnKeyPress = edtCodeKeyPress
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 213
    Width = 373
    ExplicitTop = 213
    ExplicitWidth = 373
    inherited pnlFooter: TPanel
      Width = 373
      ExplicitWidth = 373
      inherited btnClose: TcxButton
        Left = 296
        Action = actCancel
        ExplicitLeft = 296
      end
      inherited btnSave: TcxButton
        Left = 203
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 203
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 126
        ExplicitLeft = 126
      end
    end
    inherited pnlSortCut: TPanel
      Width = 373
      ExplicitWidth = 373
      inherited lbCTRLEnter: TLabel
        Left = 198
        Height = 15
        ExplicitLeft = 198
      end
      inherited lbEscape: TLabel
        Left = 289
        Height = 15
        ExplicitLeft = 289
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 122
        ExplicitLeft = 122
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
