inherited frmDialogQuotation: TfrmDialogQuotation
  Left = 30
  Top = 143
  Caption = 'Input Quotation'
  ClientHeight = 495
  ClientWidth = 909
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitTop = -5
  ExplicitWidth = 925
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 909
    Height = 439
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderWidth = 10
    ExplicitWidth = 986
    ExplicitHeight = 439
    inherited cxGrid: TcxGrid
      Left = 10
      Top = 103
      Width = 889
      Height = 299
      ExplicitLeft = 12
      ExplicitTop = 102
      ExplicitWidth = 761
      ExplicitHeight = 299
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'Kode Barang'
          HeaderAlignmentHorz = taCenter
          Width = 85
        end
        object cxGridViewColumn2: TcxGridDBColumn
          Caption = 'Nama Barang'
          HeaderAlignmentHorz = taCenter
          Width = 172
        end
        object cxGridViewColumn3: TcxGridDBColumn
          Caption = 'Satuan'
          HeaderAlignmentHorz = taCenter
          Width = 69
        end
        object cxGridViewColumn4: TcxGridDBColumn
          Caption = 'Margin'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taRightJustify
          Width = 55
        end
        object cxGridViewColumn5: TcxGridDBColumn
          Caption = 'Harga Beli'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taRightJustify
          Width = 110
        end
        object cxGridViewColumn6: TcxGridDBColumn
          Caption = 'Harga Jual'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taRightJustify
          Width = 94
        end
        object cxGridViewColumn7: TcxGridDBColumn
          Caption = '% Disc1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taRightJustify
        end
        object cxGridViewColumn8: TcxGridDBColumn
          Caption = '% Disc 2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taRightJustify
        end
        object cxGridViewColumn9: TcxGridDBColumn
          Caption = 'Disc 3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taRightJustify
        end
        object cxGridViewColumn10: TcxGridDBColumn
        end
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 10
      Top = 10
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Transparent = True
      ExplicitWidth = 966
      Height = 93
      Width = 889
      object Label6: TLabel
        Left = 48
        Top = 36
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'Suppplier'
      end
      object Label7: TLabel
        Left = 17
        Top = 61
        Width = 76
        Height = 16
        Alignment = taRightJustify
        Caption = 'Merchan Group'
      end
      object Label8: TLabel
        Left = 360
        Top = 36
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'Effective At'
      end
      object Label9: TLabel
        Left = 518
        Top = 36
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'End Date'
      end
      object Label10: TLabel
        Left = 381
        Top = 61
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Remark'
      end
      object Label11: TLabel
        Left = 25
        Top = 11
        Width = 67
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quotation No'
      end
      object cxLookupTipeHarga: TcxExtLookupComboBox
        Tag = 1
        Left = 99
        Top = 33
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 227
      end
      object cxExtLookupComboBox1: TcxExtLookupComboBox
        Tag = 1
        Left = 99
        Top = 58
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 227
      end
      object dtAwalFilter: TcxDateEdit
        AlignWithMargins = True
        Left = 425
        Top = 33
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 2
        Width = 87
      end
      object cxDateEdit1: TcxDateEdit
        AlignWithMargins = True
        Left = 569
        Top = 33
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 3
        Width = 87
      end
      object ckIsADS: TcxCheckBox
        Left = 260
        Top = 8
        Caption = 'Is Mailer'
        Properties.Alignment = taLeftJustify
        TabOrder = 4
        Transparent = True
      end
      object edtProductName: TcxTextEdit
        Tag = 1
        Left = 425
        Top = 58
        HelpType = htKeyword
        HelpKeyword = 'Nama Produk'
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 309
      end
      object cxTextEdit1: TcxTextEdit
        Tag = 1
        Left = 99
        Top = 8
        HelpType = htKeyword
        HelpKeyword = 'Nama Produk'
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 155
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 10
      Top = 402
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = [bRight, bBottom]
      TabOrder = 2
      Transparent = True
      ExplicitLeft = -6
      ExplicitTop = 147
      ExplicitWidth = 966
      Height = 27
      Width = 889
      object Label2: TLabel
        AlignWithMargins = True
        Left = 723
        Top = 6
        Width = 161
        Height = 18
        Margins.Top = 4
        Margins.Bottom = 1
        Align = alRight
        Caption = 'ALT-T [Tambah]  |  ALT-D [Delete]'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 606
        ExplicitHeight = 16
      end
      object btnDelKonv: TcxButton
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
      end
      object btnAddKonversi: TcxButton
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
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 439
    Width = 909
    ExplicitTop = 439
    ExplicitWidth = 986
    inherited pnlFooter: TPanel
      Width = 909
      ExplicitWidth = 986
      inherited btnClose: TcxButton
        Left = 832
        Action = actCancel
        ExplicitLeft = 909
      end
      inherited btnSave: TcxButton
        Left = 739
        Action = actSave
        ExplicitLeft = 816
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 662
        ExplicitLeft = 739
      end
    end
    inherited pnlSortCut: TPanel
      Width = 909
      ExplicitWidth = 986
      inherited lbCTRLEnter: TLabel
        Left = 734
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 825
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 658
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 712
    Top = 65528
  end
end
