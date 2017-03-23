inherited frmCetakPO: TfrmCetakPO
  Left = 212
  Top = 127
  Caption = 'Cetak PO'
  ClientHeight = 447
  ClientWidth = 690
  OldCreateOrder = True
  ExplicitWidth = 706
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 690
    Height = 358
    BorderWidth = 0
    ExplicitWidth = 690
    ExplicitHeight = 302
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 116
      Width = 688
      Height = 241
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 116
      ExplicitWidth = 688
      ExplicitHeight = 185
      ClientRectBottom = 240
      ClientRectRight = 687
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 686
        ExplicitHeight = 183
        inherited cxGrid: TcxGrid
          Width = 686
          Height = 239
          ExplicitWidth = 686
          ExplicitHeight = 183
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 688
      Height = 115
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 18
        Top = 87
        Width = 63
        Height = 16
        Caption = 'PO No. / SPB'
      end
      object lbl2: TLabel
        Left = 216
        Top = 87
        Width = 11
        Height = 16
        Caption = 'to'
      end
      object lbl3: TLabel
        Left = 42
        Top = 11
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lbl4: TLabel
        Left = 15
        Top = 60
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object Label1: TLabel
        Left = 43
        Top = 33
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object Label2: TLabel
        Left = 109
        Top = 9
        Width = 8
        Height = 22
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 140
        Top = 9
        Width = 8
        Height = 22
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 186
        Top = 12
        Width = 72
        Height = 16
        Caption = '(dd/mm/yyyy)'
      end
      object edtNoPO1: TEdit
        Left = 88
        Top = 87
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
        OnKeyUp = edtNoPO1KeyUp
      end
      object edtNoPO2: TEdit
        Left = 240
        Top = 87
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
        OnKeyUp = edtNoPO1KeyUp
      end
      object btnShowPO: TcxButtonEdit
        Left = 372
        Top = 84
        Cursor = crHandPoint
        AutoSize = False
        ParentFont = False
        Properties.Buttons = <>
        TabOrder = 10
        OnClick = btnShowPOClick
        Height = 27
        Width = 80
      end
      object edtNamaSuplier: TEdit
        Left = 215
        Top = 60
        Width = 235
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object cbpMerchandCode: TComboBox
        Left = 88
        Top = 33
        Width = 169
        Height = 24
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object chkMerchandize: TCheckBox
        Left = 272
        Top = 37
        Width = 129
        Height = 17
        Caption = 'All Division'
        TabOrder = 5
        Visible = False
        OnClick = chkMerchandizeClick
      end
      object chkReprint: TCheckBox
        Left = 272
        Top = 13
        Width = 65
        Height = 17
        Caption = 'Reprint'
        TabOrder = 3
        OnClick = chkMerchandizeClick
      end
      object edtDd: TEdit
        Left = 88
        Top = 9
        Width = 18
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = edtDdKeyPress
      end
      object edtMm: TEdit
        Left = 118
        Top = 9
        Width = 18
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = edtDdKeyPress
      end
      object edtYy: TEdit
        Left = 149
        Top = 9
        Width = 32
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = edtDdKeyPress
      end
      object CbpKodeSuplier: TcxButtonEdit
        Left = 88
        Top = 59
        Properties.Buttons = <>
        TabOrder = 6
        Text = '0'
        OnExit = CbpKodeSuplierExit
        OnKeyUp = CbpKodeSuplierKeyUp
        Width = 121
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 690
    ExplicitWidth = 690
    inherited lblHeader: TLabel
      Width = 141
      Caption = 'PRINT PURCHASING ORDER'
      ExplicitWidth = 141
    end
    inherited lblFilterData: TcxLabel
      Left = 336
      ExplicitLeft = 336
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 397
      ExplicitLeft = 397
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 513
      ExplicitLeft = 513
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 608
      ExplicitLeft = 608
    end
    inherited lblsdFilter: TcxLabel
      Left = 489
      ExplicitLeft = 489
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 391
    Width = 690
    ExplicitTop = 335
    ExplicitWidth = 690
    inherited pnlFooter: TPanel
      Width = 690
      ExplicitWidth = 690
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
        Left = 613
        Action = actClose
        ExplicitLeft = 613
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 690
      ExplicitWidth = 690
      inherited lbEscape: TLabel
        Left = 616
        ExplicitLeft = 616
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
