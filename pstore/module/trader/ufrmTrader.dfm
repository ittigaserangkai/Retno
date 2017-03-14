inherited frmTrader: TfrmTrader
  Left = 293
  Top = 214
  Caption = 'Master Trader'
  ClientHeight = 407
  ClientWidth = 678
  OldCreateOrder = True
  ExplicitWidth = 694
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 678
    Height = 318
    BorderWidth = 0
    ExplicitTop = 33
    ExplicitWidth = 678
    ExplicitHeight = 318
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 42
      Width = 676
      Height = 159
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 42
      ExplicitWidth = 676
      ExplicitHeight = 159
      ClientRectBottom = 158
      ClientRectRight = 675
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 674
        ExplicitHeight = 157
        inherited cxGrid: TcxGrid
          Width = 674
          Height = 157
          ExplicitWidth = 674
          ExplicitHeight = 157
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 676
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 41
        Height = 16
        Caption = 'Search :'
      end
      object edtCari: TEdit
        Left = 51
        Top = 8
        Width = 150
        Height = 22
        TabOrder = 0
        OnChange = edtCariChange
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 201
      Width = 676
      Height = 116
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        676
        116)
      object bvl1: TBevel
        Left = 4
        Top = 6
        Width = 670
        Height = 9
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
        ExplicitWidth = 650
      end
      object lbl1: TLabel
        Left = 9
        Top = 22
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object lbl2: TLabel
        Left = 384
        Top = 22
        Width = 77
        Height = 16
        Caption = 'Contact Person'
      end
      object lbl3: TLabel
        Left = 387
        Top = 46
        Width = 70
        Height = 16
        Caption = 'Phone Number'
      end
      object lbl4: TLabel
        Left = 388
        Top = 95
        Width = 29
        Height = 16
        Caption = 'NPWP'
      end
      object lbl5: TLabel
        Left = 387
        Top = 71
        Width = 59
        Height = 16
        Caption = 'Fax Number'
      end
      object lbl6: TLabel
        Left = 9
        Top = 45
        Width = 84
        Height = 16
        Caption = 'Term Of Payment'
      end
      object lbl7: TLabel
        Left = 128
        Top = 24
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl8: TLabel
        Left = 128
        Top = 48
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl9: TLabel
        Left = 9
        Top = 95
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object Label1: TLabel
        Left = 9
        Top = 69
        Width = 83
        Height = 16
        Caption = 'Type Of Payment'
      end
      object lbl10: TLabel
        Left = 184
        Top = 48
        Width = 60
        Height = 16
        Caption = 'Credit Limit'
      end
      object edtLeadTime: TEdit
        Left = 99
        Top = 20
        Width = 25
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtTOP: TEdit
        Left = 99
        Top = 44
        Width = 25
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtContactPerson: TEdit
        Left = 466
        Top = 20
        Width = 187
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtTelp: TEdit
        Left = 466
        Top = 44
        Width = 142
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtFax: TEdit
        Left = 466
        Top = 68
        Width = 142
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtNPWP: TEdit
        Left = 466
        Top = 92
        Width = 142
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtDesc: TEdit
        Left = 99
        Top = 92
        Width = 278
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edTipeByar: TEdit
        Left = 99
        Top = 68
        Width = 142
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtCreditLimit: TcxCurrencyEdit
        Left = 248
        Top = 46
        TabOrder = 2
        Width = 121
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 678
    ExplicitWidth = 678
    inherited lblFilterData: TcxLabel
      Left = 324
      ExplicitLeft = 324
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 385
      ExplicitLeft = 385
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 501
      ExplicitLeft = 501
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 596
      ExplicitLeft = 596
    end
    inherited lblsdFilter: TcxLabel
      Left = 477
      ExplicitLeft = 477
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 351
    Width = 678
    ExplicitTop = 351
    ExplicitWidth = 678
    inherited pnlFooter: TPanel
      Width = 678
      ExplicitWidth = 678
      inherited btnClose: TcxButton
        Left = 601
        ExplicitLeft = 601
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 678
      ExplicitWidth = 678
      inherited lbEscape: TLabel
        Left = 604
        Height = 17
        ExplicitLeft = 604
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
  end
end
