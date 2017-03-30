inherited frmMemberActivation: TfrmMemberActivation
  Left = 260
  Top = 125
  BorderStyle = bsSingle
  Caption = 'Member Activation'
  ClientHeight = 482
  ClientWidth = 670
  OldCreateOrder = True
  ExplicitWidth = 676
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 670
    Height = 393
    BorderWidth = 0
    ExplicitWidth = 670
    ExplicitHeight = 337
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 61
      Width = 668
      Height = 215
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 61
      ExplicitWidth = 668
      ExplicitHeight = 159
      ClientRectBottom = 214
      ClientRectRight = 667
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 666
        ExplicitHeight = 157
        inherited cxGrid: TcxGrid
          Top = 25
          Width = 666
          Height = 188
          ExplicitWidth = 666
          ExplicitHeight = 157
        end
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          BorderWidth = 20
          Caption = 'pnl1'
          TabOrder = 1
          object lblCheckAll: TcxLabel
            Left = 6
            Top = 3
            Cursor = crHandPoint
            Caption = 'Check All'
            ParentFont = False
            Transparent = True
            OnClick = lblCheckAllClick
          end
          object lblClearAll: TcxLabel
            Left = 57
            Top = 3
            Cursor = crHandPoint
            Caption = 'Clear All'
            ParentFont = False
            Transparent = True
            OnClick = lblClearAllClick
          end
        end
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 276
      Width = 668
      Height = 116
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 220
      object lbl5: TLabel
        Left = 9
        Top = 36
        Width = 58
        Height = 16
        Caption = 'Doc. Status'
      end
      object lbl4: TLabel
        Left = 9
        Top = 90
        Width = 75
        Height = 16
        Caption = 'Valid >>    From'
      end
      object lbl3: TLabel
        Left = 9
        Top = 63
        Width = 69
        Height = 16
        Caption = 'Register Date'
      end
      object lbl14: TLabel
        Left = 369
        Top = 9
        Width = 71
        Height = 16
        Caption = 'Printed Status'
      end
      object lbl15: TLabel
        Left = 192
        Top = 90
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object lbl17: TLabel
        Left = 9
        Top = 9
        Width = 75
        Height = 16
        Caption = 'Company Name'
      end
      object lbl2: TLabel
        Left = 369
        Top = 36
        Width = 87
        Height = 16
        Caption = 'Member Card Fee'
      end
      object edtDocStatus: TEdit
        Left = 96
        Top = 33
        Width = 91
        Height = 22
        Ctl3D = False
        Enabled = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object dtValidFrom: TcxDateEdit
        Left = 96
        Top = 87
        TabOrder = 4
        Width = 89
      end
      object dtValidTo: TcxDateEdit
        Left = 213
        Top = 87
        TabOrder = 5
        Width = 89
      end
      object dtRegister: TcxDateEdit
        Left = 96
        Top = 60
        TabOrder = 2
        Width = 89
      end
      object edtPrintedStatus: TEdit
        Left = 468
        Top = 6
        Width = 109
        Height = 22
        Ctl3D = False
        Enabled = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtCompName: TEdit
        Left = 96
        Top = 6
        Width = 206
        Height = 22
        Ctl3D = False
        Enabled = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtMemberCardFee: TcxCurrencyEdit
        Left = 468
        Top = 33
        TabOrder = 6
        Width = 109
      end
      object mmo1: TMemo
        Left = 373
        Top = 62
        Width = 289
        Height = 47
        TabStop = False
        Alignment = taCenter
        Color = 33023
        Ctl3D = False
        Lines.Strings = (
          'Member Yang Bisa Activasi/Reactivasi Adalah Yang '
          'Statusnya Not Active')
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 668
      Height = 60
      Align = alTop
      Anchors = [akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object edCompany: TcxButtonEdit
        Left = 144
        Top = 30
        ParentFont = False
        Properties.Buttons = <>
        TabOrder = 0
        Text = '[Select Company]'
        OnEnter = edCompanyEnter
        OnExit = edCompanyExit
        OnKeyPress = edtCardNoKeyPress
        Width = 226
      end
      object edtCardNo: TcxButtonEdit
        Left = 144
        Top = 6
        ParentFont = False
        Properties.Buttons = <>
        TabOrder = 1
        Text = '[Input Card Number]'
        OnEnter = edtCardNoEnter
        OnExit = edtCardNoExit
        OnKeyPress = edtCardNoKeyPress
        Width = 130
      end
      object rbByMember: TRadioButton
        Left = 9
        Top = 9
        Width = 113
        Height = 17
        Caption = 'By Card Number'
        Checked = True
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        TabStop = True
      end
      object rbBySelected: TRadioButton
        Left = 9
        Top = 33
        Width = 127
        Height = 17
        Caption = 'By Selected Member'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 670
    ExplicitWidth = 670
    inherited lblHeader: TLabel
      Width = 104
      Caption = 'Member Activation'
      ExplicitWidth = 104
    end
    inherited lblFilterData: TcxLabel
      Left = 316
      ExplicitLeft = 316
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 377
      ExplicitLeft = 377
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 493
      ExplicitLeft = 493
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 588
      ExplicitLeft = 588
    end
    inherited lblsdFilter: TcxLabel
      Left = 469
      ExplicitLeft = 469
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 426
    Width = 670
    ExplicitTop = 370
    ExplicitWidth = 670
    inherited pnlFooter: TPanel
      Width = 670
      ExplicitWidth = 670
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Visible = False
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 593
        Action = actClose
        ExplicitLeft = 593
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 670
      ExplicitWidth = 670
      inherited lbEscape: TLabel
        Left = 596
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      Caption = 'Activate (F9)'
      OnExecute = actAddExecute
    end
  end
  object actlst1: TActionList
    Left = 118
    object actMemberActivation: TAction
      Caption = 'actMemberActivation'
    end
  end
end
