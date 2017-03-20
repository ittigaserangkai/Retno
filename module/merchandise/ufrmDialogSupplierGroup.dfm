inherited frmDialogSupplierGroup: TfrmDialogSupplierGroup
  Caption = 'frmDialogSupplierGroup'
  ClientHeight = 157
  ClientWidth = 408
  ExplicitWidth = 424
  ExplicitHeight = 196
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 408
    Height = 101
    ExplicitLeft = 8
    ExplicitTop = -16
    object edtNama: TcxTextEdit
      Left = 94
      Top = 38
      TabOrder = 1
      Width = 121
    end
    object edtDeskripsi: TcxTextEdit
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
    object spGroupNo: TcxSpinEdit
      Left = 94
      Top = 10
      TabOrder = 0
      Width = 121
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 101
    Width = 408
    inherited pnlFooter: TPanel
      Width = 408
      inherited btnClose: TcxButton
        Left = 331
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 238
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 408
      inherited lbCTRLEnter: TLabel
        Left = 233
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 324
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
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
  end
end
