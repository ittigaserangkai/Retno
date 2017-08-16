inherited frmDialogClaim: TfrmDialogClaim
  Caption = 'Claim'
  ClientHeight = 447
  ClientWidth = 844
  ExplicitWidth = 860
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 844
    Height = 391
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 834
      Height = 180
      Align = alTop
      TabOrder = 0
      object lblSupplier: TLabel
        Left = 16
        Top = 17
        Width = 57
        Height = 16
        Caption = 'Supplier MG'
      end
      object lblTTF: TLabel
        Left = 39
        Top = 45
        Width = 34
        Height = 16
        Caption = 'TTF No'
      end
      object lblTgkClaim: TLabel
        Left = 49
        Top = 73
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lblDescription: TLabel
        Left = 15
        Top = 101
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lblDO: TLabel
        Left = 377
        Top = 17
        Width = 81
        Height = 16
        Caption = 'Goods Receiving'
      end
      object lblAdj: TLabel
        Left = 401
        Top = 45
        Width = 57
        Height = 16
        Caption = 'Adjustment'
      end
      object lblCN: TLabel
        Left = 444
        Top = 73
        Width = 14
        Height = 16
        Caption = 'CN'
      end
      object lblDN: TLabel
        Left = 444
        Top = 101
        Width = 14
        Height = 16
        Caption = 'DN'
      end
      object lblOther: TLabel
        Left = 428
        Top = 129
        Width = 30
        Height = 16
        Caption = 'Other'
      end
      object lblTotal: TLabel
        Left = 434
        Top = 157
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object cbbSupplierMG: TcxExtLookupComboBox
        Left = 83
        Top = 13
        TabOrder = 0
        Width = 270
      end
      object dtTglClaim: TcxDateEdit
        Left = 83
        Top = 69
        TabOrder = 1
        Width = 121
      end
      object edTTFNo: TcxTextEdit
        Left = 83
        Top = 41
        TabOrder = 2
        Text = 'edTTFNo'
        Width = 121
      end
      object edNomGR: TcxCurrencyEdit
        Left = 464
        Top = 13
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 3
        Width = 153
      end
      object edNomAdj: TcxCurrencyEdit
        Left = 464
        Top = 41
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 4
        Width = 153
      end
      object edCN: TcxCurrencyEdit
        Left = 464
        Top = 69
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 5
        Width = 153
      end
      object edDN: TcxCurrencyEdit
        Left = 464
        Top = 97
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 6
        Width = 153
      end
      object edOther: TcxCurrencyEdit
        Left = 464
        Top = 125
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 7
        Width = 153
      end
      object edTotal: TcxCurrencyEdit
        Left = 464
        Top = 153
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 8
        Width = 153
      end
      object memDescription: TcxMemo
        Left = 83
        Top = 97
        Lines.Strings = (
          'memDescription')
        TabOrder = 9
        Height = 80
        Width = 270
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 391
    Width = 844
    inherited pnlFooter: TPanel
      Width = 844
      inherited btnClose: TcxButton
        Left = 767
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 674
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 597
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 844
      inherited lbCTRLEnter: TLabel
        Left = 669
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 760
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 593
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 752
    Top = 320
  end
end
