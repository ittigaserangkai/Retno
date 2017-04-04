inherited frmDialogPersonalMember: TfrmDialogPersonalMember
  Left = 270
  Top = 145
  Caption = 'Update Personal Member'
  ClientHeight = 384
  ClientWidth = 766
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 782
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 766
    Height = 328
    ExplicitWidth = 766
    ExplicitHeight = 328
    object pnl1: TPanel
      Left = 2
      Top = 43
      Width = 762
      Height = 283
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 20
      Color = 15198183
      TabOrder = 1
      ExplicitLeft = 4
      ExplicitTop = 44
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
      object Label1: TLabel
        Left = 500
        Top = 12
        Width = 46
        Height = 16
        Caption = 'Kelompok'
      end
      object Label2: TLabel
        Left = 501
        Top = 61
        Width = 84
        Height = 16
        Caption = 'Tipe Pembayaran'
      end
      object Label3: TLabel
        Left = 501
        Top = 85
        Width = 84
        Height = 16
        Caption = 'Term Of Payment'
      end
      object Label4: TLabel
        Left = 501
        Top = 109
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object Label5: TLabel
        Left = 501
        Top = 133
        Width = 30
        Height = 16
        Caption = 'Plafon'
      end
      object Label6: TLabel
        Left = 501
        Top = 37
        Width = 63
        Height = 16
        Caption = 'Tipe Member'
      end
      object dtLahir: TcxDateEdit
        Left = 242
        Top = 35
        Properties.SaveTime = False
        TabOrder = 2
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
      end
      object edtKecamatan: TEdit
        Left = 117
        Top = 179
        Width = 120
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
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
      end
      object edtKota: TEdit
        Left = 313
        Top = 179
        Width = 149
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object edtPostCode: TEdit
        Left = 117
        Top = 203
        Width = 81
        Height = 22
        TabStop = False
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 5
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object edtTelp: TEdit
        Left = 342
        Top = 203
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 13
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
        Items.Strings = (
          'WNA'
          'WNI')
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
        Items.Strings = (
          'SINGLE'
          'MARRIED')
      end
      object edtPndptn: TcxCurrencyEdit
        Left = 353
        Top = 251
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 16
        Width = 109
      end
      object edtJmlTanggungan: TcxSpinEdit
        Left = 353
        Top = 227
        TabOrder = 15
        Width = 109
      end
      object cbpAgama: TcxExtLookupComboBox
        Left = 116
        Top = 107
        TabOrder = 5
        Width = 145
      end
      object cbpTipeBayar: TcxExtLookupComboBox
        Left = 603
        Top = 58
        TabOrder = 19
        Width = 132
      end
      object edtTOP: TcxSpinEdit
        Left = 603
        Top = 82
        TabOrder = 20
        Width = 109
      end
      object cbpKelompok: TComboBox
        Left = 604
        Top = 9
        Width = 130
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 17
        Items.Strings = (
          'END USER'
          'TRADER')
      end
      object edtLeadTime: TcxSpinEdit
        Left = 603
        Top = 106
        TabOrder = 21
        Width = 109
      end
      object edtPlafon: TcxCurrencyEdit
        Left = 603
        Top = 130
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 22
        Width = 109
      end
      object cbpMember: TcxExtLookupComboBox
        Left = 603
        Top = 34
        TabOrder = 18
        Width = 132
      end
      object cbpKelurahan: TcxExtLookupComboBox
        Left = 313
        Top = 154
        Properties.OnEditValueChanged = cbpKelurahanPropertiesEditValueChanged
        TabOrder = 9
        Width = 149
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 2
      Width = 762
      Height = 41
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
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
      object edtName: TEdit
        Left = 118
        Top = 9
        Width = 120
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtCardNo: TEdit
        AlignWithMargins = True
        Left = 350
        Top = 5
        Width = 407
        Height = 31
        Align = alRight
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -24
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '01330001217'
        ExplicitLeft = 353
        ExplicitTop = 2
        ExplicitHeight = 37
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 328
    Width = 766
    ExplicitTop = 328
    ExplicitWidth = 766
    inherited pnlFooter: TPanel
      Width = 766
      ExplicitWidth = 766
      inherited btnClose: TcxButton
        Left = 689
        Action = actCancel
        ExplicitLeft = 689
      end
      inherited btnSave: TcxButton
        Left = 596
        Action = actSave
        ExplicitLeft = 596
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 519
        ExplicitLeft = 519
      end
    end
    inherited pnlSortCut: TPanel
      Width = 766
      ExplicitWidth = 766
      inherited lbCTRLEnter: TLabel
        Left = 591
        Height = 15
        ExplicitLeft = 591
      end
      inherited lbEscape: TLabel
        Left = 682
        Height = 15
        ExplicitLeft = 682
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 515
        ExplicitLeft = 239
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 369
    Top = 116
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
