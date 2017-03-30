inherited frmListMemberTransaction: TfrmListMemberTransaction
  Left = 478
  Top = 249
  Caption = 'frmListMemberTransaction'
  ClientHeight = 420
  ClientWidth = 595
  OldCreateOrder = True
  ExplicitWidth = 611
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 595
    Height = 331
    BorderWidth = 1
    ExplicitWidth = 595
    ExplicitHeight = 331
    inherited pgcBrowse: TcxPageControl
      Left = 2
      Top = 73
      Width = 591
      Height = 256
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 97
      ExplicitWidth = 591
      ExplicitHeight = 179
      ClientRectBottom = 255
      ClientRectRight = 590
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 589
        ExplicitHeight = 177
        inherited cxGrid: TcxGrid
          Width = 589
          Height = 254
          ExplicitWidth = 589
          ExplicitHeight = 177
        end
      end
    end
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 591
      Height = 71
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object Label1: TLabel
        Left = 42
        Top = 37
        Width = 39
        Height = 16
        Caption = 'Member'
      end
      object lbl1: TLabel
        Left = 34
        Top = 13
        Width = 72
        Height = 16
        Caption = 'Group Member'
      end
      object edtMember: TcxButtonEdit
        Left = 112
        Top = 35
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        Width = 121
      end
      object edtMemberNm: TEdit
        Left = 237
        Top = 35
        Width = 268
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object chkAllMember: TCheckBox
        Left = 512
        Top = 38
        Width = 41
        Height = 17
        Caption = 'All '
        TabOrder = 2
      end
      object edtgroupmem: TcxButtonEdit
        Left = 112
        Top = 11
        Properties.Buttons = <>
        TabOrder = 3
        Text = '0'
        Width = 121
      end
      object edtgroupmemnm: TEdit
        Left = 237
        Top = 11
        Width = 268
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object chkAllGrup: TCheckBox
        Left = 514
        Top = 14
        Width = 41
        Height = 17
        Caption = 'All '
        TabOrder = 5
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 595
    ExplicitWidth = 595
    inherited lblHeader: TLabel
      Width = 171
      Caption = 'LISTING MEMBER TRANSACTION'
      ExplicitWidth = 171
    end
    inherited lblFilterData: TcxLabel
      Left = 241
      Visible = True
      ExplicitLeft = 241
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 302
      Visible = True
      ExplicitLeft = 302
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 418
      Visible = True
      ExplicitLeft = 418
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 513
      ExplicitLeft = 513
    end
    inherited lblsdFilter: TcxLabel
      Left = 394
      Visible = True
      ExplicitLeft = 394
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 364
    Width = 595
    ExplicitTop = 364
    ExplicitWidth = 595
    inherited pnlFooter: TPanel
      Width = 595
      ExplicitWidth = 595
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
        Left = 518
        Action = actClose
        ExplicitLeft = 518
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 595
      ExplicitWidth = 595
      inherited lbEscape: TLabel
        Left = 521
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
