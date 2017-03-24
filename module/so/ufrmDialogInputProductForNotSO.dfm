inherited frmDialogInputProductForNotSO: TfrmDialogInputProductForNotSO
  Left = 370
  Top = 151
  Caption = 'frmDialogInputProductForNotSO'
  ClientHeight = 375
  ClientWidth = 484
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 500
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 484
    Height = 319
    ExplicitWidth = 484
    ExplicitHeight = 319
    inherited cxGrid: TcxGrid
      Top = 57
      Width = 480
      Height = 260
      TabOrder = 1
      ExplicitTop = 57
      ExplicitWidth = 480
      ExplicitHeight = 260
    end
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 480
      Height = 55
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 13
        Width = 71
        Height = 16
        Caption = 'Supplier Code:'
      end
      object edtCode: TEdit
        Left = 12
        Top = 29
        Width = 69
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'edtCode'
        Visible = False
      end
      object edtName: TEdit
        Left = 176
        Top = 13
        Width = 233
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtKode: TcxButtonEdit
        Left = 92
        Top = 12
        Enabled = False
        Properties.Buttons = <
          item
          end>
        TabOrder = 0
        Text = '0'
        Width = 81
      end
      object lblHapus: TcxLabel
        Left = 311
        Top = 38
        Cursor = crHandPoint
        Caption = 'Hapus Baris [Ctrl-R]'
        ParentFont = False
        Transparent = True
        OnClick = lblHapusClick
      end
      object lblTambah: TcxLabel
        Left = 199
        Top = 38
        Cursor = crHandPoint
        Caption = 'Tambah Grid [Ctrl-T]'
        ParentFont = False
        Transparent = True
        OnClick = lblTambahClick
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 319
    Width = 484
    ExplicitTop = 319
    ExplicitWidth = 484
    inherited pnlFooter: TPanel
      Width = 484
      ExplicitWidth = 484
      inherited btnClose: TcxButton
        Left = 407
        Action = actCancel
        ExplicitLeft = 407
      end
      inherited btnSave: TcxButton
        Left = 314
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 314
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        OnClick = btnDeleteClick
      end
    end
    inherited pnlSortCut: TPanel
      Width = 484
      ExplicitWidth = 484
      inherited lbCTRLEnter: TLabel
        Left = 309
        Height = 15
        ExplicitLeft = 309
      end
      inherited lbEscape: TLabel
        Left = 400
        Height = 15
        ExplicitLeft = 400
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
end
