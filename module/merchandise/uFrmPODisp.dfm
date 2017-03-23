inherited frmPODisp: TfrmPODisp
  Left = 324
  Top = 126
  Caption = 'frmPODisp'
  ClientHeight = 456
  ClientWidth = 646
  OldCreateOrder = True
  ExplicitWidth = 662
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 646
    Height = 367
    ExplicitWidth = 646
    ExplicitHeight = 315
    object pnleft: TPanel [0]
      Left = 11
      Top = 11
      Width = 150
      Height = 345
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnleft'
      Color = 15198183
      TabOrder = 0
      ExplicitHeight = 293
      object pnLisTop: TPanel
        Left = 0
        Top = 0
        Width = 150
        Height = 121
        Align = alTop
        BevelOuter = bvNone
        Color = 15198183
        TabOrder = 0
        object lblGenNum: TLabel
          Left = 1
          Top = 44
          Width = 109
          Height = 16
          Caption = 'PO Generate Number:'
        end
        object lb6: TLabel
          Left = 135
          Top = 62
          Width = 12
          Height = 16
          Caption = 'F5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
        end
        object chkPoGen: TCheckBox
          Left = 0
          Top = 8
          Width = 129
          Height = 17
          Caption = 'PO Generate Number'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkPoGenClick
        end
        object chkPoNo: TCheckBox
          Left = 0
          Top = 27
          Width = 129
          Height = 17
          Caption = 'PO NO'
          TabOrder = 1
          OnClick = chkPoNoClick
        end
        object edGEnNum: TEdit
          Left = 3
          Top = 59
          Width = 129
          Height = 22
          TabOrder = 2
          OnExit = edGEnNumExit
          OnKeyDown = edGEnNumKeyDown
        end
      end
      object cxgrdPONumber: TcxGrid
        Left = 0
        Top = 121
        Width = 150
        Height = 224
        Align = alClient
        TabOrder = 1
        LockedStateImageOptions.Text = 'Mohon ditunggu...'
        LookAndFeel.NativeStyle = False
        ExplicitTop = 0
        ExplicitWidth = 472
        ExplicitHeight = 291
        object grdPONumber: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.DisplayMode = fpdmManual
          FindPanel.InfoText = 'ketik teks yang dicari...'
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 
            'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
            'er'
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          NewItemRow.InfoText = 'Baris baru'
          OptionsData.Editing = False
          OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridHeader
          Styles.Header = DMClient.cxStyleGridEven
          object cxcolPONumber: TcxGridDBColumn
            Caption = 'PONumber'
          end
          object cxcolSupplier: TcxGridDBColumn
            Caption = 'Supplier'
            Width = 70
          end
        end
        object grdlvl1: TcxGridLevel
          GridView = grdPONumber
        end
      end
    end
    inherited pgcBrowse: TcxPageControl
      Left = 161
      Width = 474
      Height = 345
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 121
      ExplicitWidth = 474
      ExplicitHeight = 224
      ClientRectBottom = 344
      ClientRectRight = 473
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 472
        ExplicitHeight = 222
        inherited cxGrid: TcxGrid
          Top = 121
          Width = 472
          Height = 222
          ExplicitWidth = 472
          ExplicitHeight = 222
        end
        object pnPOHeader: TPanel
          Left = 0
          Top = 0
          Width = 472
          Height = 121
          Align = alTop
          BevelOuter = bvNone
          Color = 15198183
          TabOrder = 1
          ExplicitLeft = 11
          ExplicitTop = 11
          ExplicitWidth = 624
          object lb1: TLabel
            Left = 17
            Top = 4
            Width = 34
            Height = 16
            Caption = 'PO No.'
          end
          object lbl8: TLabel
            Left = 12
            Top = 50
            Width = 39
            Height = 16
            Caption = 'Supplier'
          end
          object lb2: TLabel
            Left = 11
            Top = 27
            Width = 41
            Height = 16
            Caption = 'Date PO'
          end
          object lbl10: TLabel
            Left = 168
            Top = 3
            Width = 44
            Height = 16
            Caption = 'Sub Total'
          end
          object lbl12: TLabel
            Left = 165
            Top = 26
            Width = 44
            Height = 16
            Caption = 'Discount'
          end
          object lbl13: TLabel
            Left = 349
            Top = 5
            Width = 18
            Height = 16
            Caption = 'PPn'
          end
          object lbl14: TLabel
            Left = 328
            Top = 27
            Width = 39
            Height = 16
            Caption = 'PPn. BM'
          end
          object lbl11: TLabel
            Left = 323
            Top = 50
            Width = 44
            Height = 16
            Caption = 'Total Beli'
          end
          object lb4: TLabel
            Left = 12
            Top = 73
            Width = 37
            Height = 16
            Caption = 'Unit GR'
          end
          object lb5: TLabel
            Left = 4
            Top = 96
            Width = 49
            Height = 16
            Caption = 'Alamat GR'
          end
          object edPONo: TEdit
            Left = 55
            Top = 3
            Width = 82
            Height = 22
            Ctl3D = False
            MaxLength = 10
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
          object edSuplierCode: TEdit
            Left = 55
            Top = 49
            Width = 50
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object edSuplierName: TEdit
            Left = 106
            Top = 49
            Width = 207
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
          end
          object dtTglPO: TcxDateEdit
            Left = 55
            Top = 26
            TabOrder = 3
            Width = 82
          end
          object edSubTotal: TcxCurrencyEdit
            Left = 216
            Top = 3
            TabOrder = 4
            Width = 97
          end
          object edDiscount: TcxCurrencyEdit
            Left = 216
            Top = 26
            TabOrder = 5
            Width = 97
          end
          object edPPN: TcxCurrencyEdit
            Left = 375
            Top = 3
            TabOrder = 6
            Width = 99
          end
          object edPPNBM: TcxCurrencyEdit
            Left = 375
            Top = 26
            TabOrder = 7
            Width = 99
          end
          object edTotalBeli: TcxCurrencyEdit
            Left = 375
            Top = 49
            TabOrder = 8
            Width = 99
          end
          object edGRUnitName: TEdit
            Left = 106
            Top = 72
            Width = 207
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 9
          end
          object edGRUnitKode: TEdit
            Left = 55
            Top = 72
            Width = 50
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 10
          end
          object edGRAlamat: TEdit
            Left = 55
            Top = 95
            Width = 418
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 11
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 646
    ExplicitWidth = 646
    inherited lblHeader: TLabel
      Width = 63
      Caption = 'PO DISPLAY'
      ExplicitWidth = 63
    end
    inherited lblFilterData: TcxLabel
      Left = 292
      ExplicitLeft = 292
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 353
      ExplicitLeft = 353
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 469
      ExplicitLeft = 469
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 564
      ExplicitLeft = 564
    end
    inherited lblsdFilter: TcxLabel
      Left = 445
      ExplicitLeft = 445
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 400
    Width = 646
    ExplicitTop = 348
    ExplicitWidth = 646
    inherited pnlFooter: TPanel
      Width = 646
      ExplicitWidth = 646
      inherited btnAdd: TcxButton
        Action = actAdd
        Visible = False
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Visible = False
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 569
        Action = actClose
        ExplicitLeft = 569
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 646
      ExplicitWidth = 646
      inherited lbEscape: TLabel
        Left = 572
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
