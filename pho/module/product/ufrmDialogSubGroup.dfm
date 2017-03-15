inherited frmDialogSubGroup: TfrmDialogSubGroup
  Caption = 'Update Data Sub Group'
  PixelsPerInch = 96
  TextHeight = 16
  inherited footerDialogMaster: TfraFooterDialog3Button
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
    Left = 504
    Top = 80
  end
end
