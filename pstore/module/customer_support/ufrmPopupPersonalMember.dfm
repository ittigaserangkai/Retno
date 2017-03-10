object frmPopupPersonalMember: TfrmPopupPersonalMember
  Left = 207
  Top = 183
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Display Personal'
  ClientHeight = 357
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 24
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'DISPLAY PERSONAL'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl3: TPanel
    Left = 0
    Top = 24
    Width = 476
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 1
    object lbl4: TLabel
      Left = 11
      Top = 12
      Width = 69
      Height = 13
      Caption = 'Member Name'
    end
    object lbl5: TLabel
      Left = 271
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Card No.'
    end
    object edtMemberName: TEdit
      Left = 102
      Top = 9
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtCardNo: TEdit
      Left = 326
      Top = 9
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 65
    Width = 476
    Height = 292
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    Color = 15198183
    TabOrder = 2
    DesignSize = (
      476
      292)
    object lbl1: TLabel
      Left = 11
      Top = 13
      Width = 87
      Height = 13
      Caption = 'Kewarganegaraan'
    end
    object lbl2: TLabel
      Left = 11
      Top = 37
      Width = 82
      Height = 13
      Caption = 'Tempat/Tgl Lahir'
    end
    object lbl3: TLabel
      Left = 11
      Top = 85
      Width = 64
      Height = 13
      Caption = 'Jenis Kelamin'
    end
    object lbl6: TLabel
      Left = 11
      Top = 61
      Width = 60
      Height = 13
      Caption = 'No. Identitas'
    end
    object lbl7: TLabel
      Left = 11
      Top = 109
      Width = 33
      Height = 13
      Caption = 'Agama'
    end
    object lbl8: TLabel
      Left = 11
      Top = 133
      Width = 32
      Height = 13
      Caption = 'Alamat'
    end
    object lbl9: TLabel
      Left = 11
      Top = 158
      Width = 45
      Height = 13
      Caption = 'RT / RW'
    end
    object lbl10: TLabel
      Left = 11
      Top = 182
      Width = 54
      Height = 13
      Caption = 'Kecamatan'
    end
    object lbl11: TLabel
      Left = 271
      Top = 157
      Width = 48
      Height = 13
      Caption = 'Kelurahan'
    end
    object lbl12: TLabel
      Left = 271
      Top = 181
      Width = 22
      Height = 13
      Caption = 'Kota'
    end
    object lbl13: TLabel
      Left = 11
      Top = 206
      Width = 49
      Height = 13
      Caption = 'Post Code'
    end
    object lbl14: TLabel
      Left = 271
      Top = 205
      Width = 24
      Height = 13
      Caption = 'Telp.'
    end
    object lbl15: TLabel
      Left = 11
      Top = 230
      Width = 30
      Height = 13
      Caption = 'Status'
    end
    object lbl16: TLabel
      Left = 268
      Top = 230
      Width = 82
      Height = 13
      Caption = 'Jml. Tanggungan'
    end
    object lbl17: TLabel
      Left = 268
      Top = 254
      Width = 91
      Height = 13
      Caption = 'Pendptn. per Bulan'
    end
    object lblClose: TcxLabel
      Left = 439
      Top = 10
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      OnClick = lblCloseClick
    end
    object lblEditPersonal: TcxLabel
      Left = 365
      Top = 10
      Cursor = crHandPoint
      Caption = 'Edit Personal'
      ParentFont = False
      OnClick = lblEditPersonalClick
    end
    object dtLahir: TcxDateEdit
      Left = 227
      Top = 35
      TabOrder = 0
      Width = 97
    end
    object edtKewarganegaraan: TEdit
      Left = 102
      Top = 11
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtTempatLhr: TEdit
      Left = 102
      Top = 35
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtNoIdentts: TEdit
      Left = 102
      Top = 59
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtGender: TEdit
      Left = 102
      Top = 83
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtAgama: TEdit
      Left = 102
      Top = 107
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtAlamat: TEdit
      Left = 102
      Top = 131
      Width = 344
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtRt: TEdit
      Left = 102
      Top = 155
      Width = 40
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtKecamatan: TEdit
      Left = 102
      Top = 179
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtKelurahan: TEdit
      Left = 326
      Top = 155
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
    end
    object edtRw: TEdit
      Left = 146
      Top = 155
      Width = 40
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
    end
    object edtKota: TEdit
      Left = 326
      Top = 179
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
    end
    object edtPostCode: TEdit
      Left = 102
      Top = 203
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 12
    end
    object edtTelp: TEdit
      Left = 326
      Top = 203
      Width = 120
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 13
    end
    object edtStatus: TEdit
      Left = 102
      Top = 227
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 14
    end
    object edtJmlTanggungan: TEdit
      Left = 365
      Top = 227
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 15
    end
    object edtPendptn: TEdit
      Left = 365
      Top = 251
      Width = 81
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 16
    end
  end
end
