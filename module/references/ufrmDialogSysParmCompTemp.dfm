inherited frmDialogSysParmCompTemp: TfrmDialogSysParmCompTemp
  Left = 621
  Top = 224
  Caption = 'frmDialogSysParmCompTemp'
  ClientHeight = 256
  ClientWidth = 351
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 367
  ExplicitHeight = 295
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 351
    Height = 200
    ExplicitWidth = 353
    ExplicitHeight = 226
    object lblNama: TLabel
      Left = 36
      Top = 40
      Width = 34
      Height = 16
      Caption = 'Nama :'
    end
    object lblDefault: TLabel
      Left = 36
      Top = 72
      Width = 43
      Height = 16
      Caption = 'Default :'
    end
    object lblGroup: TLabel
      Left = 36
      Top = 104
      Width = 37
      Height = 16
      Caption = 'Group :'
    end
    object lblDescription: TLabel
      Left = 36
      Top = 136
      Width = 65
      Height = 16
      Caption = 'Description :'
    end
    object edtNama: TEdit
      Left = 112
      Top = 36
      Width = 185
      Height = 22
      TabOrder = 0
    end
    object edtDefault: TEdit
      Left = 112
      Top = 68
      Width = 185
      Height = 22
      TabOrder = 1
    end
    object edtGroup: TEdit
      Left = 112
      Top = 100
      Width = 185
      Height = 22
      TabOrder = 2
    end
    object edtDescription: TEdit
      Left = 112
      Top = 132
      Width = 185
      Height = 22
      TabOrder = 3
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 200
    Width = 351
    ExplicitTop = 226
    ExplicitWidth = 353
    inherited pnlFooter: TPanel
      Width = 351
      ExplicitWidth = 353
      inherited btnClose: TcxButton
        Left = 269
        ExplicitLeft = 271
      end
      inherited btnSave: TcxButton
        Left = 182
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 184
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 351
      ExplicitWidth = 353
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
end
