inherited frmBankCashOut: TfrmBankCashOut
  Caption = 'Bank Cash Out'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlHeader: TPanel
    ExplicitLeft = -1
    ExplicitTop = -4
    inherited lblHeader: TLabel
      Width = 80
      Caption = 'Bank Cash Out'
      ExplicitWidth = 80
    end
    inherited lblFilterData: TcxLabel
      Visible = True
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Visible = True
    end
    inherited dtAkhirFilter: TcxDateEdit
      Visible = True
    end
    inherited lblsdFilter: TcxLabel
      Visible = True
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    inherited pnlFooter: TPanel
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
