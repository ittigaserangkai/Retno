inherited frmDialogActivePOS: TfrmDialogActivePOS
  Left = 451
  Top = 259
  Caption = 'frmDialogActivatePOS'
  ClientHeight = 219
  ClientWidth = 360
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 376
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 360
    Height = 163
    ExplicitWidth = 360
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
      Top = 65
      Width = 79
      Height = 16
      Caption = 'Transaction No.'
    end
    object lbl3: TLabel
      Left = 35
      Top = 89
      Width = 61
      Height = 16
      Caption = 'Counter No.'
    end
    object lbl4: TLabel
      Left = 35
      Top = 17
      Width = 24
      Height = 16
      Caption = 'Date'
    end
    object Label1: TLabel
      Left = 35
      Top = 115
      Width = 55
      Height = 16
      Caption = 'IP Address.'
    end
    object edtTerminalCode: TEdit
      Left = 127
      Top = 37
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
      Width = 155
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
      Top = 85
      Width = 59
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 3
      Text = '0'
      OnKeyPress = edtCountNoKeyPress
    end
    object dt1: TcxDateEdit
      Left = 127
      Top = 13
      TabOrder = 0
      Width = 103
    end
    object edmIPAddr: TcxMaskEdit
      Left = 128
      Top = 110
      Properties.Alignment.Horz = taCenter
      Properties.EditMask = '!999.999.999.999;1;_'
      TabOrder = 4
      Text = '127.  0.  0.  1'
      Width = 145
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 163
    Width = 360
    ExplicitTop = 163
    ExplicitWidth = 360
    inherited pnlFooter: TPanel
      Width = 360
      ExplicitWidth = 360
      inherited btnClose: TcxButton
        Left = 283
        Action = actCancel
        ExplicitLeft = 283
      end
      inherited btnSave: TcxButton
        Left = 114
        Action = actSave
        ExplicitLeft = 114
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 206
        ExplicitLeft = 206
      end
    end
    inherited pnlSortCut: TPanel
      Width = 360
      ExplicitWidth = 360
      inherited lbCTRLEnter: TLabel
        Left = 2
        Height = 15
        ExplicitLeft = 2
      end
      inherited lbEscape: TLabel
        Left = 276
        Height = 15
        ExplicitLeft = 276
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 200
        ExplicitLeft = 200
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
