inherited frmWastageReal: TfrmWastageReal
  Left = 240
  Top = 134
  Caption = 'Wastage Damage / Real'
  ClientHeight = 493
  ClientWidth = 708
  OldCreateOrder = True
  ExplicitWidth = 724
  ExplicitHeight = 532
  PixelsPerInch = 96
  TextHeight = 16
  object lblXXX: TLabel [0]
    Left = 312
    Top = 112
    Width = 31
    Height = 16
    Caption = 'lblXXX'
  end
  inherited pnlBody: TPanel
    Width = 708
    Height = 404
    ExplicitWidth = 708
    ExplicitHeight = 404
    inherited pgcBrowse: TcxPageControl
      Top = 104
      Width = 706
      Height = 299
      TabOrder = 1
      ExplicitTop = 104
      ExplicitWidth = 706
      ExplicitHeight = 299
      ClientRectBottom = 298
      ClientRectRight = 705
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 704
        ExplicitHeight = 297
        inherited cxGrid: TcxGrid
          Width = 704
          Height = 264
          ExplicitWidth = 704
          ExplicitHeight = 264
          inherited cxGridView: TcxGridDBTableView
            object cxcolKODEBARANG: TcxGridDBColumn
              Caption = 'KODE BARANG'
            end
            object cxcolALIASBARANG: TcxGridDBColumn
              Caption = 'ALIAS BARANG'
            end
            object cxcolUOM: TcxGridDBColumn
              Caption = 'UOM'
            end
            object cxcolQTY: TcxGridDBColumn
              Caption = 'QTY'
            end
          end
        end
        object pnl4: TPanel
          Left = 0
          Top = 264
          Width = 704
          Height = 33
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object lbl7: TLabel
            Left = 4
            Top = 4
            Width = 69
            Height = 16
            Caption = 'Product Name'
          end
          object edtProductName: TEdit
            Left = 77
            Top = 5
            Width = 556
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 706
      Height = 103
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 29
        Top = 27
        Width = 86
        Height = 16
        Caption = 'Transaction Date'
      end
      object lbl2: TLabel
        Left = 36
        Top = 4
        Width = 79
        Height = 16
        Caption = 'Transaction No.'
      end
      object lbl3: TLabel
        Left = 524
        Top = 1
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lbl4: TLabel
        Left = 92
        Top = 51
        Width = 24
        Height = 16
        Caption = 'Note'
      end
      object lbl6: TLabel
        Left = 551
        Top = 25
        Width = 18
        Height = 16
        Caption = 'PPn'
      end
      object lbl10: TLabel
        Left = 529
        Top = 49
        Width = 39
        Height = 16
        Caption = 'PPn. BM'
      end
      object lbl11: TLabel
        Left = 498
        Top = 72
        Width = 70
        Height = 16
        Caption = 'Total Wastage'
      end
      object Label1: TLabel
        Left = 273
        Top = 6
        Width = 20
        Height = 16
        Caption = '[F5]'
      end
      object dtTgl: TcxDateEdit
        Left = 119
        Top = 28
        TabOrder = 1
        Width = 147
      end
      object curredtSubTotal: TcxCurrencyEdit
        Left = 573
        Top = 3
        TabOrder = 3
        Width = 121
      end
      object mmoNote: TMemo
        Left = 119
        Top = 54
        Width = 348
        Height = 41
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object curredtPPN: TcxCurrencyEdit
        Left = 573
        Top = 27
        TabOrder = 4
        Width = 121
      end
      object curredtPPNBM: TcxCurrencyEdit
        Left = 573
        Top = 51
        TabOrder = 5
        Width = 121
      end
      object curredtTotWastage: TcxCurrencyEdit
        Left = 573
        Top = 75
        TabOrder = 6
        Width = 121
      end
      object edtWastageNo: TEdit
        Left = 119
        Top = 3
        Width = 147
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyUp = edtWastageNoKeyUp
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 708
    ExplicitWidth = 708
    inherited lblFilterData: TcxLabel
      Left = 354
      ExplicitLeft = 354
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 415
      ExplicitLeft = 415
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 531
      ExplicitLeft = 531
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited lblsdFilter: TcxLabel
      Left = 507
      ExplicitLeft = 507
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 437
    Width = 708
    ExplicitTop = 437
    ExplicitWidth = 708
    inherited pnlFooter: TPanel
      Width = 708
      ExplicitWidth = 708
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
        Left = 631
        Action = actClose
        ExplicitLeft = 631
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 708
      ExplicitWidth = 708
      inherited lbEscape: TLabel
        Left = 634
        Height = 17
        ExplicitLeft = 634
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
