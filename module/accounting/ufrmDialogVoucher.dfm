inherited frmDialogVoucher: TfrmDialogVoucher
  Left = 285
  Top = 174
  Caption = 'Dialog Voucher'
  ClientHeight = 371
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 570
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 315
    ExplicitHeight = 315
    inherited cxGrid: TcxGrid
      Top = 150
      Width = 550
      Height = 163
      TabOrder = 1
      ExplicitTop = 150
      ExplicitWidth = 550
      ExplicitHeight = 163
      inherited cxGridView: TcxGridDBTableView
        object cxcolGridViewColumn1: TcxGridDBColumn
          Caption = 'NO VOUCHER'
        end
        object cxcolGridViewColumn2: TcxGridDBColumn
          Caption = 'NOMINAL'
        end
        object cxcolGridViewColumn3: TcxGridDBColumn
          Caption = 'EXPIRE DATE'
        end
        object cxcolGridViewColumn4: TcxGridDBColumn
          Caption = 'IS VALID'
        end
        object cxcolGridViewColumn5: TcxGridDBColumn
          Caption = 'STATUS'
        end
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 550
      Height = 148
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 16
        Top = 14
        Width = 77
        Height = 16
        Caption = 'Owner Voucher'
      end
      object Label1: TLabel
        Left = 16
        Top = 41
        Width = 50
        Height = 16
        Caption = 'Tgl Dibuat'
      end
      object lblInput: TLabel
        Left = 16
        Top = 66
        Width = 38
        Height = 16
        Caption = 'Nominal'
      end
      object Label2: TLabel
        Left = 16
        Top = 92
        Width = 82
        Height = 16
        Caption = 'Tgl Mulai Berlaku'
      end
      object Label3: TLabel
        Left = 16
        Top = 118
        Width = 49
        Height = 16
        Caption = 'Tgl Expire'
      end
      object cbpDataCombo: TcxExtLookupComboBox
        Left = 104
        Top = 11
        TabOrder = 0
        Width = 89
      end
      object dtTgl: TcxDateEdit
        Left = 104
        Top = 40
        TabOrder = 1
        Width = 161
      end
      object edtInput: TEdit
        Left = 200
        Top = 11
        Width = 217
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 104
        Top = 66
        Width = 161
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object JvDateEdit1: TcxDateEdit
        Left = 104
        Top = 91
        TabOrder = 4
        Width = 161
      end
      object JvDateEdit2: TcxDateEdit
        Left = 104
        Top = 116
        TabOrder = 5
        Width = 161
      end
      object btnGenerate: TcxButton
        AlignWithMargins = True
        Left = 280
        Top = 108
        Width = 137
        Height = 27
        Cursor = crHandPoint
        Margins.Top = 2
        Margins.Right = 10
        Margins.Bottom = 2
        Action = actGenerateVouchers
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 6
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 315
    ExplicitTop = 315
    inherited pnlFooter: TPanel
      inherited btnClose: TcxButton
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      inherited lbCTRLEnter: TLabel
        Height = 15
      end
      inherited lbEscape: TLabel
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    object actGenerateVouchers: TAction
      Caption = 'Generate Vouchers'
      ImageIndex = 14
    end
  end
end
