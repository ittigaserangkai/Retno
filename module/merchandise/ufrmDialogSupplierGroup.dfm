inherited frmDialogSupplierGroup: TfrmDialogSupplierGroup
  Caption = 'frmDialogSupplierGroup'
  ClientHeight = 165
  ClientWidth = 368
  ExplicitWidth = 384
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 368
    Height = 109
    ExplicitWidth = 408
    ExplicitHeight = 101
    object edtNama: TcxTextEdit
      Tag = 1
      Left = 94
      Top = 38
      TabOrder = 1
      Width = 121
    end
    object edtDeskripsi: TcxTextEdit
      Tag = 1
      Left = 94
      Top = 66
      TabOrder = 2
      Width = 257
    end
    object lbGroupNo: TcxLabel
      Left = 11
      Top = 11
      Caption = 'No Group'
      Transparent = True
    end
    object lbNama: TcxLabel
      Left = 11
      Top = 39
      Caption = 'Nama'
      Transparent = True
    end
    object lbDeskripsi: TcxLabel
      Left = 9
      Top = 67
      Caption = 'Deskripsi'
      Transparent = True
    end
    object edtGroupNo: TcxTextEdit
      Tag = 1
      Left = 94
      Top = 10
      TabOrder = 0
      OnKeyPress = edtGroupNoKeyPress
      Width = 121
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 109
    Width = 368
    ExplicitTop = 101
    ExplicitWidth = 408
    inherited pnlFooter: TPanel
      Width = 368
      inherited btnClose: TcxButton
        Left = 291
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 198
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 121
      end
    end
    inherited pnlSortCut: TPanel
      Width = 368
      inherited lbCTRLEnter: TLabel
        Left = 193
        ExplicitLeft = 365
      end
      inherited lbEscape: TLabel
        Left = 284
        ExplicitLeft = 456
      end
      inherited lblCTRLP: TLabel
        Left = 117
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 272
    Top = 16
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
    inherited actCancel: TAction
      Caption = 'Cancel'
    end
  end
end
