inherited frmDialogSupplier: TfrmDialogSupplier
  Left = 414
  Top = 98
  Caption = 'frmDialogSupplier'
  ClientHeight = 511
  ClientWidth = 671
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitTop = -125
  ExplicitWidth = 687
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 29
    Top = 167
    Width = 77
    Height = 16
    Alignment = taRightJustify
    Caption = 'Contact Person'
  end
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
      OnChange = pc1Change
      ClientRectBottom = 451
      ClientRectRight = 667
      ClientRectTop = 27
      object tsSupplier: TcxTabSheet
        Caption = '&Supplier'
        object lbl3: TLabel
          Left = 65
          Top = 48
          Width = 39
          Height = 16
          Alignment = taRightJustify
          Caption = 'Address'
        end
        object lbl4: TLabel
          Left = 83
          Top = 73
          Width = 21
          Height = 16
          Alignment = taRightJustify
          Caption = 'City'
        end
        object lbl18: TLabel
          Left = 308
          Top = 73
          Width = 49
          Height = 16
          Caption = 'Post Code'
        end
        object lbl19: TLabel
          Left = 318
          Top = 98
          Width = 38
          Height = 16
          Caption = 'Fax No.'
        end
        object lbl5: TLabel
          Left = 59
          Top = 98
          Width = 45
          Height = 16
          Alignment = taRightJustify
          Caption = 'Phone No'
        end
        object lbl6: TLabel
          Left = 27
          Top = 123
          Width = 77
          Height = 16
          Alignment = taRightJustify
          Caption = 'Contact Person'
        end
        object lbl7: TLabel
          Left = 39
          Top = 173
          Width = 65
          Height = 16
          Alignment = taRightJustify
          Caption = 'Supplier Type'
        end
        object lbl8: TLabel
          Left = 37
          Top = 199
          Width = 67
          Height = 16
          Alignment = taRightJustify
          Caption = 'PKP/NON PKP'
        end
        object lbl10: TLabel
          Left = 75
          Top = 226
          Width = 29
          Height = 16
          Alignment = taRightJustify
          Caption = 'NPWP'
        end
        object lbl12: TLabel
          Left = 80
          Top = 278
          Width = 24
          Height = 16
          Alignment = taRightJustify
          Caption = 'Bank'
        end
        object lbl13: TLabel
          Left = 43
          Top = 354
          Width = 61
          Height = 16
          Alignment = taRightJustify
          Caption = 'Account No.'
        end
        object lbl14: TLabel
          Left = 272
          Top = 354
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
          Left = 320
          Top = 199
          Width = 37
          Height = 16
          Caption = 'Tax No.'
          Visible = False
        end
        object lbl21: TLabel
          Left = 330
          Top = 123
          Width = 27
          Height = 16
          Caption = 'Tittle'
        end
        object Label5: TLabel
          Left = 35
          Top = 25
          Width = 69
          Height = 16
          Alignment = taRightJustify
          Caption = 'Supplier Name'
        end
        object Label4: TLabel
          Left = 47
          Top = 3
          Width = 57
          Height = 16
          Alignment = taRightJustify
          Caption = 'Suppl. Code'
        end
        object Label6: TLabel
          Left = 48
          Top = 378
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
          Top = 303
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = 'Branch'
        end
        object Label9: TLabel
          Left = 65
          Top = 328
          Width = 39
          Height = 16
          Alignment = taRightJustify
          Caption = 'Address'
        end
        object Label13: TLabel
          Left = 39
          Top = 253
          Width = 65
          Height = 16
          Alignment = taRightJustify
          Caption = 'Alamat NPWP'
        end
        object Label14: TLabel
          Left = 258
          Top = 3
          Width = 87
          Height = 16
          Caption = 'Tipe Perushahaan'
        end
        object Label10: TLabel
          Left = 80
          Top = 148
          Width = 25
          Height = 16
          Alignment = taRightJustify
          Caption = 'Email'
        end
        object edtSupName: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 23
          HelpType = htKeyword
          HelpKeyword = 'Supplier Name'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          Width = 398
        end
        object edtAddress: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 45
          TabOrder = 3
          Text = '---'
          Width = 398
        end
        object edtCity: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 70
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          Width = 141
        end
        object edtPostCode: TcxTextEdit
          Tag = 1
          Left = 368
          Top = 70
          TabOrder = 5
          OnKeyPress = edtPostCodeKeyPress
          Width = 141
        end
        object edtFax: TcxTextEdit
          Left = 368
          Top = 95
          TabOrder = 7
          Width = 141
        end
        object edtPhone: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 95
          TabOrder = 6
          Width = 141
        end
        object edtContactP: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 120
          TabOrder = 8
          Width = 187
        end
        object edtAccountName: TcxTextEdit
          Tag = 1
          Left = 351
          Top = 351
          TabOrder = 19
          Width = 158
        end
        object edtAccountNo: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 351
          TabOrder = 18
          Width = 141
        end
        object cbbPKP: TComboBox
          Left = 112
          Top = 196
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
          Left = 368
          Top = 196
          TabOrder = 12
          Visible = False
          Width = 141
        end
        object edtTitle: TcxTextEdit
          Left = 368
          Top = 120
          TabOrder = 9
          Width = 141
        end
        object medtNPWP: TMaskEdit
          Left = 112
          Top = 225
          Width = 141
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
          Top = 300
          Properties.ReadOnly = True
          TabOrder = 16
          Width = 398
        end
        object edtAlamatBank: TcxTextEdit
          Left = 111
          Top = 325
          Properties.ReadOnly = True
          TabOrder = 17
          Width = 398
        end
        object chkSupActive: TCheckBox
          Left = 112
          Top = 400
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
          Top = 250
          TabOrder = 14
          Width = 398
        end
        object cxLookUpBank: TcxExtLookupComboBox
          Tag = 1
          Left = 111
          Top = 275
          Properties.OnEditValueChanged = cxLookUpBankPropertiesEditValueChanged
          TabOrder = 15
          Width = 398
        end
        object cxLookupTipePerush: TcxExtLookupComboBox
          Tag = 1
          Left = 351
          Top = 0
          TabOrder = 1
          Width = 158
        end
        object cxLookUpSuppGroup: TcxExtLookupComboBox
          Tag = 1
          Left = 111
          Top = 375
          TabOrder = 20
          Width = 398
        end
        object cxLookUpSupType: TcxExtLookupComboBox
          Tag = 1
          Left = 111
          Top = 170
          TabOrder = 10
          Width = 398
        end
        object edtSupCode: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 0
          HelpType = htKeyword
          HelpKeyword = 'Supplier Name'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 141
        end
        object chkIsSOBlacklist: TCheckBox
          Left = 194
          Top = 400
          Width = 98
          Height = 17
          Caption = 'Is SO Blacklist'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
        end
        object edtEmail: TcxTextEdit
          Tag = 1
          Left = 111
          Top = 145
          TabOrder = 23
          Width = 398
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
            object btnDelSupp: TcxButton
              AlignWithMargins = True
              Left = 334
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
              Left = 168
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
              OnClick = btnUpdateSuppClick
            end
            object btnCancelSupp: TcxButton
              AlignWithMargins = True
              Left = 251
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Cancel'
              OptionsImage.ImageIndex = 23
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 3
              Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnCancelSuppClick
            end
            object btnEditSupp: TcxButton
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
              Caption = '&Edit'
              OptionsImage.ImageIndex = 10
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnEditSuppClick
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
              PopupMenu = PopupMenu1
              Navigator.Buttons.CustomButtons = <>
              OnCellClick = cxGrdDBSupplierMerchanCellClick
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
          Properties.ActivePage = tsMG
          Properties.CustomButtons.Buttons = <>
          OnExit = pgcMerchanExit
          ClientRectBottom = 273
          ClientRectRight = 667
          ClientRectTop = 27
          object tsMG: TcxTabSheet
            Caption = 'M&erchandise Group'
            ImageIndex = 0
            object pnlMG: TPanel
              Left = 0
              Top = 0
              Width = 667
              Height = 246
              Align = alClient
              TabOrder = 0
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
              object lblPPN: TLabel
                Left = 435
                Top = 155
                Width = 19
                Height = 16
                Caption = 'PPN'
              end
              object chkAllMer: TCheckBox
                Left = 526
                Top = 12
                Width = 110
                Height = 17
                Caption = 'All Category'
                Checked = True
                State = cbChecked
                TabOrder = 18
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
                TabOrder = 19
              end
              object chkFee: TCheckBox
                Left = 499
                Top = 128
                Width = 85
                Height = 17
                Caption = 'Fee for All'
                TabOrder = 15
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
              object cxLookupPPN: TcxExtLookupComboBox
                Left = 460
                Top = 151
                TabOrder = 17
                Width = 123
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
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object chkTue: TCheckBox
                  Left = 71
                  Top = 12
                  Width = 64
                  Height = 17
                  Caption = 'Tuesday'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
                object chkWed: TCheckBox
                  Left = 138
                  Top = 12
                  Width = 78
                  Height = 17
                  Caption = 'Wednesday'
                  Checked = True
                  State = cbChecked
                  TabOrder = 2
                end
                object chkThu: TCheckBox
                  Left = 222
                  Top = 12
                  Width = 67
                  Height = 17
                  Caption = 'Thursday'
                  Checked = True
                  State = cbChecked
                  TabOrder = 3
                end
                object chkFri: TCheckBox
                  Left = 295
                  Top = 12
                  Width = 61
                  Height = 17
                  Caption = 'Friday'
                  Checked = True
                  State = cbChecked
                  TabOrder = 4
                end
                object chkSat: TCheckBox
                  Left = 352
                  Top = 12
                  Width = 67
                  Height = 17
                  Caption = 'Saturday'
                  Checked = True
                  State = cbChecked
                  TabOrder = 5
                end
                object chkSun: TCheckBox
                  Left = 422
                  Top = 12
                  Width = 61
                  Height = 17
                  Caption = 'Sunday'
                  Checked = True
                  State = cbChecked
                  TabOrder = 6
                end
              end
            end
          end
          object tsA: TcxTabSheet
            Caption = '&Addreses'
            ImageIndex = 1
            object pnlAddress: TPanel
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
                Top = 56
                Width = 21
                Height = 16
                Caption = 'City'
              end
              object lbl32: TLabel
                Left = 196
                Top = 57
                Width = 49
                Height = 16
                Caption = 'Post Code'
              end
              object lbl38: TLabel
                Left = 514
                Top = 56
                Width = 38
                Height = 16
                Caption = 'Fax No.'
              end
              object lbl39: TLabel
                Left = 357
                Top = 58
                Width = 45
                Height = 16
                Caption = 'Phone No'
              end
              object lbl40: TLabel
                Left = 12
                Top = 85
                Width = 77
                Height = 16
                Caption = 'Contact Person'
              end
              object lbl41: TLabel
                Left = 373
                Top = 85
                Width = 27
                Height = 16
                Caption = 'Tittle'
              end
              object lbl42: TLabel
                Left = 65
                Top = 112
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
                Top = 189
                Width = 71
                Height = 16
                Caption = 'Account Name'
              end
              object Label7: TLabel
                Left = 27
                Top = 138
                Width = 62
                Height = 16
                Caption = 'Bank Branch'
              end
              object Label8: TLabel
                Left = 22
                Top = 164
                Width = 65
                Height = 16
                Caption = 'Bank Address'
              end
              object Label15: TLabel
                Left = 521
                Top = 85
                Width = 25
                Height = 16
                Caption = 'Email'
              end
              object edtAddrMer: TcxTextEdit
                Left = 96
                Top = 26
                Enabled = False
                TabOrder = 1
                Text = '---'
                Width = 553
              end
              object edtCityMer: TcxTextEdit
                Left = 96
                Top = 55
                Enabled = False
                TabOrder = 2
                Width = 95
              end
              object edtPostCodeMer: TcxTextEdit
                Left = 248
                Top = 55
                Enabled = False
                TabOrder = 3
                OnKeyPress = edtPostCodeMerKeyPress
                Width = 96
              end
              object edtFaxMer: TcxTextEdit
                Left = 553
                Top = 55
                Enabled = False
                TabOrder = 5
                Width = 96
              end
              object edtPhoneMer: TcxTextEdit
                Left = 406
                Top = 56
                Enabled = False
                TabOrder = 4
                Width = 96
              end
              object edtContactMer: TcxTextEdit
                Left = 96
                Top = 82
                Enabled = False
                TabOrder = 6
                Width = 248
              end
              object edtTitleMer: TcxTextEdit
                Left = 406
                Top = 82
                Enabled = False
                TabOrder = 7
                Width = 96
              end
              object edtAccountNameMer: TcxTextEdit
                Left = 96
                Top = 187
                Enabled = False
                TabOrder = 12
                Width = 553
              end
              object edtAccountNoMer: TcxTextEdit
                Left = 96
                Top = 213
                Enabled = False
                TabOrder = 13
                Width = 553
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
                Top = 135
                Enabled = False
                Properties.ReadOnly = True
                TabOrder = 10
                Width = 553
              end
              object edtAlamatBankMer: TcxTextEdit
                Left = 96
                Top = 161
                Enabled = False
                Properties.ReadOnly = True
                TabOrder = 11
                Width = 553
              end
              object cxLookUpBankMer: TcxExtLookupComboBox
                Left = 96
                Top = 109
                Enabled = False
                Properties.OnEditValueChanged = cxLookUpBankMerPropertiesEditValueChanged
                TabOrder = 9
                Width = 553
              end
              object edtEmailMer: TcxTextEdit
                Left = 552
                Top = 79
                Enabled = False
                TabOrder = 8
                Width = 96
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
        Action = actPrint
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
    Left = 614
    Top = 94
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object actSupplier: TActionList
    Left = 614
    Top = 33
    object actUpdateBank: TAction
      Caption = 'actUpdateBank'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 614
    Top = 157
    object EditData1: TMenuItem
      Caption = 'Edit Data'
      OnClick = EditData1Click
    end
  end
end
