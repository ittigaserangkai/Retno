inherited frmListingReceivingProduct: TfrmListingReceivingProduct
  Left = 241
  Top = 206
  Caption = 'Listing Receiving Product'
  ClientHeight = 458
  ClientWidth = 648
  OldCreateOrder = True
  ExplicitWidth = 664
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 648
    Height = 369
    BorderWidth = 0
    ExplicitWidth = 648
    ExplicitHeight = 301
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 129
      Width = 646
      Height = 239
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 129
      ExplicitWidth = 646
      ExplicitHeight = 171
      ClientRectBottom = 238
      ClientRectRight = 645
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 644
        ExplicitHeight = 169
        inherited cxGrid: TcxGrid
          Width = 644
          Height = 237
          ExplicitWidth = 644
          ExplicitHeight = 169
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 646
      Height = 128
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl3: TLabel
        Left = 16
        Top = 10
        Width = 52
        Height = 16
        Caption = 'Date From'
      end
      object lbl4: TLabel
        Left = 15
        Top = 36
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object lbl5: TLabel
        Left = 238
        Top = 10
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object Label1: TLabel
        Left = 15
        Top = 62
        Width = 27
        Height = 16
        Caption = 'Divisi'
      end
      object Label2: TLabel
        Left = 15
        Top = 88
        Width = 43
        Height = 16
        Caption = 'Kategori'
      end
      object dtTglFrom: TcxDateEdit
        Left = 107
        Top = 8
        TabOrder = 0
        OnKeyPress = dtTglFromKeyPress
        Width = 121
      end
      object dtTglTo: TcxDateEdit
        Left = 257
        Top = 8
        TabOrder = 1
        OnKeyPress = dtTglToKeyPress
        Width = 121
      end
      object edtSupName: TEdit
        Left = 234
        Top = 35
        Width = 231
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 8
      end
      object edtSupCode: TcxButtonEdit
        Left = 107
        Top = 35
        Properties.Buttons = <>
        TabOrder = 2
        Text = '0'
        Width = 121
      end
      object chkSupplier: TCheckBox
        Left = 472
        Top = 38
        Width = 65
        Height = 17
        Caption = 'Semua'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        OnClick = chkSupplierClick
      end
      object edtMer: TcxButtonEdit
        Left = 107
        Top = 61
        Properties.Buttons = <>
        TabOrder = 4
        Text = '0'
        Width = 121
      end
      object edtMerNm: TEdit
        Left = 234
        Top = 61
        Width = 231
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
      end
      object chkMer: TCheckBox
        Left = 472
        Top = 64
        Width = 65
        Height = 17
        Caption = 'Semua'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        OnClick = chkSupplierClick
      end
      object edtMerGrp: TcxButtonEdit
        Left = 107
        Top = 87
        Properties.Buttons = <>
        TabOrder = 6
        Text = '0'
        Width = 121
      end
      object edtMerGrpNm: TEdit
        Left = 234
        Top = 87
        Width = 231
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
      end
      object chkMerGrp: TCheckBox
        Left = 472
        Top = 90
        Width = 65
        Height = 17
        Caption = 'Semua'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        OnClick = chkSupplierClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 648
    ExplicitWidth = 648
    inherited lblHeader: TLabel
      Width = 155
      Caption = 'LISTING RECEIVING PRODUCT'
      ExplicitWidth = 155
    end
    inherited lblFilterData: TcxLabel
      Left = 294
      ExplicitLeft = 294
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 355
      ExplicitLeft = 355
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 471
      ExplicitLeft = 471
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 566
      ExplicitLeft = 566
    end
    inherited lblsdFilter: TcxLabel
      Left = 447
      ExplicitLeft = 447
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 402
    Width = 648
    ExplicitTop = 334
    ExplicitWidth = 648
    inherited pnlFooter: TPanel
      Width = 648
      ExplicitWidth = 648
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
        Left = 571
        Action = actClose
        ExplicitLeft = 571
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 648
      ExplicitWidth = 648
      inherited lbEscape: TLabel
        Left = 574
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
