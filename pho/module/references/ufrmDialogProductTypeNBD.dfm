inherited frmDialogProductTypeNBD: TfrmDialogProductTypeNBD
  Left = 297
  Top = 176
  Caption = 'frmDialogProductTypeNBD'
  ClientHeight = 256
  ClientWidth = 396
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 412
  ExplicitHeight = 295
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 396
    Height = 200
    ExplicitTop = 0
    ExplicitWidth = 398
    ExplicitHeight = 226
    object lbl1: TLabel
      Left = 23
      Top = 24
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 23
      Top = 51
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Name'
    end
    object lbl3: TLabel
      Left = 23
      Top = 85
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Owner'
    end
    object lbl4: TLabel
      Left = 23
      Top = 121
      Width = 64
      Height = 16
      AutoSize = False
      Caption = 'Rek. Debet'
    end
    object lbl5: TLabel
      Left = 23
      Top = 148
      Width = 64
      Height = 16
      AutoSize = False
      Caption = 'Rek. Credit'
    end
    object edtCode: TEdit
      Left = 85
      Top = 21
      Width = 78
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = edtCodeKeyPress
    end
    object edtName: TEdit
      Left = 85
      Top = 48
      Width = 277
      Height = 22
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      TabOrder = 1
    end
    object rg1: TRadioGroup
      Left = 85
      Top = 70
      Width = 277
      Height = 41
      TabOrder = 2
    end
    object rbMarketing: TRadioButton
      Left = 101
      Top = 86
      Width = 90
      Height = 17
      Caption = 'MARKETING'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object rbStore: TRadioButton
      Left = 228
      Top = 86
      Width = 90
      Height = 17
      Caption = 'STORE'
      TabOrder = 4
    end
    object edtRekDebet: TEdit
      Left = 85
      Top = 118
      Width = 90
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
      OnKeyUp = edtRekDebetKeyUp
    end
    object edtRekCredit: TEdit
      Left = 85
      Top = 145
      Width = 90
      Height = 22
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
      OnKeyUp = edtRekCreditKeyUp
    end
    object lblSearchRek: TLinkLabel
      Left = 192
      Top = 136
      Width = 96
      Height = 20
      Cursor = crHandPoint
      Caption = 'F5 for Search Rek.'
      Color = 15198183
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 7
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 200
    Width = 396
    ExplicitTop = 226
    ExplicitWidth = 398
    inherited pnlFooter: TPanel
      Width = 396
      ExplicitWidth = 398
      inherited btnClose: TcxButton
        Left = 314
        ExplicitLeft = 316
      end
      inherited btnSave: TcxButton
        Left = 219
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 221
      end
    end
    inherited pnlSortCut: TPanel
      Width = 396
      ExplicitWidth = 398
      inherited lbl4: TLabel
        Left = 212
        Width = 93
        Caption = 'Ctrl + Enter [Save]'
        ExplicitLeft = 214
        ExplicitWidth = 93
      end
      inherited lbl5: TLabel
        Left = 314
        ExplicitLeft = 316
      end
    end
  end
end
