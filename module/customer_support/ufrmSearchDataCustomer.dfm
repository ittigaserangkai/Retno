inherited frmSearchDataCustomer: TfrmSearchDataCustomer
  Left = 291
  Top = 190
  Caption = 'Search Data Customer'
  ClientWidth = 387
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 403
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 387
    ExplicitWidth = 387
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 383
      Height = 47
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl2: TLabel
        Left = 11
        Top = 13
        Width = 24
        Height = 16
        Caption = 'Data'
      end
      object edtData: TEdit
        Left = 48
        Top = 13
        Width = 315
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtDataChange
        OnKeyDown = edtDataKeyDown
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 49
      Width = 383
      Height = 225
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Width = 387
    ExplicitWidth = 387
    inherited pnlFooter: TPanel
      Width = 387
      ExplicitWidth = 387
      inherited btnClose: TcxButton
        Left = 234
        Action = actCancel
        ExplicitLeft = 234
      end
      inherited btnSave: TcxButton
        Left = 141
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 141
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 311
        Action = actPrint
        ExplicitLeft = 311
      end
    end
    inherited pnlSortCut: TPanel
      Width = 387
      ExplicitWidth = 387
      inherited lbCTRLEnter: TLabel
        Left = 212
        Height = 15
        ExplicitLeft = 212
      end
      inherited lbEscape: TLabel
        Left = 303
        Height = 15
        ExplicitLeft = 303
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 136
        Height = 15
        ExplicitLeft = 136
      end
    end
  end
end
