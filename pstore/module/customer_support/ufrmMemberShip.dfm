inherited frmMemberShip: TfrmMemberShip
  Left = 264
  Top = 78
  Caption = 'MemberShip'
  ClientHeight = 522
  ClientWidth = 780
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 796
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 780
    Height = 433
    ExplicitWidth = 780
    ExplicitHeight = 433
    inherited pgcBrowse: TcxPageControl
      Top = 185
      Width = 758
      Height = 172
      TabOrder = 2
      ExplicitTop = 185
      ExplicitWidth = 758
      ExplicitHeight = 172
      ClientRectBottom = 171
      ClientRectRight = 757
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Top = 185
          Width = 758
          Height = 172
          ExplicitTop = 185
          ExplicitWidth = 758
          ExplicitHeight = 172
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'ID CARD NO.'
              Width = 84
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'MEMBER NAME'
              Width = 92
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'MEMBER ADDRESS'
              Width = 164
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'CARD TYPE'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'TYPE MEMBER'
              Width = 93
            end
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 758
      Height = 174
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblInput: TLabel
        Left = 24
        Top = 34
        Width = 71
        Height = 16
        Caption = 'Company Type'
      end
      object lblComboGrid: TLabel
        Left = 24
        Top = 8
        Width = 75
        Height = 16
        Caption = 'Company Name'
      end
      object lbl9: TLabel
        Left = 24
        Top = 62
        Width = 76
        Height = 16
        Caption = 'References No.'
      end
      object lbl8: TLabel
        Left = 24
        Top = 88
        Width = 38
        Height = 16
        Caption = 'N.P.W.P'
      end
      object lbl1: TLabel
        Left = 24
        Top = 116
        Width = 39
        Height = 16
        Caption = 'Address'
      end
      object lbl6: TLabel
        Left = 467
        Top = 35
        Width = 21
        Height = 16
        Caption = 'City'
      end
      object lbl7: TLabel
        Left = 467
        Top = 7
        Width = 49
        Height = 16
        Caption = 'Kelurahan'
      end
      object lbl10: TLabel
        Left = 467
        Top = 61
        Width = 49
        Height = 16
        Caption = 'Post Code'
      end
      object lbl11: TLabel
        Left = 467
        Top = 88
        Width = 49
        Height = 16
        Caption = 'Telephone'
      end
      object lbl12: TLabel
        Left = 467
        Top = 116
        Width = 38
        Height = 16
        Caption = 'Fax No.'
      end
      object lbl13: TLabel
        Left = 467
        Top = 142
        Width = 58
        Height = 16
        Caption = 'Doc. Status'
      end
      object lblDispPersonal: TcxLabel
        Left = 17
        Top = 150
        Cursor = crHandPoint
        Caption = 'F1 for Display Personal'
        ParentFont = False
        Transparent = True
        OnClick = lblDispPersonalClick
      end
      object lblDispFamily: TcxLabel
        Left = 140
        Top = 150
        Cursor = crHandPoint
        Caption = 'F2 for Display Family'
        ParentFont = False
        Transparent = True
        Visible = False
        OnClick = lblDispFamilyClick
      end
      object edtCompTypeName: TEdit
        Left = 189
        Top = 32
        Width = 210
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtCompName: TEdit
        Left = 104
        Top = 5
        Width = 210
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyUp = edtCompNameKeyUp
      end
      object edtAddress: TEdit
        Left = 104
        Top = 114
        Width = 293
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtNPWP: TEdit
        Left = 104
        Top = 86
        Width = 79
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtCompType: TEdit
        Left = 104
        Top = 32
        Width = 79
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtRefNoType: TEdit
        Left = 104
        Top = 59
        Width = 79
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtRefNo: TEdit
        Left = 189
        Top = 59
        Width = 165
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtKelurahan: TEdit
        Left = 547
        Top = 5
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtCity: TEdit
        Left = 547
        Top = 32
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtPostCode: TEdit
        Left = 547
        Top = 59
        Width = 79
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
      end
      object edtTelephone: TEdit
        Left = 547
        Top = 86
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
      end
      object edtFaxNo: TEdit
        Left = 547
        Top = 113
        Width = 140
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object edtDocStatus: TEdit
        Left = 547
        Top = 140
        Width = 79
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object btnShow: TcxButton
        Left = 328
        Top = 4
        Width = 65
        Height = 25
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300993300500019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300993300993300500019FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0000009933009933009933009933005000
          19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300CC6600993300CC66009933
          00500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600993300CC6600993300CC66
          00993300500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600CC6600CC6600CC6600CC66
          00CC6600663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900CC6600FF9900CC6600FF99
          00663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900FF99006633
          33FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900663333FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OptionsImage.NumGlyphs = 2
        TabOrder = 15
        OnClick = btnShowClick
      end
    end
    object pnl2: TPanel
      Left = 11
      Top = 357
      Width = 758
      Height = 65
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object lbl5: TLabel
        Left = 8
        Top = 36
        Width = 59
        Height = 16
        Caption = 'Card Status'
      end
      object lbl2: TLabel
        Left = 620
        Top = 11
        Width = 56
        Height = 16
        Caption = #39'MAIN'#39' Card'
      end
      object lbl4: TLabel
        Left = 360
        Top = 36
        Width = 51
        Height = 16
        Caption = 'Valid From'
      end
      object lbl3: TLabel
        Left = 360
        Top = 11
        Width = 45
        Height = 16
        Caption = 'Reg Date'
      end
      object lbl14: TLabel
        Left = 8
        Top = 11
        Width = 71
        Height = 16
        Caption = 'Printed Status'
      end
      object lbl15: TLabel
        Left = 504
        Top = 36
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object lbl16: TLabel
        Left = 620
        Top = 36
        Width = 61
        Height = 16
        Caption = #39'SUPLL'#39' Card'
      end
      object lbl17: TLabel
        Left = 169
        Top = 15
        Width = 74
        Height = 16
        Caption = 'Member Status'
      end
      object lbl18: TLabel
        Left = 169
        Top = 39
        Width = 64
        Height = 16
        Caption = 'Amt. Transct'
      end
      object edtCardStatus: TEdit
        Left = 84
        Top = 34
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object edtTotalMain: TEdit
        Left = 682
        Top = 9
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
        Text = '0'
      end
      object dtValidFrom: TcxDateEdit
        Left = 416
        Top = 34
        TabOrder = 5
        Width = 80
      end
      object dtValidTo: TcxDateEdit
        Left = 524
        Top = 34
        TabOrder = 6
        Width = 80
      end
      object dtRegister: TcxDateEdit
        Left = 416
        Top = 9
        TabOrder = 4
        Width = 80
      end
      object edtPrintedStatus: TEdit
        Left = 84
        Top = 9
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object edtTotalSuppl: TEdit
        Left = 682
        Top = 34
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
        Text = '0'
      end
      object edtMemberStatus: TEdit
        Left = 248
        Top = 9
        Width = 105
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = '0'
      end
      object edtTotalTransaction: TcxCurrencyEdit
        Left = 248
        Top = 34
        TabOrder = 3
        Width = 105
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited lblHeader: TLabel
      Width = 95
      Caption = 'List MemberShip'
      ExplicitWidth = 95
    end
    inherited lblFilterData: TcxLabel
      Left = 426
      ExplicitLeft = 426
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 487
      ExplicitLeft = 487
      ExplicitHeight = 24
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 603
      ExplicitLeft = 603
      ExplicitHeight = 24
    end
    inherited btnSearch: TcxButton
      Left = 698
      ExplicitLeft = 698
    end
    inherited lblsdFilter: TcxLabel
      Left = 579
      ExplicitLeft = 579
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 466
    Width = 780
    ExplicitTop = 466
    ExplicitWidth = 780
    inherited pnlFooter: TPanel
      Width = 780
      ExplicitWidth = 780
      inherited btnAdd: TcxButton
        Action = actAddMemberShip
      end
      inherited btnUpdate: TcxButton
        Action = actEditMemberShip
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 698
        Action = actClose
        ExplicitLeft = 698
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
      end
    end
  end
  object actlst1: TActionList
    Left = 707
    Top = 49
    object actAddMemberShip: TAction
      Caption = 'Add'
      OnExecute = actAddMemberShipExecute
    end
    object actEditMemberShip: TAction
      Caption = 'Edit'
      OnExecute = actEditMemberShipExecute
    end
    object actDeleteMemberShip: TAction
      Caption = 'Delete'
      OnExecute = actDeleteMemberShipExecute
    end
    object actRefreshMemberShip: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshMemberShipExecute
    end
  end
end
