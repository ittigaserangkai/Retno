inherited frmDialogLokasi: TfrmDialogLokasi
  Left = 313
  Caption = 'frmDialogLokasi'
  ClientHeight = 386
  ClientWidth = 378
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 394
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 378
    Height = 330
    ExplicitWidth = 378
    ExplicitHeight = 330
    object lbl1: TLabel
      Left = 65
      Top = 160
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object Label1: TLabel
      Left = 32
      Top = 215
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object lbl2: TLabel
      Left = 67
      Top = 187
      Width = 23
      Height = 16
      Caption = 'Type'
    end
    object lbl3: TLabel
      Left = 45
      Top = 242
      Width = 45
      Height = 16
      Caption = 'Capacity'
    end
    object lblCode: TLabel
      Left = 67
      Top = 15
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object Label2: TLabel
      Left = 68
      Top = 44
      Width = 24
      Height = 16
      Alignment = taRightJustify
      Caption = 'Rack'
    end
    object Label3: TLabel
      Left = 74
      Top = 73
      Width = 18
      Height = 16
      Alignment = taRightJustify
      Caption = 'Bay'
    end
    object Label4: TLabel
      Left = 61
      Top = 102
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = 'Shelve'
    end
    object Label5: TLabel
      Left = 53
      Top = 131
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Potition'
    end
    object edtCode: TEdit
      Left = 96
      Top = 12
      Width = 83
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtDescrp: TEdit
      Left = 96
      Top = 212
      Width = 200
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbbType: TComboBox
      Left = 96
      Top = 184
      Width = 83
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 6
      Text = 'DISPLAY'
      Items.Strings = (
        'DISPLAY'
        'STORAGE')
    end
    object chkIsActive: TCheckBox
      Left = 94
      Top = 266
      Width = 97
      Height = 17
      Caption = 'Active'
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object edtName: TEdit
      Left = 96
      Top = 157
      Width = 200
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 64
      ParentCtl3D = False
      TabOrder = 5
    end
    object edRack: TEdit
      Left = 96
      Top = 41
      Width = 83
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edBay: TEdit
      Left = 96
      Top = 70
      Width = 83
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object edShelve: TEdit
      Left = 96
      Top = 99
      Width = 83
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object edPotition: TEdit
      Left = 96
      Top = 128
      Width = 83
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object intedtCapacity: TcxCurrencyEdit
      Left = 96
      Top = 240
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0.;(,0.)'
      TabOrder = 9
      Width = 82
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 330
    Width = 378
    ExplicitTop = 330
    ExplicitWidth = 378
    inherited pnlFooter: TPanel
      Width = 378
      ExplicitWidth = 378
      inherited btnClose: TcxButton
        Left = 301
        ExplicitLeft = 301
      end
      inherited btnSave: TcxButton
        Left = 198
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 198
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 378
      ExplicitWidth = 378
      inherited lbl4: TLabel
        Left = 198
        Height = 15
        ExplicitLeft = 198
      end
      inherited lbl5: TLabel
        Left = 297
        Height = 15
        ExplicitLeft = 297
      end
      inherited lbl3: TLabel
        Height = 15
      end
    end
  end
end
