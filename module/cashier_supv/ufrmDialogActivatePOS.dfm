inherited frmDialogActivePOS: TfrmDialogActivePOS
  Left = 451
  Top = 259
  Caption = 'POS ACTIVATION'
  ClientHeight = 219
  ClientWidth = 364
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnDestroy = FormDestroy
  ExplicitWidth = 380
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 364
    Height = 163
    ExplicitWidth = 364
    ExplicitHeight = 163
    object lbl1: TLabel
      Left = 35
      Top = 40
      Width = 47
      Height = 16
      Caption = 'POS Code'
    end
    object lbl2: TLabel
      Left = 35
      Top = 63
      Width = 79
      Height = 16
      Caption = 'Transaction No.'
    end
    object lbl3: TLabel
      Left = 35
      Top = 86
      Width = 61
      Height = 16
      Caption = 'Counter No.'
    end
    object lbl4: TLabel
      Left = 35
      Top = 16
      Width = 24
      Height = 16
      Caption = 'Date'
    end
    object Label1: TLabel
      Left = 35
      Top = 110
      Width = 51
      Height = 16
      Caption = 'IP Address'
    end
    object edtTerminalCode: TEdit
      Left = 127
      Top = 38
      Width = 103
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 1
      OnChange = edtTerminalCodeChange
    end
    object edtTranscNo: TEdit
      Left = 127
      Top = 61
      Width = 103
      Height = 22
      Ctl3D = False
      MaxLength = 6
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = edtTranscNoKeyPress
    end
    object edtCountNo: TEdit
      Left = 127
      Top = 84
      Width = 42
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 3
      Text = '0'
      OnKeyPress = edtCountNoKeyPress
    end
    object dtSetupPOS: TcxDateEdit
      Left = 127
      Top = 13
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 103
    end
    object edmIPAddr: TcxMaskEdit
      Left = 127
      Top = 107
      Properties.Alignment.Horz = taLeftJustify
      Properties.EditMask = '!999.999.999.999;1;_'
      TabOrder = 4
      Text = '127.  0.  0.  1'
      Width = 103
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 163
    Width = 364
    ExplicitTop = 163
    ExplicitWidth = 364
    inherited pnlFooter: TPanel
      Width = 364
      ExplicitWidth = 364
      inherited btnClose: TcxButton
        Left = 287
        Action = actCancel
        ExplicitLeft = 287
      end
      inherited btnSave: TcxButton
        Left = 194
        Action = actSave
        ExplicitLeft = 194
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 117
        Action = actPrint
        ExplicitLeft = 117
      end
    end
    inherited pnlSortCut: TPanel
      Width = 364
      ExplicitWidth = 364
      inherited lbCTRLEnter: TLabel
        Left = 189
        Height = 15
        ExplicitLeft = 189
      end
      inherited lbEscape: TLabel
        Left = 280
        Height = 15
        ExplicitLeft = 280
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 113
        Height = 15
        ExplicitLeft = 113
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
