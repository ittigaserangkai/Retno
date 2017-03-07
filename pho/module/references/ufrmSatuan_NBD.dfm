inherited frmSatuan_NBD: TfrmSatuan_NBD
  Left = 284
  Top = 197
  Caption = 'NBD'#39's Unit Of Measure'
  ClientHeight = 336
  ClientWidth = 546
  OldCreateOrder = True
  ExplicitWidth = 562
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 546
    Height = 247
    ExplicitWidth = 120
    ExplicitHeight = 186
    inherited cxGrid: TcxGrid
      Width = 524
      Height = 225
      ExplicitWidth = 98
      ExplicitHeight = 164
    end
  end
  inherited pnlHeader: TPanel
    Width = 546
    ExplicitWidth = 120
    inherited lblFilterData: TcxLabel
      Left = 252
      ExplicitLeft = -174
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 316
      ExplicitLeft = -110
      ExplicitHeight = 24
    end
    inherited lblsdFilter: TcxLabel
      Left = 412
      ExplicitLeft = -14
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 444
      ExplicitLeft = 18
      ExplicitHeight = 24
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 280
    Width = 546
    ExplicitTop = -112
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 546
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 464
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddSatuan_NBD
      end
      inherited btnUpdate: TcxButton
        Action = actEditSatuan_NBD
      end
    end
    inherited pnlSortCut: TPanel
      Width = 546
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 456
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstSatuan_NBD: TActionList
    Left = 488
    Top = 8
    object actAddSatuan_NBD: TAction
      Caption = 'Add'
      OnExecute = actAddSatuan_NBDExecute
    end
    object actEditSatuan_NBD: TAction
      Caption = 'Edit / Lihat'
      OnExecute = actEditSatuan_NBDExecute
    end
    object actDeleteSatuan_NBD: TAction
      Caption = 'Delete'
      OnExecute = actDeleteSatuan_NBDExecute
    end
    object actRefreshSatuan_NBD: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshSatuan_NBDExecute
    end
  end
end
