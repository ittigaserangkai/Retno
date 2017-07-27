inherited frmPOFromTrader: TfrmPOFromTrader
  Left = 287
  Top = 181
  Caption = 'PO From Trader/Assgros'
  ClientHeight = 371
  ClientWidth = 674
  OldCreateOrder = True
  ExplicitWidth = 690
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 674
    Height = 282
    ExplicitWidth = 674
    ExplicitHeight = 282
    inherited pgcBrowse: TcxPageControl
      Top = 111
      Width = 672
      Height = 170
      TabOrder = 1
      ExplicitTop = 111
      ExplicitWidth = 672
      ExplicitHeight = 170
      ClientRectBottom = 169
      ClientRectRight = 671
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 670
        ExplicitHeight = 168
        inherited cxGrid: TcxGrid
          Width = 670
          Height = 168
          ExplicitWidth = 670
          ExplicitHeight = 168
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 672
      Height = 110
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 15
        Top = 6
        Width = 77
        Height = 16
        Caption = 'PO Trader Date'
      end
      object lbl2: TLabel
        Left = 15
        Top = 31
        Width = 70
        Height = 16
        Caption = 'PO Trader No.'
      end
      object lbl3: TLabel
        Left = 15
        Top = 81
        Width = 33
        Height = 16
        Caption = 'Trader'
      end
      object lbl4: TLabel
        Left = 464
        Top = 8
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl5: TLabel
        Left = 464
        Top = 32
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object lbl6: TLabel
        Left = 464
        Top = 80
        Width = 41
        Height = 16
        Caption = 'Total PO'
      end
      object lbl8: TLabel
        Left = 592
        Top = 34
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl9: TLabel
        Left = 464
        Top = 56
        Width = 26
        Height = 16
        Caption = 'T.O.P'
      end
      object lbl10: TLabel
        Left = 592
        Top = 58
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl11: TLabel
        Left = 17
        Top = 57
        Width = 59
        Height = 16
        Caption = 'Trader Type'
      end
      object Label1: TLabel
        Left = 312
        Top = 32
        Width = 20
        Height = 16
        Caption = '(F5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object edtTraderCode: TEdit
        Left = 97
        Top = 81
        Width = 64
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Text = 'AG001'
      end
      object edtTraderName: TEdit
        Left = 163
        Top = 81
        Width = 294
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Text = 'ASSGROS ASSALAM BARU'
      end
      object dtTgl: TcxDateEdit
        Left = 97
        Top = 6
        TabOrder = 1
        OnKeyUp = dtTglKeyUp
        Width = 89
      end
      object cbpPOTraderNo: TcxExtLookupComboBox
        Left = 193
        Top = 6
        TabOrder = 9
        Visible = False
        OnKeyUp = cbpPOTraderNoKeyUp
        Width = 112
      end
      object edtStatus: TEdit
        Left = 528
        Top = 8
        Width = 89
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Text = 'Open'
      end
      object edtLeadTime: TEdit
        Left = 528
        Top = 32
        Width = 57
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        Text = '3'
      end
      object edtTOP: TEdit
        Left = 528
        Top = 56
        Width = 57
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        Text = '7'
      end
      object curredtTotalPrice: TcxCurrencyEdit
        Left = 528
        Top = 80
        TabOrder = 8
        Width = 134
      end
      object edtTraderType: TEdit
        Left = 97
        Top = 57
        Width = 208
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        Text = 'ASSGROS'
      end
      object edtPOTraderNo: TEdit
        Left = 97
        Top = 32
        Width = 208
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtPOTraderNoChange
        OnKeyUp = edtPOTraderNoKeyUp
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 674
    ExplicitWidth = 674
    inherited lblFilterData: TcxLabel
      Left = 320
      ExplicitLeft = 320
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 381
      ExplicitLeft = 381
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 497
      ExplicitLeft = 497
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 592
      ExplicitLeft = 592
    end
    inherited lblsdFilter: TcxLabel
      Left = 473
      ExplicitLeft = 473
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 315
    Width = 674
    ExplicitTop = 315
    ExplicitWidth = 674
    inherited pnlFooter: TPanel
      Width = 674
      ExplicitWidth = 674
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
        Left = 597
        Action = actClose
        ExplicitLeft = 597
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 674
      ExplicitWidth = 674
      inherited lbEscape: TLabel
        Left = 600
        Height = 17
        ExplicitLeft = 600
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
