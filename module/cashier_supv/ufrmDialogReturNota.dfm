inherited frmDialogReturNota: TfrmDialogReturNota
  Left = 270
  Top = 127
  Caption = 'frmDialogReturNota'
  ClientHeight = 468
  ClientWidth = 706
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 722
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 706
    Height = 412
    ExplicitWidth = 706
    ExplicitHeight = 412
    inherited cxGrid: TcxGrid
      Top = 111
      Width = 702
      Height = 270
      TabOrder = 1
      ExplicitTop = 111
      ExplicitWidth = 702
      ExplicitHeight = 299
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 702
      Height = 109
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 10
        Top = 8
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lbl3: TLabel
        Left = 10
        Top = 33
        Width = 43
        Height = 16
        Caption = 'No Trans'
      end
      object lbl5: TLabel
        Left = 10
        Top = 54
        Width = 67
        Height = 16
        Caption = 'Member Code'
      end
      object lbl4: TLabel
        Left = 10
        Top = 81
        Width = 55
        Height = 16
        Caption = 'Retur Note'
      end
      object dtReturDate: TcxDateEdit
        Left = 102
        Top = 6
        TabOrder = 0
        Width = 97
      end
      object edtMemberCode: TEdit
        Left = 102
        Top = 54
        Width = 109
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtMemberName: TEdit
        Left = 213
        Top = 54
        Width = 260
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtReturNote: TEdit
        Left = 102
        Top = 78
        Width = 371
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtNoTrans: TcxButtonEdit
        Left = 102
        Top = 30
        Properties.Buttons = <>
        TabOrder = 1
        Text = '0'
        OnKeyDown = edtNoTransKeyDown
        Width = 109
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 381
      Width = 702
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 11
      ExplicitTop = 259
      ExplicitWidth = 680
      object lbl7: TLabel
        Left = 469
        Top = 6
        Width = 55
        Height = 16
        Caption = 'Total Retur'
        Visible = False
      end
      object Label1: TLabel
        Left = 80
        Top = 0
        Width = 325
        Height = 16
        Caption = 
          'F5 [Lookup Item]  ||  Ctrl+T[Add Row]  ||  Ctrl + R[Remove Row] ' +
          ' '
      end
      object lbl8: TcxLabel
        Left = 7
        Top = 1
        Cursor = crHandPoint
        Caption = 'Payment (F9)'
        Enabled = False
        ParentFont = False
        Transparent = True
        Visible = False
        OnClick = lbl8Click
      end
      object curredtTotalRetur: TcxCurrencyEdit
        Left = 527
        Top = 3
        TabOrder = 0
        Visible = False
        Width = 154
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 412
    Width = 706
    ExplicitTop = 412
    ExplicitWidth = 706
    inherited pnlFooter: TPanel
      Width = 706
      ExplicitWidth = 706
      inherited btnClose: TcxButton
        Left = 629
        Action = actCancel
        ExplicitLeft = 629
      end
      inherited btnSave: TcxButton
        Left = 536
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 536
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 459
        ExplicitLeft = 459
      end
    end
    inherited pnlSortCut: TPanel
      Width = 706
      ExplicitWidth = 706
      inherited lbCTRLEnter: TLabel
        Left = 531
        Height = 15
        ExplicitLeft = 531
      end
      inherited lbEscape: TLabel
        Left = 622
        Height = 15
        ExplicitLeft = 622
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 455
        ExplicitLeft = 455
      end
    end
  end
end
