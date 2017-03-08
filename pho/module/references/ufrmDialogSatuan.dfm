inherited frmDialogSatuan: TfrmDialogSatuan
  Left = 557
  Top = 170
  Caption = 'frmDialogSatuan'
  ClientHeight = 176
  ClientWidth = 373
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 389
  ExplicitHeight = 215
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 373
    Height = 120
    ExplicitWidth = 373
    ExplicitHeight = 120
    object lbl1: TLabel
      Left = 48
      Top = 16
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object Lbl2: TLabel
      Left = 46
      Top = 44
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object lbl3: TLabel
      Left = 43
      Top = 76
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Group'
    end
    object edtCode: TEdit
      Left = 86
      Top = 14
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 86
      Top = 44
      Width = 267
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbbGroup: TComboBox
      Left = 86
      Top = 74
      Width = 113
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      CharCase = ecUpperCase
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 2
      Text = 'BERAT'
      Items.Strings = (
        'BERAT'
        'PANJANG'
        'VOLUME'
        'LAIN')
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 120
    Width = 373
    ExplicitTop = 120
    ExplicitWidth = 373
    inherited pnlFooter: TPanel
      Width = 373
      ExplicitWidth = 373
      inherited btnClose: TcxButton
        Left = 291
        ExplicitLeft = 291
      end
      inherited btnSave: TcxButton
        Left = 204
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 204
      end
    end
    inherited pnlSortCut: TPanel
      Width = 373
      ExplicitWidth = 373
      inherited lbl4: TLabel
        Left = 188
        ExplicitLeft = 190
      end
      inherited lbl5: TLabel
        Left = 283
        ExplicitLeft = 285
      end
    end
  end
end
