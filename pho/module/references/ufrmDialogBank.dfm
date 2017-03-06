inherited frmDialogBank: TfrmDialogBank
  Left = 289
  Top = 243
  Caption = 'Update Data Bank'
  ClientHeight = 333
  ClientWidth = 505
  OldCreateOrder = True
  ExplicitWidth = 521
  ExplicitHeight = 372
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 505
    Height = 277
    ExplicitWidth = 505
    ExplicitHeight = 277
    object lbl1: TLabel
      Left = 48
      Top = 41
      Width = 33
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Name'
    end
    object Lbl2: TLabel
      Left = 46
      Top = 69
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Branch'
    end
    object lbl3: TLabel
      Left = 43
      Top = 98
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Address'
    end
    object Label1: TLabel
      Left = 55
      Top = 13
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object edtName: TEdit
      Left = 92
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
      Left = 92
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
      Left = 92
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
      Left = 92
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
      Left = 2
      Top = 152
      Width = 501
      Height = 123
      Align = alBottom
      Caption = 'Rekening'
      TabOrder = 4
      object lbl4: TLabel
        Left = 33
        Top = 29
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'Rekening'
      end
      object lbl5: TLabel
        Left = 47
        Top = 57
        Width = 32
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Desc'
        Visible = False
      end
      object edtRekKode: TEdit
        Left = 74
        Top = 84
        Width = 117
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Visible = False
      end
      object edtDescription: TEdit
        Left = 90
        Top = 56
        Width = 303
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 128
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
      end
      object cxLookupAccount: TcxExtLookupComboBox
        Left = 90
        Top = 26
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 302
      end
    end
    object chkAllUnit: TCheckBox
      Left = 96
      Top = 128
      Width = 57
      Height = 17
      Caption = 'All Unit'
      TabOrder = 5
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 277
    Width = 505
    ExplicitTop = 277
    ExplicitWidth = 505
    inherited pnlFooter: TPanel
      Width = 505
      ExplicitWidth = 505
      inherited btnClose: TcxButton
        Left = 423
        ExplicitLeft = 423
      end
      inherited btnSave: TcxButton
        Left = 336
        OnClick = btnSaveClick
        ExplicitLeft = 336
      end
    end
    inherited pnlSortCut: TPanel
      Width = 505
      ExplicitWidth = 505
      inherited lbl4: TLabel
        Left = 320
        ExplicitLeft = 218
      end
      inherited lbl5: TLabel
        Left = 415
        ExplicitLeft = 313
      end
    end
  end
end
