inherited frmDialogModule: TfrmDialogModule
  Left = 360
  Top = 199
  Caption = 'frmDialogModule'
  ClientWidth = 364
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 380
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 364
    ExplicitWidth = 366
    ExplicitHeight = 258
    object Label4: TLabel
      Left = 16
      Top = 35
      Width = 48
      Height = 16
      Caption = 'Module ID'
    end
    object Label7: TLabel
      Left = 16
      Top = 83
      Width = 76
      Height = 16
      Caption = 'Module Caption'
    end
    object Suplier: TLabel
      Left = 16
      Top = 59
      Width = 64
      Height = 16
      Caption = 'Module Name'
    end
    object Label2: TLabel
      Left = 16
      Top = 115
      Width = 62
      Height = 16
      Caption = 'Action Name'
    end
    object Label6: TLabel
      Left = 16
      Top = 139
      Width = 63
      Height = 16
      Caption = 'Module Label'
    end
    object Label1: TLabel
      Left = 16
      Top = 163
      Width = 59
      Height = 16
      Caption = 'Module Icon'
    end
    object edtModName: TEdit
      Left = 97
      Top = 58
      Width = 192
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 0
    end
    object edtModCaption: TEdit
      Left = 97
      Top = 84
      Width = 192
      Height = 21
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 1
    end
    object edtModAction: TEdit
      Left = 97
      Top = 112
      Width = 192
      Height = 21
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 2
      OnKeyDown = edtModActionKeyDown
    end
    object cboModLbl: TComboBox
      Left = 97
      Top = 139
      Width = 192
      Height = 24
      ItemIndex = 0
      TabOrder = 3
      Text = 'Add'
      Items.Strings = (
        'Add'
        'Edit'
        'Delete'
        'Refresh'
        'View'
        'Posted'
        'Form')
    end
    object edtModIconPath: TEdit
      Left = 97
      Top = 164
      Width = 192
      Height = 21
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 4
    end
    object edtModID: TcxButtonEdit
      Left = 97
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtModIDPropertiesButtonClick
      TabOrder = 5
      Width = 192
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Width = 364
    ExplicitTop = 258
    ExplicitWidth = 366
    inherited pnlFooter: TPanel
      Width = 364
      ExplicitWidth = 366
      inherited btnClose: TcxButton
        Left = 282
        ExplicitLeft = 284
      end
      inherited btnSave: TcxButton
        Left = 195
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 197
      end
    end
    inherited pnlSortCut: TPanel
      Width = 364
      ExplicitWidth = 366
      inherited lbl4: TLabel
        Left = 199
        ExplicitLeft = 201
      end
      inherited lbl5: TLabel
        Left = 274
        ExplicitLeft = 276
      end
    end
  end
end
