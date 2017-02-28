inherited frmDialogBank: TfrmDialogBank
  Left = 289
  Top = 243
  Caption = 'frmDialogBank'
  ClientHeight = 239
  ClientWidth = 403
  OldCreateOrder = True
  ExplicitWidth = 419
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 403
    Height = 183
    ExplicitTop = 0
    ExplicitWidth = 403
    ExplicitHeight = 183
    object lbl1: TLabel
      Left = 32
      Top = 41
      Width = 33
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Name'
    end
    object Lbl2: TLabel
      Left = 30
      Top = 69
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Branch'
    end
    object lbl3: TLabel
      Left = 27
      Top = 98
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Address'
    end
    object Label1: TLabel
      Left = 39
      Top = 13
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object edtName: TEdit
      Left = 76
      Top = 40
      Width = 174
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtBranch: TEdit
      Left = 76
      Top = 68
      Width = 174
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtAddress: TEdit
      Left = 76
      Top = 97
      Width = 277
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 256
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtCode: TEdit
      Left = 76
      Top = 12
      Width = 101
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 3
    end
    object gbRekening: TGroupBox
      Left = 141
      Top = 0
      Width = 262
      Height = 177
      Caption = 'Rekening'
      TabOrder = 4
      object lbl4: TLabel
        Left = 13
        Top = 29
        Width = 69
        Height = 16
        Caption = 'Account Code'
      end
      object lbl5: TLabel
        Left = 16
        Top = 57
        Width = 33
        Height = 16
        AutoSize = False
        Caption = 'Desc'
      end
      object edtRekKode: TEdit
        Left = 90
        Top = 28
        Width = 117
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtDescription: TEdit
        Left = 90
        Top = 56
        Width = 154
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 128
        ParentCtl3D = False
        TabOrder = 1
      end
    end
    object chkAllUnit: TCheckBox
      Left = 80
      Top = 128
      Width = 57
      Height = 17
      Caption = 'All Unit'
      TabOrder = 5
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 183
    Width = 403
    ExplicitTop = 183
    ExplicitWidth = 403
    inherited pnlFooter: TPanel
      Width = 403
      ExplicitWidth = 403
      inherited btnClose: TcxButton
        Left = 321
        ExplicitLeft = 321
      end
      inherited btnSave: TcxButton
        Left = 234
        ExplicitLeft = 234
      end
    end
    inherited pnlSortCut: TPanel
      Width = 403
      ExplicitWidth = 403
      inherited lbl4: TLabel
        Left = 218
        ExplicitLeft = 218
      end
      inherited lbl5: TLabel
        Left = 313
        ExplicitLeft = 313
      end
    end
  end
end
