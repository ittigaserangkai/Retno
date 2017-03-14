inherited frmSatuan_NBD: TfrmSatuan_NBD
  Left = 284
  Top = 197
  Caption = 'NBD'#39's Unit Of Measure'
  ClientHeight = 336
  ClientWidth = 546
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 562
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 546
    Height = 247
    ExplicitWidth = 120
    ExplicitHeight = 186
    inherited pgcBrowse: TcxPageControl
      Width = 524
      Height = 225
      ExplicitWidth = 524
      ExplicitHeight = 225
      ClientRectBottom = 224
      ClientRectRight = 523
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Width = 524
          Height = 225
          ExplicitWidth = 98
          ExplicitHeight = 164
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 546
    ExplicitWidth = 546
    inherited lblFilterData: TcxLabel
      Left = 192
      ExplicitLeft = 192
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 253
      ExplicitLeft = -110
      ExplicitHeight = 24
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 369
      ExplicitLeft = 18
      ExplicitHeight = 24
    end
    inherited btnSearch: TcxButton
      Left = 464
      ExplicitLeft = 464
    end
    inherited lblsdFilter: TcxLabel
      Left = 345
      ExplicitLeft = 345
      AnchorY = 17
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
      inherited btnAdd: TcxButton
        Action = actAddSatuan_NBD
      end
      inherited btnUpdate: TcxButton
        Action = actEditSatuan_NBD
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 464
        Action = actClose
        ExplicitLeft = 38
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
      end
    end
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
