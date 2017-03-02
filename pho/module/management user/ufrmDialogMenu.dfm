inherited frmDialogMenu: TfrmDialogMenu
  Left = 419
  Top = 261
  Caption = 'frmDialogMenu'
  ClientHeight = 252
  ClientWidth = 420
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 436
  ExplicitHeight = 291
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 420
    Height = 196
    ExplicitWidth = 422
    ExplicitHeight = 222
    object lbl2: TLabel
      Left = 24
      Top = 55
      Width = 47
      Height = 16
      Caption = 'Parent ID'
    end
    object Label8: TLabel
      Left = 24
      Top = 78
      Width = 40
      Height = 16
      Caption = 'Menu ID'
    end
    object lbl3: TLabel
      Left = 24
      Top = 101
      Width = 56
      Height = 16
      Caption = 'Menu Name'
    end
    object Label1: TLabel
      Left = 24
      Top = 125
      Width = 68
      Height = 16
      Caption = 'Menu Caption'
    end
    object lblMenuNo: TLabel
      Left = 24
      Top = 151
      Width = 46
      Height = 16
      Caption = 'Menu No.'
    end
    object Label2: TLabel
      Left = 24
      Top = 31
      Width = 28
      Height = 16
      Caption = 'Modul'
    end
    object edtMenuCaption: TEdit
      Left = 96
      Top = 124
      Width = 161
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object edtMenuNm: TEdit
      Left = 96
      Top = 100
      Width = 161
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtMenuPrtNm: TEdit
      Left = 184
      Top = 52
      Width = 185
      Height = 22
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtModID: TEdit
      Left = 96
      Top = 28
      Width = 81
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = edtModIDKeyDown
    end
    object edtModNm: TEdit
      Left = 184
      Top = 28
      Width = 185
      Height = 22
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtMenuPrtID: TEdit
      Left = 96
      Top = 52
      Width = 81
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyDown = edtMenuPrtIDKeyDown
    end
    object edtMenuID: TcxButtonEdit
      Left = 96
      Top = 75
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtMenuIDPropertiesButtonClick
      TabOrder = 6
      Width = 129
    end
    object edtMenuNo: TcxButtonEdit
      Left = 96
      Top = 147
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtMenuNoPropertiesButtonClick
      TabOrder = 7
      Width = 129
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 196
    Width = 420
    ExplicitTop = 222
    ExplicitWidth = 422
    inherited pnlFooter: TPanel
      Width = 420
      ExplicitWidth = 422
      inherited btnClose: TcxButton
        Left = 338
        ExplicitLeft = 340
      end
      inherited btnSave: TcxButton
        Left = 251
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 253
      end
    end
    inherited pnlSortCut: TPanel
      Width = 420
      ExplicitWidth = 422
      inherited lbl4: TLabel
        Left = 255
        ExplicitLeft = 257
      end
      inherited lbl5: TLabel
        Left = 330
        ExplicitLeft = 332
      end
    end
  end
end
