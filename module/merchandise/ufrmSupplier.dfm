inherited frmSupplier: TfrmSupplier
  Left = 207
  Top = 94
  Caption = 'Supplier Master'
  ClientHeight = 486
  ClientWidth = 803
  OldCreateOrder = True
  ExplicitWidth = 819
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 803
    Height = 397
    ExplicitWidth = 803
    ExplicitHeight = 397
    inherited pgcBrowse: TcxPageControl
      Width = 781
      Height = 375
      Properties.HideTabs = False
      ExplicitWidth = 781
      ExplicitHeight = 375
      ClientRectBottom = 374
      ClientRectRight = 780
      ClientRectTop = 24
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 24
        ExplicitWidth = 779
        ExplicitHeight = 350
        inherited cxGrid: TcxGrid
          Width = 779
          Height = 350
          ExplicitWidth = 779
          ExplicitHeight = 350
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        ImageIndex = 1
        object bvl1: TBevel
          Left = 8
          Top = 218
          Width = 418
          Height = 10
          Shape = bsTopLine
        end
        object bvl2: TBevel
          Left = 8
          Top = 344
          Width = 419
          Height = 8
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 461
          Top = 266
          Width = 78
          Height = 16
          Caption = 'Extended Desc.'
        end
        object Label11: TLabel
          Left = 518
          Top = 105
          Width = 21
          Height = 16
          Caption = 'Disc'
        end
        object Label12: TLabel
          Left = 593
          Top = 103
          Width = 7
          Height = 16
          Caption = '%'
        end
        object Label2: TLabel
          Left = 239
          Top = 357
          Width = 6
          Height = 16
          Caption = '/'
        end
        object Label3: TLabel
          Left = 9
          Top = 357
          Width = 89
          Height = 16
          Caption = 'Date/User Modify'
        end
        object Label4: TLabel
          Left = 469
          Top = 247
          Width = 67
          Height = 16
          Caption = 'BKP/NON BKP'
        end
        object Label5: TLabel
          Left = 30
          Top = 35
          Width = 69
          Height = 16
          Caption = 'Supplier Name'
        end
        object Label6: TLabel
          Left = 38
          Top = 250
          Width = 62
          Height = 16
          Caption = 'Bank Branch'
        end
        object Label7: TLabel
          Left = 34
          Top = 274
          Width = 65
          Height = 16
          Caption = 'Bank Address'
        end
        object Label8: TLabel
          Left = 32
          Top = 196
          Width = 65
          Height = 16
          Caption = 'Alamat NPWP'
        end
        object lbEnCreateCN: TLabel
          Left = 664
          Top = 80
          Width = 87
          Height = 16
          Caption = 'Enable Create CN'
        end
        object lbl10: TLabel
          Left = 70
          Top = 172
          Width = 29
          Height = 16
          Caption = 'NPWP'
        end
        object lbl12: TLabel
          Left = 48
          Top = 226
          Width = 52
          Height = 16
          Caption = 'Bank Code'
        end
        object lbl13: TLabel
          Left = 40
          Top = 296
          Width = 61
          Height = 16
          Caption = 'Account No.'
        end
        object lbl14: TLabel
          Left = 29
          Top = 317
          Width = 71
          Height = 16
          Caption = 'Account Name'
        end
        object lbl15: TLabel
          Left = 451
          Top = 149
          Width = 89
          Height = 16
          Caption = 'AP Ending Balance'
          Visible = False
        end
        object lbl16: TLabel
          Left = 478
          Top = 172
          Width = 61
          Height = 16
          Caption = 'C/N Balance'
          Visible = False
        end
        object lbl17: TLabel
          Left = 9
          Top = 354
          Width = 91
          Height = 16
          Caption = 'Date/User Create'
        end
        object lbl18: TLabel
          Left = 296
          Top = 79
          Width = 49
          Height = 16
          Caption = 'Post Code'
        end
        object lbl19: TLabel
          Left = 309
          Top = 102
          Width = 38
          Height = 16
          Caption = 'Fax No.'
        end
        object lbl2: TLabel
          Left = 15
          Top = 12
          Width = 84
          Height = 16
          Caption = 'Suppl. Code/Tipe'
        end
        object lbl20: TLabel
          Left = 239
          Top = 354
          Width = 6
          Height = 16
          Caption = '/'
        end
        object lbl21: TLabel
          Left = 318
          Top = 126
          Width = 27
          Height = 16
          Caption = 'Tittle'
        end
        object lbl22: TLabel
          Left = 478
          Top = 125
          Width = 60
          Height = 16
          Caption = 'Credit Limit'
          Visible = False
        end
        object lbl23: TLabel
          Left = 456
          Top = 35
          Width = 81
          Height = 16
          Caption = 'Type of Payment'
        end
        object lbl24: TLabel
          Left = 455
          Top = 56
          Width = 82
          Height = 16
          Caption = 'Term of Payment'
        end
        object lbl25: TLabel
          Left = 489
          Top = 80
          Width = 50
          Height = 16
          Caption = 'Lead Time'
        end
        object lbl26: TLabel
          Left = 639
          Top = 103
          Width = 52
          Height = 16
          Caption = 'Deliver PO'
          Visible = False
        end
        object lbl27: TLabel
          Left = 578
          Top = 60
          Width = 24
          Height = 16
          Caption = 'Days'
        end
        object lbl28: TLabel
          Left = 578
          Top = 81
          Width = 24
          Height = 16
          Caption = 'Days'
        end
        object lbl3: TLabel
          Left = 27
          Top = 57
          Width = 72
          Height = 16
          Caption = 'Address / City'
        end
        object lbl30: TLabel
          Left = 583
          Top = 311
          Width = 82
          Height = 16
          Caption = '[Day of Proc PO]'
        end
        object lbl32: TLabel
          Left = 583
          Top = 337
          Width = 87
          Height = 16
          Caption = '[Outstanding PO]'
        end
        object lbl33: TLabel
          Left = 665
          Top = 56
          Width = 49
          Height = 16
          Caption = 'No. Of PO'
        end
        object lbl34: TLabel
          Left = 433
          Top = 197
          Width = 106
          Height = 16
          Caption = 'Last Pusch./Payment'
          Visible = False
        end
        object lbl35: TLabel
          Left = 643
          Top = 197
          Width = 6
          Height = 16
          Caption = '/'
          Visible = False
        end
        object lbl36: TLabel
          Left = 239
          Top = 149
          Width = 37
          Height = 16
          Caption = 'Tax No.'
          Visible = False
        end
        object lbl37: TLabel
          Left = 492
          Top = 12
          Width = 47
          Height = 16
          Caption = 'Category'
        end
        object lbl5: TLabel
          Left = 52
          Top = 80
          Width = 45
          Height = 16
          Caption = 'Phone No'
        end
        object lbl6: TLabel
          Left = 20
          Top = 102
          Width = 77
          Height = 16
          Caption = 'Contact Person'
        end
        object lbl7: TLabel
          Left = 33
          Top = 126
          Width = 65
          Height = 16
          Caption = 'Supplier Type'
        end
        object lbl8: TLabel
          Left = 32
          Top = 152
          Width = 67
          Height = 16
          Caption = 'PKP/NON PKP'
        end
        object lbl9: TLabel
          Left = 432
          Top = 220
          Width = 107
          Height = 16
          Caption = 'Outstanding Payment'
          Visible = False
        end
        object cbpMerchanGroup: TComboBox
          Tag = 1
          Left = 545
          Top = 8
          Width = 125
          Height = 24
          BevelKind = bkFlat
          Style = csDropDownList
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object chkEnableCN: TCheckBox
          Tag = 1
          Left = 754
          Top = 80
          Width = 25
          Height = 17
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object chkSupIsActive: TCheckBox
          Left = 462
          Top = 292
          Width = 65
          Height = 17
          Caption = 'Active'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dtLastPurchase: TcxDateEdit
          Tag = 1
          Left = 545
          Top = 194
          TabStop = False
          TabOrder = 3
          Visible = False
          Width = 94
        end
        object dtUserCreate: TcxDateEdit
          Left = 103
          Top = 349
          TabOrder = 4
          Width = 126
        end
        object dtUserModify: TcxDateEdit
          Left = 111
          Top = 349
          TabOrder = 5
          Width = 126
        end
        object edtAddr: TEdit
          Left = 103
          Top = 55
          Width = 249
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 6
        end
        object edtAPEndingBlnc: TcxCurrencyEdit
          Tag = 1
          Left = 545
          Top = 148
          TabStop = False
          TabOrder = 7
          Visible = False
          Width = 136
        end
        object edtBankAccName: TEdit
          Left = 103
          Top = 317
          Width = 322
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object edtBankAccNo: TEdit
          Left = 103
          Top = 294
          Width = 322
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 9
        end
        object edtBankAddrss: TEdit
          Left = 103
          Top = 271
          Width = 322
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 10
        end
        object edtBankBranch: TEdit
          Left = 103
          Top = 247
          Width = 322
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 11
        end
        object edtBankCode: TEdit
          Left = 103
          Top = 223
          Width = 50
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 12
        end
        object edtBankName: TEdit
          Left = 154
          Top = 223
          Width = 272
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 13
        end
        object edtBKP: TEdit
          Tag = 1
          Left = 545
          Top = 242
          Width = 97
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 14
        end
        object edtCity: TEdit
          Left = 354
          Top = 55
          Width = 72
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 15
        end
        object edtCNBalance: TcxCurrencyEdit
          Tag = 1
          Left = 545
          Top = 171
          TabStop = False
          TabOrder = 16
          Visible = False
          Width = 136
        end
        object edtContactPerson: TEdit
          Left = 103
          Top = 101
          Width = 155
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 17
        end
        object edtCreditLimt: TcxCurrencyEdit
          Tag = 1
          Left = 545
          Top = 125
          TabStop = False
          TabOrder = 18
          Visible = False
          Width = 136
        end
        object edtDayOfPO: TEdit
          Tag = 1
          Left = 666
          Top = 306
          Width = 113
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 19
        end
        object edtDeliverPO: TEdit
          Tag = 1
          Left = 698
          Top = 101
          Width = 80
          Height = 22
          TabStop = False
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 20
          Visible = False
        end
        object edtDisc: TcxCurrencyEdit
          Left = 545
          Top = 102
          ParentFont = False
          TabOrder = 21
          Width = 46
        end
        object edtExtendDescr: TEdit
          Tag = 1
          Left = 541
          Top = 265
          Width = 238
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 22
        end
        object edtFaxNo: TEdit
          Left = 354
          Top = 101
          Width = 72
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 23
        end
        object edtJenisPeruhaan: TEdit
          Left = 193
          Top = 9
          Width = 64
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 24
        end
        object edtKodeSupplier: TcxButtonEdit
          Left = 103
          Top = 9
          Properties.Buttons = <
            item
            end>
          TabOrder = 25
          Text = '0'
          Width = 88
        end
        object edtLastPayment: TcxCurrencyEdit
          Tag = 1
          Left = 649
          Top = 194
          TabStop = False
          TabOrder = 26
          Visible = False
          Width = 130
        end
        object edtLeadTime: TEdit
          Tag = 1
          Left = 545
          Top = 79
          Width = 25
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 27
        end
        object edtMerchGroupName: TEdit
          Tag = 1
          Left = 672
          Top = 9
          Width = 106
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
          TabOrder = 28
        end
        object edtNoOfPO: TEdit
          Tag = 1
          Left = 720
          Top = 56
          Width = 58
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 29
        end
        object edtNPWP: TEdit
          Left = 103
          Top = 170
          Width = 323
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 30
        end
        object edtNpwpAlamat: TEdit
          Left = 103
          Top = 194
          Width = 323
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 31
        end
        object edtOutstandingpayment: TcxCurrencyEdit
          Tag = 1
          Left = 545
          Top = 219
          TabStop = False
          TabOrder = 32
          Visible = False
          Width = 136
        end
        object edtPhone: TEdit
          Left = 103
          Top = 78
          Width = 155
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 33
        end
        object edtPKP: TEdit
          Left = 103
          Top = 147
          Width = 106
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 34
        end
        object edtPostcode: TEdit
          Left = 354
          Top = 78
          Width = 72
          Height = 22
          BiDiMode = bdLeftToRight
          Ctl3D = False
          ParentBiDiMode = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 35
        end
        object edtSuplierTipe: TEdit
          Left = 103
          Top = 124
          Width = 155
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 36
        end
        object edtSupName: TEdit
          Left = 103
          Top = 32
          Width = 323
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
          TabOrder = 37
        end
        object edtTaxNo: TEdit
          Left = 285
          Top = 147
          Width = 141
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 38
          Visible = False
        end
        object edtTermPayment: TEdit
          Tag = 1
          Left = 545
          Top = 56
          Width = 25
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 39
        end
        object edtTittle: TEdit
          Left = 354
          Top = 124
          Width = 72
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 40
        end
        object edtTypePaymnt: TEdit
          Tag = 1
          Left = 545
          Top = 33
          Width = 232
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 41
        end
        object edtUserCreate: TEdit
          Left = 228
          Top = 349
          Width = 198
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 42
          Text = 'Ning P'
        end
        object edtUserModify: TEdit
          Left = 228
          Top = 351
          Width = 198
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 43
          Text = 'Ning P'
        end
        object lbl31: TcxLabel
          Left = 546
          Top = 337
          Cursor = crHandPoint
          Caption = 'Ctrl-P'
          ParentFont = False
          Transparent = True
        end
        object lblDayOfPO: TcxLabel
          Left = 546
          Top = 311
          Cursor = crHandPoint
          Caption = 'Ctrl-D'
          ParentFont = False
          Transparent = True
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 803
    ExplicitWidth = 803
    inherited lblHeader: TLabel
      Width = 99
      Caption = 'SUPPLIER MASTER'
      ExplicitWidth = 99
    end
    inherited lblFilterData: TcxLabel
      Left = 449
      ExplicitLeft = 449
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 510
      ExplicitLeft = 510
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 626
      ExplicitLeft = 626
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 721
      ExplicitLeft = 721
    end
    inherited lblsdFilter: TcxLabel
      Left = 602
      ExplicitLeft = 602
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 430
    Width = 803
    ExplicitTop = 430
    ExplicitWidth = 803
    inherited pnlFooter: TPanel
      Width = 803
      ExplicitWidth = 803
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 726
        Action = actClose
        ExplicitLeft = 726
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 803
      ExplicitWidth = 803
      inherited lbEscape: TLabel
        Left = 729
        Height = 17
        ExplicitLeft = 729
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 286
    Top = 47
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
