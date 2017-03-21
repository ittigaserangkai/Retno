inherited frmDialogGudang: TfrmDialogGudang
  Left = 300
  Top = 152
  Caption = 'frmDialogGudang'
  ClientHeight = 307
  ClientWidth = 421
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 437
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 421
    Height = 251
    ExplicitWidth = 421
    ExplicitHeight = 251
    object lbl2: TLabel
      Left = 51
      Top = 20
      Width = 21
      Height = 16
      Caption = 'Unit'
    end
    object Label1: TLabel
      Left = 51
      Top = 44
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object Label2: TLabel
      Left = 51
      Top = 92
      Width = 39
      Height = 16
      Caption = 'Address'
    end
    object Label3: TLabel
      Left = 51
      Top = 116
      Width = 43
      Height = 16
      Caption = 'Telphone'
    end
    object Label4: TLabel
      Left = 51
      Top = 140
      Width = 18
      Height = 16
      Caption = 'Fax'
    end
    object Label5: TLabel
      Left = 51
      Top = 164
      Width = 21
      Height = 16
      Caption = 'City'
    end
    object Label6: TLabel
      Left = 51
      Top = 188
      Width = 15
      Height = 16
      Caption = 'Zip'
    end
    object Label7: TLabel
      Left = 51
      Top = 212
      Width = 77
      Height = 16
      Caption = 'Contact Person'
    end
    object Label8: TLabel
      Left = 51
      Top = 68
      Width = 27
      Height = 16
      Caption = 'Name'
    end
    object edtUnitID: TEdit
      Left = 137
      Top = 16
      Width = 80
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtUnitNm: TEdit
      Left = 219
      Top = 16
      Width = 149
      Height = 22
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
    end
    object edtCode: TEdit
      Left = 137
      Top = 40
      Width = 80
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtZip: TEdit
      Left = 137
      Top = 184
      Width = 149
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object edtAddrs: TEdit
      Left = 137
      Top = 88
      Width = 232
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object edtTlp: TEdit
      Left = 137
      Top = 112
      Width = 104
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object edtFax: TEdit
      Left = 137
      Top = 136
      Width = 104
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtCity: TEdit
      Left = 137
      Top = 160
      Width = 152
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object edtNm: TEdit
      Left = 137
      Top = 64
      Width = 184
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object edtContact: TEdit
      Left = 137
      Top = 208
      Width = 184
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 251
    Width = 421
    ExplicitTop = 251
    ExplicitWidth = 421
    inherited pnlFooter: TPanel
      Width = 421
      ExplicitWidth = 421
      inherited btnClose: TcxButton
        Left = 339
        ExplicitLeft = 339
      end
      inherited btnSave: TcxButton
        Left = 252
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 252
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 421
      ExplicitWidth = 421
      inherited lbCTRLEnter: TLabel
        Left = 152
        Width = 159
        Caption = 'F5 [Lookup]     Ctrl-Enter [Save]'
        ExplicitLeft = 154
        ExplicitWidth = 159
      end
      inherited lbEscape: TLabel
        Left = 326
        ExplicitLeft = 328
      end
    end
  end
end
