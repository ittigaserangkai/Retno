inherited frmDialogDetailSO: TfrmDialogDetailSO
  Left = 210
  Top = 156
  Caption = 'Detail SO'
  ClientHeight = 388
  ClientWidth = 781
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 797
  ExplicitHeight = 427
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 781
    Height = 332
    ExplicitWidth = 781
    ExplicitHeight = 332
    inherited cxGrid: TcxGrid
      Top = 37
      Width = 777
      Height = 237
      TabOrder = 1
      ExplicitTop = 37
      ExplicitWidth = 777
      ExplicitHeight = 293
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 777
      Height = 35
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 6
        Width = 33
        Height = 16
        Caption = 'SO No.'
      end
      object lbl2: TLabel
        Left = 169
        Top = 6
        Width = 40
        Height = 16
        Caption = 'SO Date'
      end
      object lbl5: TLabel
        Left = 615
        Top = 6
        Width = 45
        Height = 16
        Caption = 'Group By'
      end
      object edtSO_NO: TEdit
        Left = 42
        Top = 5
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object dtSO: TcxDateEdit
        Left = 211
        Top = 5
        TabOrder = 1
        Width = 94
      end
      object cbb1: TComboBox
        Left = 666
        Top = 5
        Width = 99
        Height = 24
        BevelKind = bkSoft
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 2
        Text = 'Supplier'
        OnCloseUp = cbb1CloseUp
        Items.Strings = (
          'Supplier'
          'BKP/BTKP')
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 274
      Width = 777
      Height = 56
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitLeft = 11
      ExplicitTop = 226
      ExplicitWidth = 755
      DesignSize = (
        777
        56)
      object lbl3: TLabel
        Left = 7
        Top = 6
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object lbl4: TLabel
        Left = 320
        Top = 30
        Width = 23
        Height = 16
        Caption = 'UOM'
      end
      object lbl6: TLabel
        Left = 6
        Top = 30
        Width = 43
        Height = 16
        Caption = 'Kategori'
      end
      object Label1: TLabel
        Left = 526
        Top = 6
        Width = 122
        Height = 16
        Caption = 'Add PLU into Existing SO'
        Visible = False
      end
      object lblDeleteRow: TcxLabel
        Left = 527
        Top = 35
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Caption = 'Exclude Row from Existing SO [Ctrl-D]'
        ParentFont = False
        Transparent = True
        Visible = False
        OnClick = lblDeleteRowClick
      end
      object edtProductName: TEdit
        Left = 89
        Top = 4
        Width = 352
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtCodeUOM: TEdit
        Left = 345
        Top = 28
        Width = 34
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'PCS'
      end
      object edtNameUOM: TEdit
        Left = 380
        Top = 28
        Width = 61
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'PIECES'
      end
      object edtMerGrup: TEdit
        Left = 89
        Top = 29
        Width = 216
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtAddPLU: TEdit
        Left = 656
        Top = 4
        Width = 97
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
        OnKeyUp = edtAddPLUKeyUp
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 332
    Width = 781
    ExplicitTop = 332
    ExplicitWidth = 781
    inherited pnlFooter: TPanel
      Width = 781
      ExplicitWidth = 781
      inherited btnClose: TcxButton
        Left = 699
        Caption = 'Close'
        ExplicitLeft = 699
      end
      inherited btnSave: TcxButton
        Left = 612
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 612
      end
    end
    inherited pnlSortCut: TPanel
      Width = 781
      ExplicitWidth = 781
      inherited lbl4: TLabel
        Left = 592
        ExplicitLeft = 594
      end
      inherited lbl5: TLabel
        Left = 686
        Width = 72
        Caption = 'Escape [Close]'
        ExplicitLeft = 688
        ExplicitWidth = 72
      end
    end
  end
end
