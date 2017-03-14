inherited frmCrazyPriceDialog: TfrmCrazyPriceDialog
  Left = 167
  Top = 210
  Caption = 'Dialog Crazy Price'
  ClientHeight = 422
  ClientWidth = 755
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 771
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 755
    Height = 366
    ExplicitWidth = 755
    ExplicitHeight = 366
    inherited cxGrid: TcxGrid
      Top = 169
      Width = 751
      Height = 195
      TabOrder = 1
      ExplicitTop = 169
      ExplicitWidth = 751
      ExplicitHeight = 195
    end
    object pnl2: TPanel
      Left = 2
      Top = 2
      Width = 751
      Height = 167
      Align = alTop
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 0
      object lbl3: TLabel
        Left = 290
        Top = 139
        Width = 51
        Height = 16
        Caption = 'Mark Up %'
        Visible = False
      end
      object lbl7: TLabel
        Left = 20
        Top = 36
        Width = 67
        Height = 16
        Caption = 'Product Code'
      end
      object lbl9: TLabel
        Left = 20
        Top = 62
        Width = 23
        Height = 16
        Caption = 'UOM'
      end
      object lbl11: TLabel
        Left = 20
        Top = 140
        Width = 58
        Height = 16
        Caption = 'Crazy Price'
      end
      object lbl10: TLabel
        Left = 20
        Top = 115
        Width = 69
        Height = 16
        Caption = 'Average price'
      end
      object lbl1: TLabel
        Left = 20
        Top = 90
        Width = 55
        Height = 16
        Caption = 'Store Price'
      end
      object lbl2: TLabel
        Left = 290
        Top = 115
        Width = 62
        Height = 16
        Caption = 'Disc Nominal'
      end
      object lbl4: TLabel
        Left = 290
        Top = 91
        Width = 31
        Height = 16
        Caption = 'Disc %'
      end
      object Label1: TLabel
        Left = 20
        Top = 9
        Width = 54
        Height = 16
        Caption = 'Tipe Harga'
      end
      object edtCode: TEdit
        Left = 92
        Top = 36
        Width = 88
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyUp = edtCodeKeyUp
      end
      object edtName: TEdit
        Left = 183
        Top = 36
        Width = 322
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtDisc: TcxCurrencyEdit
        Left = 362
        Top = 139
        TabOrder = 9
        Visible = False
        Width = 88
      end
      object edtCrazyPrice: TcxCurrencyEdit
        Left = 92
        Top = 140
        TabOrder = 6
        OnExit = edtCrazyPriceExit
        OnKeyDown = edtCrazyPriceKeyDown
        Width = 178
      end
      object edtConValue: TcxCurrencyEdit
        Left = 183
        Top = 63
        TabOrder = 3
        Width = 87
      end
      object cbbUOM: TComboBox
        Left = 92
        Top = 62
        Width = 86
        Height = 24
        BevelKind = bkSoft
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnChange = cbbUOMChange
        OnKeyPress = cbbUOMKeyPress
      end
      object curredtStorePrice: TcxCurrencyEdit
        Left = 92
        Top = 90
        TabOrder = 4
        Width = 178
      end
      object curredtPriceDisc: TcxCurrencyEdit
        Left = 92
        Top = 115
        TabOrder = 5
        Width = 178
      end
      object edtDiscPersen: TcxCurrencyEdit
        Left = 362
        Top = 91
        TabOrder = 7
        OnExit = edtDiscPersenExit
        OnKeyDown = edtDiscPersenKeyDown
        Width = 88
      end
      object curredtDiscNominal: TcxCurrencyEdit
        Left = 362
        Top = 115
        TabOrder = 8
        OnExit = curredtDiscNominalExit
        OnKeyDown = curredtDiscNominalKeyDown
        Width = 88
      end
      object cbTipeHarga: TComboBox
        Left = 92
        Top = 9
        Width = 173
        Height = 24
        BevelKind = bkSoft
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
      end
      object btnAdd: TcxButton
        AlignWithMargins = True
        Left = 455
        Top = 132
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Margins.Top = 2
        Margins.Right = 20
        Margins.Bottom = 2
        Caption = 'Add'
        OptionsImage.ImageIndex = 0
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 11
        DragKind = dkDock
        OnClick = btnAddClick
      end
      object btnRemove: TcxButton
        AlignWithMargins = True
        Left = 542
        Top = 132
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Remove'
        OptionsImage.ImageIndex = 4
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 12
        DragKind = dkDock
        OnClick = btnRemoveClick
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 366
    Width = 755
    ExplicitTop = 366
    ExplicitWidth = 755
    inherited pnlFooter: TPanel
      Width = 755
      ExplicitWidth = 755
      inherited btnClose: TcxButton
        Left = 678
        ExplicitLeft = 678
      end
      inherited btnSave: TcxButton
        Left = 575
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 575
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 755
      ExplicitWidth = 755
      inherited lbCTRLEnter: TLabel
        Left = 162
        Width = 503
        Alignment = taRightJustify
        Caption = 
          'Ctrl-T [Add]        Ctrl-R [Remove]                             ' +
          '                                                         Ctrl-En' +
          'ter [Save]'
        ExplicitLeft = 162
        ExplicitWidth = 503
      end
      inherited lbEscape: TLabel
        Left = 671
        ExplicitLeft = 671
      end
    end
  end
end
