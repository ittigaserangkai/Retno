inherited frmDialogPersonalMember: TfrmDialogPersonalMember
  Left = 270
  Top = 145
  Caption = 'Dialog Personal Member'
  ClientHeight = 384
  ClientWidth = 490
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 506
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 490
    Height = 328
    ExplicitWidth = 490
    ExplicitHeight = 328
    object pnl1: TPanel
      Left = 2
      Top = 43
      Width = 486
      Height = 283
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 20
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 22
        Top = 13
        Width = 90
        Height = 16
        Caption = 'Kewarganegaraan'
      end
      object lbl2: TLabel
        Left = 22
        Top = 37
        Width = 85
        Height = 16
        Caption = 'Tempat/Tgl Lahir'
      end
      object lbl3: TLabel
        Left = 22
        Top = 85
        Width = 65
        Height = 16
        Caption = 'Jenis Kelamin'
      end
      object lbl6: TLabel
        Left = 22
        Top = 61
        Width = 66
        Height = 16
        Caption = 'No. Identitas'
      end
      object lbl7: TLabel
        Left = 22
        Top = 109
        Width = 32
        Height = 16
        Caption = 'Agama'
      end
      object lbl8: TLabel
        Left = 22
        Top = 133
        Width = 33
        Height = 16
        Caption = 'Alamat'
      end
      object lbl9: TLabel
        Left = 22
        Top = 158
        Width = 39
        Height = 16
        Caption = 'RT / RW'
      end
      object lbl10: TLabel
        Left = 22
        Top = 182
        Width = 55
        Height = 16
        Caption = 'Kecamatan'
      end
      object lbl11: TLabel
        Left = 254
        Top = 157
        Width = 49
        Height = 16
        Caption = 'Kelurahan'
      end
      object lbl12: TLabel
        Left = 254
        Top = 181
        Width = 23
        Height = 16
        Caption = 'Kota'
      end
      object lbl13: TLabel
        Left = 22
        Top = 206
        Width = 49
        Height = 16
        Caption = 'Post Code'
      end
      object lbl14: TLabel
        Left = 254
        Top = 205
        Width = 23
        Height = 16
        Caption = 'Telp.'
      end
      object lbl15: TLabel
        Left = 22
        Top = 230
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl16: TLabel
        Left = 251
        Top = 230
        Width = 81
        Height = 16
        Caption = 'Jml. Tanggungan'
      end
      object lbl17: TLabel
        Left = 251
        Top = 254
        Width = 93
        Height = 16
        Caption = 'Pendptn. per Bulan'
      end
      object dtLahir: TcxDateEdit
        Left = 242
        Top = 35
        TabOrder = 2
        OnKeyPress = dtLahirKeyPress
        Width = 97
      end
      object edtTempatLhr: TEdit
        Left = 117
        Top = 35
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = edtTempatLhrKeyPress
      end
      object edtNoIdentts: TEdit
        Left = 117
        Top = 59
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = edtNoIdenttsKeyPress
      end
      object edtAlamat: TEdit
        Left = 117
        Top = 132
        Width = 344
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = edtAlamatKeyPress
      end
      object edtRt: TEdit
        Left = 117
        Top = 155
        Width = 40
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = edtRtKeyPress
      end
      object edtKecamatan: TEdit
        Left = 117
        Top = 179
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = edtKecamatanKeyPress
      end
      object edtKelurahan: TEdit
        Left = 312
        Top = 155
        Width = 149
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = edtKelurahanKeyPress
      end
      object edtRw: TEdit
        Left = 161
        Top = 155
        Width = 40
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = edtRwKeyPress
      end
      object edtKota: TEdit
        Left = 312
        Top = 179
        Width = 149
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 11
        OnKeyPress = edtKotaKeyPress
      end
      object edtPostCode: TEdit
        Left = 117
        Top = 203
        Width = 81
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 12
        OnKeyPress = edtPostCodeKeyPress
      end
      object edtTelp: TEdit
        Left = 341
        Top = 203
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 13
        OnKeyPress = edtTelpKeyPress
      end
      object edtJmlTanggungan: TEdit
        Left = 352
        Top = 227
        Width = 109
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 15
        Text = '0'
        OnKeyPress = edtJmlTanggunganKeyPress
      end
      object cbbGender: TComboBox
        Left = 117
        Top = 82
        Width = 120
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 4
        Text = 'PRIA'
        OnKeyPress = cbbGenderKeyPress
        Items.Strings = (
          'WANITA'
          'PRIA')
      end
      object cbbWarganegara: TComboBox
        Left = 117
        Top = 9
        Width = 120
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 0
        Text = 'WNI'
        OnKeyPress = cbbWarganegaraKeyPress
        Items.Strings = (
          'WNA'
          'WNI')
      end
      object cbpAgama0: TColumnComboBox
        Left = 261
        Top = 107
        Width = 120
        Height = 24
        Color = clWindow
        Version = '1.5.0.1'
        Visible = False
        Ctl3D = False
        Columns = <>
        ComboItems = <>
        EditColumn = -1
        EditHeight = 18
        EmptyText = ''
        EmptyTextStyle = []
        DropWidth = 0
        DropHeight = 200
        Enabled = True
        GridLines = False
        ItemIndex = -1
        LookupColumn = 0
        LabelCaption = ''
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        MaxLength = 10
        ParentCtl3D = False
        SortColumn = 0
        TabOrder = 17
      end
      object cbbStatus: TComboBox
        Left = 117
        Top = 227
        Width = 81
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 14
        Text = 'SINGLE'
        OnKeyPress = cbbStatusKeyPress
        Items.Strings = (
          'SINGLE'
          'MARRIED')
      end
      object edtPndptn: TcxCurrencyEdit
        Left = 352
        Top = 251
        TabOrder = 16
        OnKeyPress = edtPndptnKeyPress
        Width = 109
      end
      object cbpAgama: TComboBox
        Left = 117
        Top = 107
        Width = 120
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = cbpAgamaKeyPress
        Items.Strings = (
          'ISLAM'
          'KRISTEN'
          'KATHOLIK'
          'HINDU'
          'BUDHA'
          'LAINNYA')
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 2
      Width = 486
      Height = 41
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object lbl4: TLabel
        Left = 27
        Top = 12
        Width = 69
        Height = 16
        Caption = 'Member Name'
      end
      object lbl5: TLabel
        Left = 287
        Top = 12
        Width = 44
        Height = 16
        Caption = 'Card No.'
      end
      object edtMemberName: TEdit
        Left = 118
        Top = 9
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = edtMemberNameKeyPress
      end
      object edtCardNo: TEdit
        Left = 342
        Top = 9
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = edtCardNoKeyPress
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 328
    Width = 490
    ExplicitTop = 328
    ExplicitWidth = 490
    inherited pnlFooter: TPanel
      Width = 490
      ExplicitWidth = 490
      inherited btnClose: TcxButton
        Left = 413
        ExplicitLeft = 413
      end
      inherited btnSave: TcxButton
        Left = 310
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 310
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 490
      ExplicitWidth = 490
      inherited lbCTRLEnter: TLabel
        Left = 315
        Height = 15
        ExplicitLeft = 315
      end
      inherited lbEscape: TLabel
        Left = 406
        Height = 15
        ExplicitLeft = 406
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
end
