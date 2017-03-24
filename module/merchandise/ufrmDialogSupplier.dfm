inherited frmDialogSupplier: TfrmDialogSupplier
  Left = 414
  Top = 98
  Caption = 'frmDialogSupplier'
  ClientHeight = 559
  ClientWidth = 656
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 672
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 656
    Height = 503
    ExplicitWidth = 656
    ExplicitHeight = 503
    object pc1: TcxPageControl
      Left = 2
      Top = 2
      Width = 652
      Height = 499
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = tsSupplier
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 495
      ClientRectLeft = 4
      ClientRectRight = 648
      ClientRectTop = 27
      object tsSupplier: TcxTabSheet
        Caption = 'Supplier'
        object lbl3: TLabel
          Left = 66
          Top = 58
          Width = 39
          Height = 16
          Caption = 'Address'
        end
        object lbl4: TLabel
          Left = 83
          Top = 80
          Width = 21
          Height = 16
          Caption = 'City'
        end
        object lbl18: TLabel
          Left = 243
          Top = 80
          Width = 49
          Height = 16
          Caption = 'Post Code'
        end
        object lbl19: TLabel
          Left = 256
          Top = 103
          Width = 38
          Height = 16
          Caption = 'Fax No.'
        end
        object lbl5: TLabel
          Left = 58
          Top = 105
          Width = 45
          Height = 16
          Caption = 'Phone No'
        end
        object lbl6: TLabel
          Left = 26
          Top = 127
          Width = 77
          Height = 16
          Caption = 'Contact Person'
        end
        object lbl7: TLabel
          Left = 39
          Top = 152
          Width = 65
          Height = 16
          Caption = 'Supplier Type'
        end
        object lbl8: TLabel
          Left = 38
          Top = 178
          Width = 67
          Height = 16
          Caption = 'PKP/NON PKP'
        end
        object lbl10: TLabel
          Left = 76
          Top = 202
          Width = 29
          Height = 16
          Caption = 'NPWP'
        end
        object lbl12: TLabel
          Left = 54
          Top = 250
          Width = 52
          Height = 16
          Caption = 'Bank Code'
        end
        object lbl13: TLabel
          Left = 46
          Top = 322
          Width = 61
          Height = 16
          Caption = 'Account No.'
        end
        object lbl14: TLabel
          Left = 35
          Top = 345
          Width = 71
          Height = 16
          Caption = 'Account Name'
        end
        object bvl2: TBevel
          Left = 13
          Top = 419
          Width = 444
          Height = 9
          Shape = bsTopLine
        end
        object lbl36: TLabel
          Left = 264
          Top = 178
          Width = 37
          Height = 16
          Caption = 'Tax No.'
          Visible = False
        end
        object lbl21: TLabel
          Left = 311
          Top = 127
          Width = 27
          Height = 16
          Caption = 'Tittle'
        end
        object Label5: TLabel
          Left = 36
          Top = 35
          Width = 69
          Height = 16
          Caption = 'Supplier Name'
        end
        object Label4: TLabel
          Left = 21
          Top = 11
          Width = 84
          Height = 16
          Caption = 'Suppl. Code/Tipe'
        end
        object Label6: TLabel
          Left = 48
          Top = 369
          Width = 56
          Height = 16
          Caption = 'Supp Group'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object Lbl2: TLabel
          Left = 70
          Top = 274
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = 'Branch'
        end
        object Label9: TLabel
          Left = 67
          Top = 297
          Width = 39
          Height = 16
          Alignment = taRightJustify
          Caption = 'Address'
        end
        object Label13: TLabel
          Left = 39
          Top = 225
          Width = 65
          Height = 16
          Caption = 'Alamat NPWP'
        end
        object Label14: TLabel
          Left = 185
          Top = 11
          Width = 87
          Height = 16
          Caption = 'Tipe Perushahaan'
        end
        object edtSupCode: TEdit
          Left = 112
          Top = 8
          Width = 65
          Height = 22
          CharCase = ecUpperCase
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          TabOrder = 0
        end
        object edtSupName: TEdit
          Tag = 9
          Left = 112
          Top = 33
          Width = 298
          Height = 22
          HelpType = htKeyword
          HelpKeyword = 'Supplier Name'
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object edtAddress: TEdit
          Left = 112
          Top = 56
          Width = 298
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          Text = '---'
        end
        object edtCity: TEdit
          Left = 112
          Top = 79
          Width = 95
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object edtPostCode: TEdit
          Left = 304
          Top = 79
          Width = 106
          Height = 22
          BiDiMode = bdLeftToRight
          CharCase = ecUpperCase
          Ctl3D = False
          NumbersOnly = True
          ParentBiDiMode = False
          ParentCtl3D = False
          TabOrder = 5
        end
        object edtFax: TEdit
          Left = 304
          Top = 102
          Width = 106
          Height = 22
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
        end
        object edtPhone: TEdit
          Left = 112
          Top = 102
          Width = 95
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 6
        end
        object edtContactP: TEdit
          Left = 112
          Top = 125
          Width = 187
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 8
        end
        object edtAccountName: TEdit
          Left = 112
          Top = 342
          Width = 211
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 19
        end
        object edtAccountNo: TEdit
          Left = 112
          Top = 319
          Width = 132
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 18
        end
        object cbbPKP: TComboBox
          Left = 112
          Top = 174
          Width = 95
          Height = 24
          BevelKind = bkSoft
          Style = csDropDownList
          Ctl3D = False
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 11
          Text = 'NON PKP'
          Items.Strings = (
            'NON PKP'
            'PKP')
        end
        object edtTaxNo: TEdit
          Left = 306
          Top = 175
          Width = 104
          Height = 22
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 12
          Visible = False
        end
        object edtTitle: TEdit
          Left = 344
          Top = 125
          Width = 66
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 9
        end
        object medtNPWP: TMaskEdit
          Left = 111
          Top = 200
          Width = 135
          Height = 22
          CharCase = ecUpperCase
          Ctl3D = False
          EditMask = '999.999-99.99999999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          MaxLength = 19
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 13
          Text = ''
        end
        object edtCabangBank: TEdit
          Left = 112
          Top = 271
          Width = 297
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 16
        end
        object edtAlamatBank: TEdit
          Left = 112
          Top = 295
          Width = 297
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 17
        end
        object chkSupActive: TCheckBox
          Left = 112
          Top = 390
          Width = 73
          Height = 17
          Caption = 'Active'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
        end
        object edtNPWPAlamat: TEdit
          Left = 112
          Top = 223
          Width = 298
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 14
        end
        object cxLookUpBank: TcxExtLookupComboBox
          Left = 112
          Top = 246
          TabOrder = 15
          Width = 299
        end
        object cxLookupTipePerush: TcxExtLookupComboBox
          Left = 278
          Top = 8
          TabOrder = 1
          Width = 132
        end
        object cxLookUpSuppGroup: TcxExtLookupComboBox
          Left = 111
          Top = 365
          TabOrder = 20
          Width = 299
        end
        object cxLookUpSupType: TcxExtLookupComboBox
          Left = 111
          Top = 149
          TabOrder = 10
          Width = 299
        end
      end
      object tsMerchandiseGroup: TcxTabSheet
        Caption = 'Category'
        Enabled = False
        object lbl37: TLabel
          Left = 66
          Top = 10
          Width = 47
          Height = 16
          Caption = 'Category'
        end
        object lbl23: TLabel
          Left = 32
          Top = 35
          Width = 81
          Height = 16
          Caption = 'Type of Payment'
        end
        object lbl24: TLabel
          Left = 31
          Top = 58
          Width = 82
          Height = 16
          Caption = 'Term of Payment'
        end
        object lbl27: TLabel
          Left = 154
          Top = 62
          Width = 24
          Height = 16
          Caption = 'Days'
        end
        object lbl28: TLabel
          Left = 154
          Top = 83
          Width = 24
          Height = 16
          Caption = 'Days'
        end
        object lbl25: TLabel
          Left = 65
          Top = 82
          Width = 50
          Height = 16
          Caption = 'Lead Time'
        end
        object lbl26: TLabel
          Left = 62
          Top = 104
          Width = 52
          Height = 16
          Caption = 'Deliver PO'
        end
        object lbl22: TLabel
          Left = 54
          Top = 129
          Width = 60
          Height = 16
          Caption = 'Credit Limit'
        end
        object lbl15: TLabel
          Left = 291
          Top = 32
          Width = 89
          Height = 16
          Caption = 'AP Ending Balance'
        end
        object lbl16: TLabel
          Left = 318
          Top = 55
          Width = 61
          Height = 16
          Caption = 'C/N Balance'
        end
        object lbl34: TLabel
          Left = 273
          Top = 80
          Width = 106
          Height = 16
          Caption = 'Last Pusch./Payment'
        end
        object lbl35: TLabel
          Left = 482
          Top = 80
          Width = 6
          Height = 16
          Caption = '/'
        end
        object lbl9: TLabel
          Left = 272
          Top = 103
          Width = 107
          Height = 16
          Caption = 'Outstanding Payment'
        end
        object lbl33: TLabel
          Left = 329
          Top = 127
          Width = 49
          Height = 16
          Caption = 'No. Of PO'
        end
        object lbl29: TLabel
          Left = 37
          Top = 153
          Width = 78
          Height = 16
          Caption = 'Extended Desc.'
        end
        object lbl45: TLabel
          Left = 39
          Top = 187
          Width = 74
          Height = 16
          Caption = 'Day of Proc PO'
        end
        object Label1: TLabel
          Left = 311
          Top = 154
          Width = 67
          Height = 16
          Caption = 'BKP/NON BKP'
        end
        object Label2: TLabel
          Left = 424
          Top = 127
          Width = 18
          Height = 16
          Caption = 'Fee'
        end
        object Label3: TLabel
          Left = 475
          Top = 127
          Width = 7
          Height = 16
          Caption = '%'
        end
        object Label10: TLabel
          Left = 496
          Top = 155
          Width = 19
          Height = 16
          Caption = 'PPN'
        end
        object Label11: TLabel
          Left = 548
          Top = 57
          Width = 21
          Height = 16
          Caption = 'Disc'
        end
        object Label12: TLabel
          Left = 623
          Top = 55
          Width = 7
          Height = 16
          Caption = '%'
        end
        object edtMerGrup: TEdit
          Left = 248
          Top = 8
          Width = 272
          Height = 22
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtTermOP: TEdit
          Left = 121
          Top = 58
          Width = 24
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
        object edtLeadTime: TEdit
          Left = 121
          Top = 81
          Width = 24
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object curedtCreditLmt: TcxCurrencyEdit
          Left = 121
          Top = 129
          TabOrder = 6
          Width = 135
        end
        object curedtAPEndB: TcxCurrencyEdit
          Left = 385
          Top = 31
          TabOrder = 8
          Width = 135
        end
        object curedtCNBln: TcxCurrencyEdit
          Left = 385
          Top = 54
          TabOrder = 10
          Width = 135
        end
        object dtLastPurchs: TcxDateEdit
          Left = 385
          Top = 77
          TabOrder = 12
          Width = 95
        end
        object curedtPaymnt: TcxCurrencyEdit
          Left = 492
          Top = 77
          TabOrder = 13
          Width = 130
        end
        object curedtOutsdPaymnt: TcxCurrencyEdit
          Left = 385
          Top = 102
          TabOrder = 14
          Width = 136
        end
        object edtNoOfPO: TEdit
          Left = 385
          Top = 125
          Width = 25
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 15
        end
        object edtExtdDesc: TEdit
          Left = 121
          Top = 152
          Width = 176
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
        end
        object chkEnableCN: TCheckBox
          Left = 524
          Top = 33
          Width = 110
          Height = 17
          Caption = 'Enable Create CN'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
        object pnl1: TPanel
          Left = 0
          Top = 210
          Width = 644
          Height = 258
          Align = alBottom
          Caption = 'Change contact supplier for Merchandise Group'
          Color = clWhite
          TabOrder = 21
          ExplicitLeft = 39
          object lbl30: TLabel
            Left = 77
            Top = 47
            Width = 39
            Height = 16
            Caption = 'Address'
          end
          object lbl31: TLabel
            Left = 94
            Top = 70
            Width = 21
            Height = 16
            Caption = 'City'
          end
          object lbl32: TLabel
            Left = 227
            Top = 69
            Width = 49
            Height = 16
            Caption = 'Post Code'
          end
          object lbl38: TLabel
            Left = 240
            Top = 92
            Width = 38
            Height = 16
            Caption = 'Fax No.'
          end
          object lbl39: TLabel
            Left = 69
            Top = 93
            Width = 45
            Height = 16
            Caption = 'Phone No'
          end
          object lbl40: TLabel
            Left = 37
            Top = 117
            Width = 77
            Height = 16
            Caption = 'Contact Person'
          end
          object lbl41: TLabel
            Left = 315
            Top = 115
            Width = 27
            Height = 16
            Caption = 'Tittle'
          end
          object lbl42: TLabel
            Left = 63
            Top = 140
            Width = 52
            Height = 16
            Caption = 'Bank Code'
          end
          object lbl43: TLabel
            Left = 58
            Top = 235
            Width = 61
            Height = 16
            Caption = 'Account No.'
          end
          object lbl44: TLabel
            Left = 45
            Top = 211
            Width = 71
            Height = 16
            Caption = 'Account Name'
          end
          object Label7: TLabel
            Left = 52
            Top = 164
            Width = 62
            Height = 16
            Caption = 'Bank Branch'
          end
          object Label8: TLabel
            Left = 47
            Top = 188
            Width = 65
            Height = 16
            Caption = 'Bank Address'
          end
          object edtAddrMer: TEdit
            Tag = 1
            Left = 121
            Top = 45
            Width = 343
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 1
            Text = '---'
          end
          object edtCityMer: TEdit
            Tag = 1
            Left = 121
            Top = 68
            Width = 95
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 2
          end
          object edtPostCodeMer: TEdit
            Tag = 1
            Left = 283
            Top = 68
            Width = 79
            Height = 22
            BiDiMode = bdLeftToRight
            Ctl3D = False
            Enabled = False
            ParentBiDiMode = False
            ParentCtl3D = False
            TabOrder = 3
          end
          object edtFaxMer: TEdit
            Tag = 1
            Left = 283
            Top = 91
            Width = 79
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 5
          end
          object edtPhoneMer: TEdit
            Tag = 1
            Left = 121
            Top = 91
            Width = 95
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 4
          end
          object edtContactMer: TEdit
            Tag = 1
            Left = 121
            Top = 114
            Width = 187
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 6
          end
          object edtTitleMer: TEdit
            Tag = 1
            Left = 345
            Top = 114
            Width = 80
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 7
          end
          object edtBankCodeMer: TEdit
            Tag = 1
            Left = 186
            Top = 137
            Width = 247
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 9
            Text = 'telo'
          end
          object edtBankAccNameMer: TEdit
            Tag = 1
            Left = 121
            Top = 209
            Width = 279
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 12
          end
          object edtBankAccNoMer: TEdit
            Tag = 1
            Left = 121
            Top = 232
            Width = 211
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            TabOrder = 13
          end
          object chkIsDif: TCheckBox
            Left = 121
            Top = 24
            Width = 153
            Height = 17
            Caption = 'Make Different Contact'
            TabOrder = 0
          end
          object cbpBankCodeMer: TcxButtonEdit
            Left = 121
            Top = 137
            Enabled = False
            Properties.Buttons = <>
            TabOrder = 8
            Text = '0'
            Width = 63
          end
          object edtBankBranch: TEdit
            Tag = 1
            Left = 121
            Top = 161
            Width = 312
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 10
          end
          object edtBankAddrss: TEdit
            Tag = 1
            Left = 121
            Top = 185
            Width = 312
            Height = 22
            Ctl3D = False
            Enabled = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 11
          end
        end
        object grp: TGroupBox
          Left = 121
          Top = 175
          Width = 496
          Height = 35
          TabOrder = 20
          object chkMon: TCheckBox
            Left = 7
            Top = 12
            Width = 61
            Height = 17
            Caption = 'Monday'
            TabOrder = 0
          end
          object chkTue: TCheckBox
            Left = 71
            Top = 12
            Width = 64
            Height = 17
            Caption = 'Tuesday'
            TabOrder = 1
          end
          object chkWed: TCheckBox
            Left = 138
            Top = 12
            Width = 78
            Height = 17
            Caption = 'Wednesday'
            TabOrder = 2
          end
          object chkThu: TCheckBox
            Left = 222
            Top = 12
            Width = 67
            Height = 17
            Caption = 'Thursday'
            TabOrder = 3
          end
          object chkFri: TCheckBox
            Left = 295
            Top = 12
            Width = 61
            Height = 17
            Caption = 'Friday'
            TabOrder = 4
          end
          object chkSat: TCheckBox
            Left = 352
            Top = 12
            Width = 67
            Height = 17
            Caption = 'Saturday'
            TabOrder = 5
          end
          object chkSun: TCheckBox
            Left = 422
            Top = 12
            Width = 61
            Height = 17
            Caption = 'Sunday'
            TabOrder = 6
          end
        end
        object cbbBKP: TComboBox
          Left = 385
          Top = 150
          Width = 103
          Height = 24
          BevelKind = bkSoft
          Style = csDropDownList
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 18
          Items.Strings = (
            'NON BKP'
            'BKP')
        end
        object edtFee: TEdit
          Left = 445
          Top = 125
          Width = 25
          Height = 22
          Hint = 
            'Fee adalah pendapatan atas penjualan barang contrabon, konsinyas' +
            'i, titipan'
          Ctl3D = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
        end
        object chkFee: TCheckBox
          Left = 508
          Top = 129
          Width = 110
          Height = 17
          Caption = 'Fee for All'
          TabOrder = 17
        end
        object cbpDeliverPO: TComboBox
          Left = 120
          Top = 104
          Width = 78
          Height = 24
          TabOrder = 5
        end
        object cbpPayment: TComboBox
          Left = 120
          Top = 32
          Width = 73
          Height = 24
          TabOrder = 2
          Text = 'cbpPayment'
        end
        object cbpMerchGroup: TComboBox
          Left = 120
          Top = 7
          Width = 127
          Height = 24
          Style = csDropDownList
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object cbbPpn: TComboBox
          Left = 521
          Top = 150
          Width = 103
          Height = 24
          BevelKind = bkSoft
          Style = csDropDownList
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 19
        end
        object edtDisc: TcxCurrencyEdit
          Left = 575
          Top = 54
          ParentFont = False
          TabOrder = 11
          Width = 46
        end
        object chkAllMer: TCheckBox
          Left = 524
          Top = 10
          Width = 110
          Height = 17
          Caption = 'All Category'
          Checked = True
          State = cbChecked
          TabOrder = 22
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 503
    Width = 656
    ExplicitTop = 503
    ExplicitWidth = 656
    inherited pnlFooter: TPanel
      Width = 656
      ExplicitWidth = 656
      inherited btnClose: TcxButton
        Left = 579
        Action = actCancel
        ExplicitLeft = 579
      end
      inherited btnSave: TcxButton
        Left = 486
        Action = actSave
        ExplicitLeft = 486
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 656
      ExplicitWidth = 656
      inherited lbCTRLEnter: TLabel
        Left = 481
        Height = 15
        ExplicitLeft = 481
      end
      inherited lbEscape: TLabel
        Left = 572
        Height = 15
        ExplicitLeft = 572
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 514
    Top = 258
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object actSupplier: TActionList
    Left = 507
    Top = 331
    object actUpdateBank: TAction
      Caption = 'actUpdateBank'
    end
  end
end
