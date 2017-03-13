inherited frmDialogDaftarKompetitor: TfrmDialogDaftarKompetitor
  Left = 372
  Top = 292
  Caption = 'Add'
  ClientHeight = 166
  ClientWidth = 367
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 383
  ExplicitHeight = 205
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 367
    Height = 110
    ExplicitWidth = 369
    ExplicitHeight = 136
    object lbl1: TLabel
      Left = 10
      Top = 39
      Width = 87
      Height = 16
      Alignment = taRightJustify
      Caption = 'Competitor Name'
    end
    object Label1: TLabel
      Left = 37
      Top = 68
      Width = 61
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Status'
    end
    object lbl2: TLabel
      Left = 13
      Top = 12
      Width = 85
      Height = 16
      Caption = 'Competitor Code'
    end
    object edtCompCode: TEdit
      Left = 112
      Top = 7
      Width = 73
      Height = 22
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtNama: TEdit
      Left = 113
      Top = 33
      Width = 248
      Height = 22
      Ctl3D = False
      MaxLength = 64
      ParentCtl3D = False
      TabOrder = 1
    end
    object sgrpbxStatus: TcxGroupBox
      Left = 113
      Top = 55
      ParentFont = False
      TabOrder = 2
      Height = 34
      Width = 153
      object rbAktif: TcxRadioButton
        Left = 9
        Top = 9
        Width = 53
        Height = 22
        Caption = 'Active'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbNoAktif: TcxRadioButton
        Left = 67
        Top = 9
        Width = 74
        Height = 22
        Caption = 'Not Active'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 110
    Width = 367
    ExplicitTop = 136
    ExplicitWidth = 369
    inherited pnlFooter: TPanel
      Width = 367
      ExplicitWidth = 369
      inherited btnClose: TcxButton
        Left = 290
        ExplicitLeft = 292
      end
      inherited btnSave: TcxButton
        Left = 187
        Action = actSave
        OnClick = footerDialog1btnSaveClick
        ExplicitLeft = 189
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 367
      ExplicitWidth = 369
      inherited lbl4: TLabel
        Left = 181
        Width = 97
        Height = 15
        Caption = 'CTRL - Enter [Save]'
        ExplicitLeft = 179
        ExplicitTop = 2
        ExplicitWidth = 97
      end
      inherited lbl5: TLabel
        Left = 286
        Height = 15
        ExplicitLeft = 279
        ExplicitTop = 2
      end
      inherited lbl3: TLabel
        Height = 15
      end
    end
  end
end
