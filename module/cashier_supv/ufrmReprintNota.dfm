inherited frmReprintNota: TfrmReprintNota
  Left = 501
  Top = 97
  Caption = 'REPRINT NOTA'
  ClientHeight = 438
  ClientWidth = 684
  OldCreateOrder = True
  ExplicitWidth = 700
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 684
    Height = 349
    BorderWidth = 5
    ExplicitWidth = 684
    ExplicitHeight = 349
    inherited pgcBrowse: TcxPageControl
      Left = 6
      Top = 6
      Width = 672
      Height = 337
      ExplicitLeft = 6
      ExplicitTop = 6
      ExplicitWidth = 672
      ExplicitHeight = 337
      ClientRectBottom = 336
      ClientRectRight = 671
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 670
        ExplicitHeight = 335
        inherited cxGrid: TcxGrid
          Top = 49
          Width = 670
          Height = 286
          ExplicitTop = 49
          ExplicitWidth = 670
          ExplicitHeight = 286
        end
        object pnlMain: TPanel
          Left = 0
          Top = 0
          Width = 670
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 10
          Color = 15198183
          TabOrder = 1
          object lbl1: TLabel
            Left = 16
            Top = 16
            Width = 100
            Height = 16
            Caption = 'Transaction Number'
          end
          object edtFileNota: TEdit
            Left = 123
            Top = 0
            Width = 206
            Height = 41
            CharCase = ecUpperCase
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Trebuchet MS'
            Font.Style = [fsBold]
            MaxLength = 12
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object tsPrintOthersDay: TcxTabSheet
        Caption = 'tsPrintOthersDay'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 670
          Height = 73
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 10
          Color = 15198183
          TabOrder = 0
          object lbl2: TLabel
            Left = 4
            Top = 16
            Width = 100
            Height = 16
            Caption = 'Transaction Number'
          end
          object lbl3: TLabel
            Left = 4
            Top = 42
            Width = 39
            Height = 16
            Caption = 'Member'
          end
          object edtOthersTransNo: TEdit
            Left = 118
            Top = 13
            Width = 206
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Trebuchet MS'
            Font.Style = []
            MaxLength = 12
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnChange = edtOthersTransNoChange
          end
          object edtMemberCode: TEdit
            Left = 118
            Top = 40
            Width = 148
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
            Text = 'edtMemberCode'
          end
          object edtMemberName: TEdit
            Left = 269
            Top = 40
            Width = 241
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
            TabOrder = 2
            Text = 'edtMemberName'
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 303
          Width = 670
          Height = 32
          Align = alBottom
          BevelOuter = bvNone
          Color = 15198183
          TabOrder = 1
          object lbl4: TLabel
            Left = 501
            Top = 0
            Width = 48
            Height = 16
            Align = alRight
            Caption = 'Total        '
          end
          object edtTotal: TcxCurrencyEdit
            Left = 549
            Top = 0
            Align = alRight
            ParentFont = False
            TabOrder = 0
            Width = 121
          end
        end
        object cxgrdOtherDay: TcxGrid
          Left = 0
          Top = 73
          Width = 670
          Height = 230
          Align = alClient
          TabOrder = 2
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitTop = 49
          ExplicitHeight = 286
          object grdOtherDay: TcxGridDBTableView
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
          end
          object grdlvlOtherDay: TcxGridLevel
            GridView = grdOtherDay
          end
        end
      end
      object tsTemp: TcxTabSheet
        Caption = 'tsTemp'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object edtCashback: TcxCurrencyEdit
          Left = 88
          Top = 64
          TabOrder = 0
          Visible = False
          Width = 49
        end
        object edtChargeCC: TcxCurrencyEdit
          Left = 88
          Top = 40
          TabOrder = 1
          Visible = False
          Width = 49
        end
        object edtDiscCCNominal: TcxCurrencyEdit
          Left = 88
          Top = 112
          TabOrder = 2
          Visible = False
          Width = 49
        end
        object edtDiscGMCNominal: TcxCurrencyEdit
          Left = 8
          Top = 64
          TabOrder = 3
          Visible = False
          Width = 49
        end
        object edtDiscGMCPersen: TcxCurrencyEdit
          Left = 8
          Top = 88
          TabOrder = 4
          Visible = False
          Width = 49
        end
        object edtJenisKartu: TEdit
          Left = 184
          Top = 48
          Width = 121
          Height = 22
          TabOrder = 5
          Text = 'edtJenisKartu'
          Visible = False
        end
        object edtKembali: TcxCurrencyEdit
          Left = 88
          Top = 88
          TabOrder = 6
          Visible = False
          Width = 49
        end
        object edtKodeKartu: TEdit
          Left = 184
          Top = 120
          Width = 121
          Height = 22
          TabOrder = 7
          Text = 'edtKodeKartu'
          Visible = False
        end
        object edtNilaiCC: TcxCurrencyEdit
          Left = 8
          Top = 184
          TabOrder = 8
          Visible = False
          Width = 49
        end
        object edtNilaiTunai: TcxCurrencyEdit
          Left = 8
          Top = 160
          TabOrder = 9
          Visible = False
          Width = 49
        end
        object edtNoKartu: TEdit
          Left = 184
          Top = 72
          Width = 121
          Height = 22
          TabOrder = 10
          Text = 'edtNoKartu'
          Visible = False
        end
        object edtNoOtorisasi: TEdit
          Left = 184
          Top = 96
          Width = 121
          Height = 22
          TabOrder = 11
          Text = 'edtNoOtorisasi'
          Visible = False
        end
        object edtPembulatan: TcxCurrencyEdit
          Left = 8
          Top = 136
          TabOrder = 12
          Visible = False
          Width = 49
        end
        object edtTotalBayar: TcxCurrencyEdit
          Left = 8
          Top = 112
          TabOrder = 13
          Visible = False
          Width = 49
        end
        object edtTotalDiscGMC: TcxCurrencyEdit
          Left = 8
          Top = 40
          TabOrder = 14
          Visible = False
          Width = 49
        end
        object mmoBackup: TMemo
          Left = 397
          Top = 158
          Width = 273
          Height = 177
          Lines.Strings = (
            'test')
          TabOrder = 15
          Visible = False
        end
        object mmoFooterStruk: TMemo
          Left = 397
          Top = 158
          Width = 273
          Height = 177
          Lines.Strings = (
            'test')
          TabOrder = 16
          Visible = False
        end
        object mmoHeadStruk: TMemo
          Left = 397
          Top = 158
          Width = 273
          Height = 177
          Lines.Strings = (
            'test')
          TabOrder = 17
          Visible = False
        end
        object mmoIsiCB: TMemo
          Left = 397
          Top = 158
          Width = 273
          Height = 177
          Lines.Strings = (
            'test')
          TabOrder = 18
          Visible = False
        end
        object mmoIsiStruk: TMemo
          Left = 397
          Top = 158
          Width = 273
          Height = 177
          Lines.Strings = (
            'test')
          TabOrder = 19
          Visible = False
        end
        object mmoTemp: TMemo
          Left = 397
          Top = 158
          Width = 273
          Height = 177
          Lines.Strings = (
            'test')
          TabOrder = 20
          Visible = False
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 684
    ExplicitWidth = 684
    inherited lblHeader: TLabel
      Width = 76
      Caption = 'REPRINT NOTA'
      ExplicitWidth = 76
    end
    inherited lblFilterData: TcxLabel
      Left = 330
      ExplicitLeft = 330
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 391
      ExplicitLeft = 391
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 507
      ExplicitLeft = 507
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 602
      ExplicitLeft = 602
    end
    inherited lblsdFilter: TcxLabel
      Left = 483
      ExplicitLeft = 483
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 382
    Width = 684
    ExplicitTop = 382
    ExplicitWidth = 684
    inherited pnlFooter: TPanel
      Width = 684
      ExplicitWidth = 684
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
        Left = 607
        Action = actClose
        ExplicitLeft = 607
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 684
      ExplicitWidth = 684
      inherited lbEscape: TLabel
        Left = 610
        ExplicitLeft = 610
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  object dlgOpenFile: TOpenDialog
    Filter = 'Text File|*.txt|All|*.*'
    InitialDir = 'C:\'
    Left = 602
    Top = 190
  end
  object dlgPntSetNota: TPrinterSetupDialog
    Left = 563
    Top = 193
  end
end
