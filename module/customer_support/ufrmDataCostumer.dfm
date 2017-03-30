inherited frmDataCostumer: TfrmDataCostumer
  Caption = 'frmDataCostumer'
  ClientHeight = 383
  ClientWidth = 569
  OldCreateOrder = True
  ExplicitWidth = 585
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 569
    Height = 238
    ExplicitWidth = 558
    ExplicitHeight = 238
    inherited pgcBrowse: TcxPageControl
      Width = 547
      Height = 216
      ExplicitWidth = 536
      ExplicitHeight = 216
      ClientRectBottom = 215
      ClientRectRight = 546
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 534
        ExplicitHeight = 214
        inherited cxGrid: TcxGrid
          Width = 545
          Height = 214
          ExplicitWidth = 534
          ExplicitHeight = 214
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 569
    ExplicitWidth = 569
    inherited lblFilterData: TcxLabel
      Left = 215
      ExplicitLeft = 215
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 276
      ExplicitLeft = 265
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 392
      ExplicitLeft = 381
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 487
      ExplicitLeft = 476
    end
    inherited lblsdFilter: TcxLabel
      Left = 368
      ExplicitLeft = 368
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 327
    Width = 569
    TabOrder = 3
    ExplicitTop = 327
    ExplicitWidth = 558
    inherited pnlFooter: TPanel
      Width = 569
      ExplicitWidth = 558
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
        Left = 492
        Action = actClose
        ExplicitLeft = 481
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 569
      ExplicitWidth = 558
      inherited lbEscape: TLabel
        Left = 495
        ExplicitLeft = 495
      end
    end
  end
  inline fraFooter5Button1: TfraFooter5Button [3]
    Left = 0
    Top = 271
    Width = 569
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 271
    ExplicitWidth = 558
    inherited pnlFooter: TPanel
      Width = 569
      ExplicitWidth = 558
      inherited btnClose: TcxButton
        Left = 487
        ExplicitLeft = 476
      end
      inherited btnAdd: TcxButton
        Action = actAddDataCostumer
      end
      inherited btnUpdate: TcxButton
        Action = actEditDataCostumer
      end
      inherited btnDelete: TcxButton
        Action = actDeleteDataCostumer
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshDataCostumer
      end
    end
    inherited pnlSortCut: TPanel
      Width = 569
      ExplicitWidth = 558
      inherited lbl5: TLabel
        Left = 479
        ExplicitLeft = 469
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  object actlstInputSupplierForNotSO: TActionList
    Left = 528
    Top = 38
    object actAddDataCostumer: TAction
      Caption = 'A&dd'
    end
    object actEditDataCostumer: TAction
      Caption = '&Edit'
    end
    object actDeleteDataCostumer: TAction
      Caption = 'Delete'
    end
    object actRefreshDataCostumer: TAction
      Caption = 'Refresh'
    end
  end
end
