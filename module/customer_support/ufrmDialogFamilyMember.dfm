inherited frmDialogFamilyMember: TfrmDialogFamilyMember
  Left = 230
  Caption = 'Dialog Family Member'
  ClientHeight = 307
  ClientWidth = 531
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 547
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 531
    Height = 251
    ExplicitWidth = 533
    ExplicitHeight = 277
    inherited cxGrid: TcxGrid
      Top = 43
      Width = 527
      Height = 177
      TabOrder = 2
      ExplicitLeft = 2
      ExplicitTop = 43
      ExplicitWidth = 529
      ExplicitHeight = 203
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'STATUS DLM KELUARGA'
          Width = 120
        end
        object cxGridViewColumn2: TcxGridDBColumn
          Caption = 'NAMA LENGKAP'
          Width = 156
        end
        object cxGridViewColumn3: TcxGridDBColumn
          Caption = 'TANGGAL LAHIR'
          Width = 93
        end
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 220
      Width = 527
      Height = 29
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitTop = 246
      ExplicitWidth = 529
      object lbl18: TcxLabel
        Left = 10
        Top = 8
        Caption = 'New Row (Ctrl + T)'
        ParentFont = False
        Transparent = True
        OnClick = lbl18Click
      end
      object lbl19: TcxLabel
        Left = 114
        Top = 8
        Caption = 'Remove Row (Ctrl + R)'
        ParentFont = False
        Transparent = True
        OnClick = lbl19Click
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 2
      Width = 527
      Height = 41
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitWidth = 529
      object lbl4: TLabel
        Left = 22
        Top = 12
        Width = 69
        Height = 16
        Caption = 'Member Name'
      end
      object lbl5: TLabel
        Left = 282
        Top = 12
        Width = 44
        Height = 16
        Caption = 'Card No.'
      end
      object edtMemberName: TEdit
        Left = 113
        Top = 9
        Width = 120
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtCardNo: TEdit
        Left = 337
        Top = 9
        Width = 120
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 251
    Width = 531
    ExplicitTop = 277
    ExplicitWidth = 533
    inherited pnlFooter: TPanel
      Width = 531
      ExplicitWidth = 533
      inherited btnClose: TcxButton
        Left = 449
        ExplicitLeft = 451
      end
      inherited btnSave: TcxButton
        Left = 362
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 364
      end
    end
    inherited pnlSortCut: TPanel
      Width = 531
      ExplicitWidth = 533
      inherited lbl4: TLabel
        Left = 335
        ExplicitLeft = 337
      end
      inherited lbl5: TLabel
        Left = 434
        ExplicitLeft = 436
      end
    end
  end
end
