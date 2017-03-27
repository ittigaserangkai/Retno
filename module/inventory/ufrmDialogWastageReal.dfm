inherited frmDialogWastageReal: TfrmDialogWastageReal
  Left = 299
  Top = 210
  Caption = 'frmDialogWastageReal'
  ClientHeight = 425
  ClientWidth = 684
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 700
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 684
    Height = 369
    ExplicitWidth = 684
    ExplicitHeight = 369
    inherited cxGrid: TcxGrid
      Top = 111
      Width = 680
      Height = 256
      TabOrder = 1
      ExplicitTop = 111
      ExplicitWidth = 680
      ExplicitHeight = 256
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
        end
        object cxGridViewColumn2: TcxGridDBColumn
        end
      end
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 680
      Height = 109
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl2: TLabel
        Left = 36
        Top = 8
        Width = 79
        Height = 16
        Caption = 'Transaction No.'
      end
      object lbl1: TLabel
        Left = 29
        Top = 31
        Width = 86
        Height = 16
        Caption = 'Transaction Date'
      end
      object lbl4: TLabel
        Left = 92
        Top = 53
        Width = 24
        Height = 16
        Caption = 'Note'
      end
      object lbl3: TLabel
        Left = 499
        Top = 5
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl7: TLabel
        Left = 526
        Top = 29
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl10: TLabel
        Left = 504
        Top = 53
        Width = 39
        Height = 16
        Caption = 'PPn. BM'
      end
      object lbl11: TLabel
        Left = 473
        Top = 76
        Width = 70
        Height = 16
        Caption = 'Total Wastage'
      end
      object dtTgl: TcxDateEdit
        Left = 118
        Top = 32
        TabOrder = 1
        Width = 97
      end
      object curredtSubTotal: TcxCurrencyEdit
        Left = 547
        Top = 7
        TabStop = False
        TabOrder = 3
        Width = 121
      end
      object curredtPPN: TcxCurrencyEdit
        Left = 547
        Top = 31
        TabStop = False
        TabOrder = 4
        Width = 121
      end
      object curredtPPNBM: TcxCurrencyEdit
        Left = 547
        Top = 55
        TabStop = False
        TabOrder = 5
        Width = 121
      end
      object curredtTotalWastage: TcxCurrencyEdit
        Left = 547
        Top = 79
        TabStop = False
        TabOrder = 6
        Width = 121
      end
      object edtTransNo: TEdit
        Left = 118
        Top = 8
        Width = 131
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        MaxLength = 16
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnKeyUp = edtTransNoKeyUp
      end
      object edtNote: TEdit
        Left = 118
        Top = 56
        Width = 307
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 512
        ParentCtl3D = False
        TabOrder = 2
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 369
    Width = 684
    ExplicitTop = 369
    ExplicitWidth = 684
    inherited pnlFooter: TPanel
      Width = 684
      ExplicitWidth = 684
      inherited btnClose: TcxButton
        Left = 607
        Action = actCancel
        ExplicitLeft = 607
      end
      inherited btnSave: TcxButton
        Left = 514
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 514
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 437
        ExplicitLeft = 437
      end
    end
    inherited pnlSortCut: TPanel
      Width = 684
      ExplicitWidth = 684
      inherited lbCTRLEnter: TLabel
        Left = 293
        Width = 301
        Height = 15
        Alignment = taRightJustify
        Caption = 'Add Row [Ctrl + T]    Delete Row [Ctrl + R]    Ctrl-Enter [Save]'
        ExplicitLeft = 293
        ExplicitWidth = 301
      end
      inherited lbEscape: TLabel
        Left = 600
        Height = 15
        ExplicitLeft = 600
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 217
        ExplicitLeft = 217
      end
    end
  end
end
