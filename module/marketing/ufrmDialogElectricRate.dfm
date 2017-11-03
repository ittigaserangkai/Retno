inherited frmDialogElectricRate: TfrmDialogElectricRate
  Caption = 'Dialog Electric Rate'
  ClientHeight = 361
  ClientWidth = 411
  ExplicitWidth = 427
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 411
    Height = 305
    ExplicitTop = -1
    object Label1: TLabel
      Left = 44
      Top = 19
      Width = 37
      Height = 16
      Caption = 'Group :'
    end
    object Label2: TLabel
      Left = 44
      Top = 49
      Width = 41
      Height = 16
      Caption = 'Factor :'
    end
    object Label3: TLabel
      Left = 44
      Top = 79
      Width = 86
      Height = 16
      Caption = 'Daya Terpasang :'
    end
    object Label4: TLabel
      Left = 44
      Top = 109
      Width = 87
      Height = 16
      Caption = 'Bea Beban / KVA :'
    end
    object Label5: TLabel
      Left = 44
      Top = 139
      Width = 115
      Height = 16
      Caption = 'Bea Pemakaian / KWH :'
    end
    object Label6: TLabel
      Left = 44
      Top = 229
      Width = 85
      Height = 16
      Caption = 'Rekening Debet :'
    end
    object Label7: TLabel
      Left = 44
      Top = 259
      Width = 87
      Height = 16
      Caption = 'Rekening Credit :'
    end
    object Label8: TLabel
      Left = 44
      Top = 169
      Width = 63
      Height = 16
      Caption = 'Bea TTLB (%)'
    end
    object Label9: TLabel
      Left = 44
      Top = 199
      Width = 57
      Height = 16
      Caption = 'Bea PJU (%)'
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 164
      Top = 46
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0;(,0)'
      Properties.EditFormat = ',0;(,0)'
      TabOrder = 0
      Value = 1
      Width = 121
    end
    object cxSpinEdit2: TcxSpinEdit
      Left = 164
      Top = 76
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0;(,0)'
      TabOrder = 1
      Value = 3520
      Width = 121
    end
    object cxSpinEdit3: TcxSpinEdit
      Left = 164
      Top = 106
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ValueType = vtFloat
      TabOrder = 2
      Value = 28400.000000000000000000
      Width = 121
    end
    object cxSpinEdit4: TcxSpinEdit
      Left = 164
      Top = 136
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ValueType = vtFloat
      TabOrder = 3
      Value = 1153.950000000000000000
      Width = 121
    end
    object cxExtLookupComboBox1: TcxExtLookupComboBox
      Left = 164
      Top = 226
      TabOrder = 4
      Width = 145
    end
    object cxExtLookupComboBox2: TcxExtLookupComboBox
      Left = 164
      Top = 256
      TabOrder = 5
      Width = 145
    end
    object cxSpinEdit5: TcxSpinEdit
      Left = 164
      Top = 166
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0;(,0)'
      Properties.EditFormat = ',0;(,0)'
      TabOrder = 6
      Width = 121
    end
    object cxSpinEdit6: TcxSpinEdit
      Left = 164
      Top = 196
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0;(,0)'
      TabOrder = 7
      Value = 9
      Width = 121
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 305
    Width = 411
    inherited pnlFooter: TPanel
      Width = 411
      inherited btnClose: TcxButton
        Left = 334
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 241
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 164
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 411
      inherited lbCTRLEnter: TLabel
        Left = 236
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 327
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 160
        Height = 15
      end
    end
  end
  object cxTextEdit1: TcxTextEdit [2]
    Left = 164
    Top = 16
    TabOrder = 2
    Text = 'Golongan Tarif B-3'
    Width = 145
  end
end
