inherited frmApprovallPO: TfrmApprovallPO
  Left = 217
  Top = 210
  Caption = 'Approval PO'
  ClientHeight = 429
  ClientWidth = 628
  OldCreateOrder = True
  ExplicitWidth = 644
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 628
    Height = 340
    BorderWidth = 0
    ExplicitWidth = 628
    ExplicitHeight = 340
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 113
      Width = 626
      Height = 226
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 113
      ExplicitWidth = 626
      ExplicitHeight = 226
      ClientRectBottom = 225
      ClientRectRight = 625
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 624
        ExplicitHeight = 224
        inherited cxGrid: TcxGrid
          Width = 624
          Height = 224
          ExplicitWidth = 624
          ExplicitHeight = 224
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 626
      Height = 112
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      DesignSize = (
        626
        112)
      object lbl1: TLabel
        Left = 17
        Top = 86
        Width = 63
        Height = 16
        Caption = 'PO No. / SPB'
      end
      object lbl2: TLabel
        Left = 220
        Top = 86
        Width = 11
        Height = 16
        Caption = 'to'
      end
      object lbl3: TLabel
        Left = 39
        Top = 32
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lbl4: TLabel
        Left = 13
        Top = 59
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object lb1: TLabel
        Left = 41
        Top = 10
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object bvlSeparator: TBevel
        Left = 366
        Top = 4
        Width = 9
        Height = 101
        Anchors = [akLeft, akBottom]
        Shape = bsLeftLine
        Visible = False
      end
      object edtNoPO1: TEdit
        Left = 88
        Top = 86
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        OnKeyDown = edtNoPO1KeyDown
      end
      object edtNoPO2: TEdit
        Left = 240
        Top = 86
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        OnKeyDown = edtNoPO1KeyDown
      end
      object btnShowPO: TcxButton
        Left = 372
        Top = 0
        Width = 85
        Height = 110
        Cursor = crHandPoint
        Caption = 'Show PO'
        OptionsImage.ImageIndex = 14
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowPOClick
      end
      object dtTglPO: TcxDateEdit
        Left = 88
        Top = 32
        TabOrder = 0
        Width = 121
      end
      object edtKodeSuplier: TEdit
        Left = 88
        Top = 59
        Width = 73
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = edtKodeSuplierKeyDown
        OnKeyUp = edtKodeSuplierKeyUp
      end
      object edtNamaSuplier: TEdit
        Left = 168
        Top = 59
        Width = 193
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object cbbMerchanGroup: TComboBox
        Left = 88
        Top = 4
        Width = 273
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 628
    ExplicitWidth = 628
    inherited lblFilterData: TcxLabel
      Left = 274
      ExplicitLeft = 274
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 335
      ExplicitLeft = 335
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 451
      ExplicitLeft = 451
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 546
      ExplicitLeft = 546
    end
    inherited lblsdFilter: TcxLabel
      Left = 427
      ExplicitLeft = 427
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 373
    Width = 628
    ExplicitTop = 373
    ExplicitWidth = 628
    inherited pnlFooter: TPanel
      Width = 628
      ExplicitWidth = 628
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actApproveApprovalPO
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 551
        Action = actClose
        ExplicitLeft = 551
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 628
      ExplicitWidth = 628
      inherited lbEscape: TLabel
        Left = 554
        ExplicitLeft = 554
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    object actApproveApprovalPO: TAction
      Caption = 'Approve'
      ImageIndex = 13
    end
  end
end
