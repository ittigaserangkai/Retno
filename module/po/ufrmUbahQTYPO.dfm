inherited frmUbahQTYPO: TfrmUbahQTYPO
  Left = 284
  Top = 208
  Caption = ''
  ClientHeight = 379
  ClientWidth = 672
  ExplicitWidth = 688
  ExplicitHeight = 418
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 672
    Height = 290
    ExplicitWidth = 669
    ExplicitHeight = 290
    inherited pgcBrowse: TcxPageControl
      Top = 100
      Width = 650
      Height = 179
      TabOrder = 1
      ExplicitTop = 100
      ExplicitWidth = 647
      ExplicitHeight = 179
      ClientRectBottom = 178
      ClientRectRight = 649
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 645
        ExplicitHeight = 177
        inherited cxGrid: TcxGrid
          Width = 648
          Height = 177
          ExplicitWidth = 645
          ExplicitHeight = 177
        end
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 650
      Height = 89
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 647
      object lbl1: TLabel
        Left = 12
        Top = 11
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object lbl2: TLabel
        Left = 12
        Top = 36
        Width = 47
        Height = 16
        Caption = 'Referensi'
      end
      object lbl3: TLabel
        Left = 12
        Top = 61
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lbl4: TLabel
        Left = 252
        Top = 11
        Width = 48
        Height = 16
        Caption = 'Nomor SO'
      end
      object lbl5: TLabel
        Left = 252
        Top = 36
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object Label1: TLabel
        Left = 212
        Top = 11
        Width = 20
        Height = 16
        Caption = '[F5]'
      end
      object edtPONO: TcxButtonEdit
        Left = 83
        Top = 8
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        OnKeyUp = edtPONOKeyUp
        Width = 121
      end
      object dtTanggal: TcxDateEdit
        Left = 315
        Top = 32
        EditValue = 39730.4469977894d
        Enabled = False
        TabOrder = 4
        Width = 145
      end
      object edtREF: TEdit
        Left = 83
        Top = 33
        Width = 121
        Height = 22
        Color = clCream
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtSONO: TEdit
        Left = 315
        Top = 8
        Width = 143
        Height = 22
        Color = clCream
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtDesc: TEdit
        Left = 83
        Top = 58
        Width = 375
        Height = 22
        Color = clCream
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object btnTesting: TButton
        Left = 472
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Testing'
        TabOrder = 5
        Visible = False
        OnClick = btnTestingClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 672
    ExplicitWidth = 669
    inherited lblFilterData: TcxLabel
      Left = 318
      ExplicitLeft = 315
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 379
      ExplicitLeft = 376
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 495
      ExplicitLeft = 492
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 590
      ExplicitLeft = 587
    end
    inherited lblsdFilter: TcxLabel
      Left = 471
      ExplicitLeft = 468
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 323
    Width = 672
    ExplicitTop = 323
    ExplicitWidth = 669
    inherited pnlFooter: TPanel
      Width = 672
      ExplicitWidth = 669
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
        Left = 595
        Action = actClose
        ExplicitLeft = 592
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 672
      ExplicitWidth = 669
      inherited lbEscape: TLabel
        Left = 598
        Height = 17
        ExplicitLeft = 595
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
