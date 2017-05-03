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
    ExplicitWidth = 368
    ExplicitHeight = 109
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
      Caption = 'Kode Group'
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
    ExplicitTop = 109
    ExplicitWidth = 368
    inherited pnlFooter: TPanel
      Width = 368
      ExplicitWidth = 368
      inherited btnClose: TcxButton
        Left = 291
        Action = actCancel
        ExplicitLeft = 291
      end
      inherited btnSave: TcxButton
        Left = 198
        Action = actSave
        ExplicitLeft = 198
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 121
        ExplicitLeft = 121
      end
    end
    inherited pnlSortCut: TPanel
      Width = 368
      ExplicitWidth = 368
      inherited lbCTRLEnter: TLabel
        Left = 193
        Height = 15
        ExplicitLeft = 193
      end
      inherited lbEscape: TLabel
        Left = 284
        Height = 15
        ExplicitLeft = 284
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 117
        ExplicitLeft = 117
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
