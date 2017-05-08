inherited frmDialogSupplier: TfrmDialogSupplier
  Left = 414
  Top = 98
  Caption = 'frmDialogSupplier'
  ClientHeight = 511
  ClientWidth = 671
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitTop = -110
  ExplicitWidth = 687
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 671
    Height = 455
    ExplicitWidth = 671
    ExplicitHeight = 455
    object pc1: TcxPageControl
      Left = 2
      Top = 2
      Width = 667
      Height = 451
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = tsMerchandiseGroup
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 451
      ClientRectRight = 667
      ClientRectTop = 27
      object tsSupplier: TcxTabSheet
        Caption = '&Supplier'
        object lbl3: TLabel
          Left = 65
          Top = 58
          Width = 39
          Height = 16
          Alignment = taRightJustify
          Caption = 'Address'
        end
        object lbl4: TLabel
          Left = 83
          Top = 80
          Width = 21
          Height = 16
          Alignment = taRightJustify
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
          Left = 59
          Top = 105
          Width = 45
          Height = 16
          Alignment = taRightJustify
          Caption = 'Phone No'
        end
        object lbl6: TLabel
          Left = 27
          Top = 127
          Width = 77
          Height = 16
          Alignment = taRightJustify
          Caption = 'Contact Person'
        end
        object lbl7: TLabel
          Left = 39
          Top = 152
          Width = 65
          Height = 16
          Alignment = taRightJustify
          Caption = 'Supplier Type'
        end
        object lbl8: TLabel
          Left = 37
          Top = 178
          Width = 67
          Height = 16
          Alignment = taRightJustify
          Caption = 'PKP/NON PKP'
        end
        object lbl10: TLabel
          Left = 75
          Top = 202
          Width = 29
          Height = 16
          Alignment = taRightJustify
          Caption = 'NPWP'
        end
        object lbl12: TLabel
          Left = 80
          Top = 250
          Width = 24
          Height = 16
          Alignment = taRightJustify
          Caption = 'Bank'
        end
        object lbl13: TLabel
          Left = 43
          Top = 322
          Width = 61
          Height = 16
          Alignment = taRightJustify
          Caption = 'Account No.'
        end
        object lbl14: TLabel
          Left = 33
          Top = 345
          Width = 71
          Height = 16
          Alignment = taRightJustify
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
          Left = 35
          Top = 35
          Width = 69
          Height = 16
          Alignment = taRightJustify
          Caption = 'Supplier Name'
        end
        object Label4: TLabel
          Left = 47
          Top = 11
          Width = 57
          Height = 16
          Alignment = taRightJustify
          Caption = 'Suppl. Code'
        end
        object Label6: TLabel
          Left = 48
          Top = 369
          Width = 56
          Height = 16
          Alignment = taRightJustify
          Caption = 'Supp Group'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object Lbl2: TLabel
          Left = 69
          Top = 274
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = 'Branch'
        end
        object Label9: TLabel
          Left = 65
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
          Alignment = taRightJustify
          Caption = 'Alamat NPWP'
        end
        object Label14: TLabel
          Left = 185
          Top = 11
          Width = 87
          Height = 16
          Caption = 'Tipe Perushahaan'
        end
        object edtSupName: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 31
          HelpType = htKeyword
          HelpKeyword = 'Supplier Name'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          Width = 298
        end
        object edtAddress: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 55
          TabOrder = 3
          Text = '---'
          Width = 298
        end
        object edtCity: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 79
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          Width = 95
        end
        object edtPostCode: TcxTextEdit
          Tag = 1
          Left = 304
          Top = 79
          TabOrder = 5
          OnKeyPress = edtPostCodeKeyPress
          Width = 106
        end
        object edtFax: TcxTextEdit
          Left = 304
          Top = 102
          TabOrder = 7
          Width = 106
        end
        object edtPhone: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 103
          TabOrder = 6
          Width = 95
        end
        object edtContactP: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 127
          TabOrder = 8
          Width = 187
        end
        object edtAccountName: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 341
          TabOrder = 19
          Width = 211
        end
        object edtAccountNo: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 317
          TabOrder = 18
          Width = 132
        end
        object cbbPKP: TComboBox
          Left = 111
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
        object edtTaxNo: TcxTextEdit
          Left = 306
          Top = 175
          TabOrder = 12
          Visible = False
          Width = 104
        end
        object edtTitle: TcxTextEdit
          Left = 344
          Top = 125
          TabOrder = 9
          Width = 66
        end
        object medtNPWP: TMaskEdit
          Left = 111
          Top = 199
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
        object edtCabangBank: TcxTextEdit
          Left = 111
          Top = 269
          Properties.ReadOnly = True
          TabOrder = 16
          Width = 297
        end
        object edtAlamatBank: TcxTextEdit
          Left = 111
          Top = 293
          Properties.ReadOnly = True
          TabOrder = 17
          Width = 297
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
        object edtNPWPAlamat: TcxTextEdit
          Left = 111
          Top = 222
          TabOrder = 14
          Width = 298
        end
        object cxLookUpBank: TcxExtLookupComboBox
          Tag = 1
          Left = 111
          Top = 246
          Properties.OnEditValueChanged = cxLookUpBankPropertiesEditValueChanged
          TabOrder = 15
          Width = 299
        end
        object cxLookupTipePerush: TcxExtLookupComboBox
          Tag = 1
          Left = 278
          Top = 8
          TabOrder = 1
          Width = 132
        end
        object cxLookUpSuppGroup: TcxExtLookupComboBox
          Tag = 1
          Left = 111
          Top = 365
          TabOrder = 20
          Width = 299
        end
        object cxLookUpSupType: TcxExtLookupComboBox
          Tag = 1
          Left = 111
          Top = 150
          TabOrder = 10
          Width = 299
        end
        object edtSupCode: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 8
          HelpType = htKeyword
          HelpKeyword = 'Supplier Name'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 68
        end
      end
      object tsMerchandiseGroup: TcxTabSheet
        Caption = '&Category'
        object gbSupplierGrid: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 151
          Width = 667
          object pnlGridSupplierBtn: TcxGroupBox
            Left = 2
            Top = 122
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 0
            Height = 27
            Width = 663
            object lbSuppShortCut1: TLabel
              AlignWithMargins = True
              Left = 409
              Top = 6
              Width = 249
              Height = 18
              Margins.Top = 4
              Margins.Bottom = 1
              Align = alRight
              Caption = 'ALT-T [Tambah]  | ALT-U [Update]  |  ALT-D [Delete]'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 16
            end
            object btnDelSupp: TcxButton
              AlignWithMargins = True
              Left = 168
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Delete'
              OptionsImage.ImageIndex = 8
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnDelSuppClick
            end
            object btnAddSupp: TcxButton
              AlignWithMargins = True
              Left = 2
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Tambah'
              LookAndFeel.Kind = lfUltraFlat
              OptionsImage.ImageIndex = 0
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnAddSuppClick
            end
            object btnUpdateSupp: TcxButton
              AlignWithMargins = True
              Left = 85
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Update'
              OptionsImage.ImageIndex = 13
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 2
              Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              ExplicitTop = 3
            end
          end
          object cxGridSupplier: TcxGrid
            Left = 2
            Top = 2
            Width = 663
            Height = 120
            Align = alClient
            TabOrder = 1
            TabStop = False
            object cxGrdDBSupplierMerchan: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnFocusedRecordChanged = cxGrdDBSupplierMerchanFocusedRecordChanged
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.ApplyChanges = fracImmediately
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.GroupByBox = False
              object clSupMerchanGroup: TcxGridDBColumn
                Caption = 'MERCHANDISE'
                DataBinding.FieldName = 'MERCHANDISE_GRUP'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Width = 129
              end
              object clTipePembayaran: TcxGridDBColumn
                Caption = 'TIPE PEMBAYARAN'
                DataBinding.FieldName = 'TIPE_PEMBAYARAN'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Width = 156
              end
            end
            object cxGridSupplierLevel1: TcxGridLevel
              GridView = cxGrdDBSupplierMerchan
            end
          end
        end
        object pgcMerchan: TcxPageControl
          Left = 0
          Top = 151
          Width = 667
          Height = 273
          Align = alBottom
          TabOrder = 1
          Properties.ActivePage = tsA
          Properties.CustomButtons.Buttons = <>
          OnExit = pgcMerchanExit
          ClientRectBottom = 273
          ClientRectRight = 667
          ClientRectTop = 27
          object tsMG: TcxTabSheet
            Caption = 'M&erchandise Group'
            ImageIndex = 0
            object lblPPN: TLabel
              Left = 435
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
              Left = 607
              Top = 55
              Width = 7
              Height = 16
              Caption = '%'
            end
            object Label2: TLabel
              Left = 424
              Top = 127
              Width = 18
              Height = 16
              Caption = 'Fee'
            end
            object Label3: TLabel
              Left = 472
              Top = 127
              Width = 7
              Height = 16
              Caption = '%'
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
            object lbl22: TLabel
              Left = 54
              Top = 129
              Width = 60
              Height = 16
              Caption = 'Credit Limit'
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
            object lbl27: TLabel
              Left = 146
              Top = 62
              Width = 24
              Height = 16
              Caption = 'Days'
            end
            object lbl28: TLabel
              Left = 146
              Top = 83
              Width = 24
              Height = 16
              Caption = 'Days'
            end
            object lbl29: TLabel
              Left = 37
              Top = 153
              Width = 78
              Height = 16
              Caption = 'Extended Desc.'
            end
            object lbl33: TLabel
              Left = 329
              Top = 127
              Width = 49
              Height = 16
              Caption = 'No. Of PO'
            end
            object lbl34: TLabel
              Left = 273
              Top = 83
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
            object lbl37: TLabel
              Left = 66
              Top = 10
              Width = 47
              Height = 16
              Caption = 'Category'
            end
            object lbl45: TLabel
              Left = 39
              Top = 187
              Width = 74
              Height = 16
              Caption = 'Day of Proc PO'
            end
            object lbl9: TLabel
              Left = 272
              Top = 103
              Width = 107
              Height = 16
              Caption = 'Outstanding Payment'
            end
            object chkAllMer: TCheckBox
              Left = 526
              Top = 12
              Width = 110
              Height = 17
              Caption = 'All Category'
              Checked = True
              State = cbChecked
              TabOrder = 17
              Visible = False
            end
            object chkEnableCN: TCheckBox
              Left = 526
              Top = 35
              Width = 110
              Height = 17
              Caption = 'Enable Create CN'
              Checked = True
              State = cbChecked
              TabOrder = 18
            end
            object chkFee: TCheckBox
              Left = 502
              Top = 128
              Width = 85
              Height = 17
              Caption = 'Fee for All'
              TabOrder = 15
            end
            object curedtAPEndB: TcxCurrencyEdit
              Left = 385
              Top = 31
              TabStop = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0.00;(0.00)'
              Properties.ReadOnly = True
              TabOrder = 7
              Width = 135
            end
            object curedtCNBln: TcxCurrencyEdit
              Left = 385
              Top = 54
              TabStop = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0;(,0)'
              Properties.ReadOnly = True
              TabOrder = 8
              Width = 135
            end
            object curedtCreditLmt: TcxCurrencyEdit
              Left = 120
              Top = 128
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0;(,0)'
              TabOrder = 5
              Width = 135
            end
            object curedtOutsdPaymnt: TcxCurrencyEdit
              Left = 385
              Top = 102
              TabStop = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0;(,0)'
              Properties.ReadOnly = True
              TabOrder = 12
              Width = 136
            end
            object curedtPaymnt: TcxCurrencyEdit
              Left = 486
              Top = 77
              TabStop = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0;(,0)'
              Properties.ReadOnly = True
              TabOrder = 11
              Width = 131
            end
            object dtLastPurchs: TcxDateEdit
              Left = 385
              Top = 77
              TabStop = False
              Properties.ReadOnly = True
              TabOrder = 10
              Width = 95
            end
            object edtDisc: TcxCurrencyEdit
              Left = 574
              Top = 54
              TabStop = False
              ParentFont = False
              Properties.DisplayFormat = '0.00;(0.00)'
              Properties.ReadOnly = True
              TabOrder = 9
              Width = 46
            end
            object edtExtdDesc: TcxTextEdit
              Left = 120
              Top = 152
              TabOrder = 6
              Width = 176
            end
            object edtFee: TcxTextEdit
              Left = 445
              Top = 125
              Hint = 
                'Fee adalah pendapatan atas penjualan barang contrabon, konsinyas' +
                'i, titipan'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
              Width = 25
            end
            object edtLeadTime: TcxTextEdit
              Left = 120
              Top = 81
              TabOrder = 3
              Width = 24
            end
            object edtNoOfPO: TcxTextEdit
              Left = 385
              Top = 125
              TabStop = False
              Properties.ReadOnly = True
              TabOrder = 13
              Width = 25
            end
            object edtTermOP: TcxTextEdit
              Left = 120
              Top = 58
              TabOrder = 2
              Width = 24
            end
            object grp: TGroupBox
              Left = 121
              Top = 178
              Width = 496
              Height = 34
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
            object cxLookupMerchGroup: TcxExtLookupComboBox
              Tag = 1
              Left = 120
              Top = 5
              HelpType = htKeyword
              HelpKeyword = 'Kategori'
              Properties.ImmediatePost = True
              TabOrder = 0
              Width = 400
            end
            object cxLookupPaymentType: TcxExtLookupComboBox
              Tag = 1
              Left = 120
              Top = 32
              TabOrder = 1
              Width = 166
            end
            object cxLookupPODeliver: TcxExtLookupComboBox
              Tag = 2
              Left = 120
              Top = 105
              TabOrder = 4
              Width = 123
            end
            object chkPKP: TCheckBox
              Left = 385
              Top = 154
              Width = 44
              Height = 17
              Caption = 'PKP'
              Checked = True
              State = cbChecked
              TabOrder = 16
              OnClick = chkPKPClick
            end
            object cxLookupPPN: TcxExtLookupComboBox
              Left = 460
              Top = 151
              TabOrder = 19
              Width = 123
            end
          end
          object tsA: TcxTabSheet
            Caption = '&Addreses'
            ImageIndex = 1
            object pnl1: TPanel
              Left = 0
              Top = 0
              Width = 667
              Height = 246
              Align = alClient
              Color = clWhite
              TabOrder = 0
              object lbl30: TLabel
                Left = 52
                Top = 28
                Width = 39
                Height = 16
                Caption = 'Address'
              end
              object lbl31: TLabel
                Left = 69
                Top = 51
                Width = 21
                Height = 16
                Caption = 'City'
              end
              object lbl32: TLabel
                Left = 202
                Top = 50
                Width = 49
                Height = 16
                Caption = 'Post Code'
              end
              object lbl38: TLabel
                Left = 215
                Top = 73
                Width = 38
                Height = 16
                Caption = 'Fax No.'
              end
              object lbl39: TLabel
                Left = 44
                Top = 74
                Width = 45
                Height = 16
                Caption = 'Phone No'
              end
              object lbl40: TLabel
                Left = 12
                Top = 98
                Width = 77
                Height = 16
                Caption = 'Contact Person'
              end
              object lbl41: TLabel
                Left = 290
                Top = 96
                Width = 27
                Height = 16
                Caption = 'Tittle'
              end
              object lbl42: TLabel
                Left = 65
                Top = 121
                Width = 24
                Height = 16
                Caption = 'Bank'
              end
              object lbl43: TLabel
                Left = 33
                Top = 216
                Width = 61
                Height = 16
                Caption = 'Account No.'
              end
              object lbl44: TLabel
                Left = 20
                Top = 192
                Width = 71
                Height = 16
                Caption = 'Account Name'
              end
              object Label7: TLabel
                Left = 27
                Top = 145
                Width = 62
                Height = 16
                Caption = 'Bank Branch'
              end
              object Label8: TLabel
                Left = 22
                Top = 169
                Width = 65
                Height = 16
                Caption = 'Bank Address'
              end
              object edtAddrMer: TcxTextEdit
                Left = 96
                Top = 26
                Enabled = False
                TabOrder = 1
                Text = '---'
                Width = 343
              end
              object edtCityMer: TcxTextEdit
                Left = 96
                Top = 49
                Enabled = False
                TabOrder = 2
                Width = 95
              end
              object edtPostCodeMer: TcxTextEdit
                Left = 258
                Top = 49
                Enabled = False
                TabOrder = 3
                OnKeyPress = edtPostCodeMerKeyPress
                Width = 79
              end
              object edtFaxMer: TcxTextEdit
                Left = 258
                Top = 72
                Enabled = False
                TabOrder = 5
                Width = 79
              end
              object edtPhoneMer: TcxTextEdit
                Left = 96
                Top = 72
                Enabled = False
                TabOrder = 4
                Width = 95
              end
              object edtContactMer: TcxTextEdit
                Left = 96
                Top = 95
                Enabled = False
                TabOrder = 6
                Width = 187
              end
              object edtTitleMer: TcxTextEdit
                Left = 320
                Top = 95
                Enabled = False
                TabOrder = 7
                Width = 80
              end
              object edtAccountNameMer: TcxTextEdit
                Left = 96
                Top = 190
                Enabled = False
                TabOrder = 11
                Width = 279
              end
              object edtAccountNoMer: TcxTextEdit
                Left = 96
                Top = 213
                Enabled = False
                TabOrder = 12
                Width = 211
              end
              object chkIsDif: TCheckBox
                Left = 96
                Top = 6
                Width = 153
                Height = 17
                Caption = 'Make Different Contact'
                TabOrder = 0
                OnClick = chkIsDifClick
              end
              object edtCabangBankMer: TcxTextEdit
                Left = 96
                Top = 142
                Enabled = False
                Properties.ReadOnly = True
                TabOrder = 9
                Width = 312
              end
              object edtAlamatBankMer: TcxTextEdit
                Left = 96
                Top = 166
                Enabled = False
                Properties.ReadOnly = True
                TabOrder = 10
                Width = 312
              end
              object cxLookUpBankMer: TcxExtLookupComboBox
                Left = 96
                Top = 118
                Enabled = False
                Properties.OnEditValueChanged = cxLookUpBankMerPropertiesEditValueChanged
                TabOrder = 8
                Width = 312
              end
            end
          end
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 455
    Width = 671
    ExplicitTop = 455
    ExplicitWidth = 671
    inherited pnlFooter: TPanel
      Width = 671
      ExplicitWidth = 671
      inherited btnClose: TcxButton
        Left = 594
        Action = actCancel
        ExplicitLeft = 594
      end
      inherited btnSave: TcxButton
        Left = 501
        Action = actSave
        ExplicitLeft = 501
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 424
        ExplicitLeft = 424
      end
    end
    inherited pnlSortCut: TPanel
      Width = 671
      ExplicitWidth = 671
      inherited lbCTRLEnter: TLabel
        Left = 496
        Height = 15
        ExplicitLeft = 496
      end
      inherited lbEscape: TLabel
        Left = 587
        Height = 15
        ExplicitLeft = 587
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 420
        Height = 15
        ExplicitLeft = 420
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 441
    Top = 46
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object actSupplier: TActionList
    Left = 446
    Top = 97
    object actUpdateBank: TAction
      Caption = 'actUpdateBank'
    end
  end
end
