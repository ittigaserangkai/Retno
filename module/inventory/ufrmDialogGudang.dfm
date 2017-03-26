inherited frmDialogGudang: TfrmDialogGudang
  Left = 300
  Top = 152
  Caption = 'frmDialogGudang'
  ClientHeight = 395
  ClientWidth = 514
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 530
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 514
    Height = 339
    ExplicitTop = -1
    ExplicitWidth = 514
    ExplicitHeight = 281
    object lbFax: TLabel
      Left = 20
      Top = 134
      Width = 26
      Height = 16
      Caption = 'lbFax'
    end
    object lbKota: TLabel
      Left = 20
      Top = 164
      Width = 31
      Height = 16
      Caption = 'lbKota'
    end
    object lbKodePos: TLabel
      Left = 20
      Top = 194
      Width = 48
      Height = 16
      Caption = 'lbKodePos'
    end
    object lbKontak: TLabel
      Left = 20
      Top = 224
      Width = 43
      Height = 16
      Caption = 'lbKontak'
    end
    object lbKode: TLabel
      Left = 20
      Top = 14
      Width = 32
      Height = 16
      Caption = 'lbKode'
    end
    object lbNama: TLabel
      Left = 20
      Top = 44
      Width = 35
      Height = 16
      Caption = 'lbNama'
    end
    object lbAlamat: TLabel
      Left = 20
      Top = 74
      Width = 41
      Height = 16
      Caption = 'lbAlamat'
    end
    object lbTelepon: TLabel
      Left = 20
      Top = 104
      Width = 45
      Height = 16
      Caption = 'lbTelepon'
    end
    object lbCabang: TLabel
      Left = 20
      Top = 254
      Width = 45
      Height = 16
      Caption = 'lbCabang'
    end
    object edKode: TcxTextEdit
      Tag = 1
      Left = 97
      Top = 10
      TabOrder = 0
      Width = 121
    end
    object edNama: TcxTextEdit
      Tag = 1
      Left = 98
      Top = 40
      TabOrder = 1
      Width = 121
    end
    object edAlamat: TcxTextEdit
      Left = 98
      Top = 70
      TabOrder = 2
      Width = 121
    end
    object edTelepon: TcxTextEdit
      Left = 98
      Top = 100
      TabOrder = 3
      Width = 121
    end
    object edFax: TcxTextEdit
      Left = 98
      Top = 130
      TabOrder = 4
      Width = 121
    end
    object edKota: TcxTextEdit
      Left = 98
      Top = 160
      TabOrder = 5
      Width = 121
    end
    object edKodePos: TcxTextEdit
      Left = 98
      Top = 190
      TabOrder = 6
      Width = 121
    end
    object edKontak: TcxTextEdit
      Left = 98
      Top = 220
      TabOrder = 7
      Width = 121
    end
    object cxLookUpUnit: TcxExtLookupComboBox
      Left = 97
      Top = 251
      TabOrder = 8
      Width = 145
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 339
    Width = 514
    ExplicitTop = 281
    ExplicitWidth = 514
    inherited pnlFooter: TPanel
      Width = 514
      ExplicitWidth = 514
      inherited btnClose: TcxButton
        Left = 437
        Action = actCancel
        ExplicitLeft = 437
      end
      inherited btnSave: TcxButton
        Left = 344
        Action = actSave
        ExplicitLeft = 344
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 514
      ExplicitWidth = 514
      inherited lbCTRLEnter: TLabel
        Left = 336
        Width = 88
        Height = 15
        Caption = ' Ctrl-Enter [Save]'
        ExplicitLeft = 336
        ExplicitWidth = 88
      end
      inherited lbEscape: TLabel
        Left = 430
        Height = 15
        ExplicitLeft = 430
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 424
    Top = 112
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
