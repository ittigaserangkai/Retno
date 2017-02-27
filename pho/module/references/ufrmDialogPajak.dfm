inherited frmDialogPajak: TfrmDialogPajak
  Left = 342
  Top = 87
  Caption = 'frmDialogPajak'
  ClientHeight = 197
  ClientWidth = 400
  OldCreateOrder = True
  ExplicitWidth = 416
  ExplicitHeight = 236
  PixelsPerInch = 96
  TextHeight = 16
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 141
    Width = 400
    ExplicitTop = 141
    ExplicitWidth = 400
    inherited pnlFooter: TPanel
      Width = 400
      ExplicitWidth = 400
      inherited btnClose: TcxButton
        Left = 318
        ExplicitLeft = 318
      end
      inherited btnSave: TcxButton
        Left = 231
        ExplicitLeft = 231
      end
    end
    inherited pnlSortCut: TPanel
      Width = 400
      ExplicitWidth = 400
      inherited lbl4: TLabel
        Left = 215
        ExplicitLeft = 215
      end
      inherited lbl5: TLabel
        Left = 310
        ExplicitLeft = 310
      end
    end
  end
  inherited pnlBody: TPanel
    Width = 400
    Height = 141
    ExplicitWidth = 400
    ExplicitHeight = 141
    object lbl1: TLabel
      Left = 32
      Top = 42
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object Lbl2: TLabel
      Left = 40
      Top = 70
      Width = 19
      Height = 16
      Alignment = taRightJustify
      Caption = 'PPN'
    end
    object lbl3: TLabel
      Left = 23
      Top = 98
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'PPN BM'
    end
    object Label1: TLabel
      Left = 34
      Top = 14
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object lbl4: TLabel
      Left = 125
      Top = 71
      Width = 7
      Height = 16
      Caption = '%'
    end
    object lbl5: TLabel
      Left = 125
      Top = 98
      Width = 7
      Height = 16
      Caption = '%'
    end
    object edtNamaPajak: TEdit
      Left = 69
      Top = 40
      Width = 276
      Height = 22
      Ctl3D = False
      MaxLength = 64
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtPPN: TEdit
      Left = 69
      Top = 68
      Width = 49
      Height = 22
      Ctl3D = False
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtPPNBM: TEdit
      Left = 69
      Top = 96
      Width = 49
      Height = 22
      Ctl3D = False
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtCodePajak: TEdit
      Left = 69
      Top = 12
      Width = 97
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 3
    end
  end
end
