inherited frmMaintenancePassword: TfrmMaintenancePassword
  Left = 600
  Top = 103
  Caption = 'Cashier and Password Maintenance'
  ClientHeight = 334
  ClientWidth = 567
  OldCreateOrder = True
  ExplicitWidth = 583
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 567
    Height = 245
    BorderWidth = 0
    ExplicitWidth = 555
    ExplicitHeight = 189
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 565
      Height = 243
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 553
      ExplicitHeight = 187
      ClientRectBottom = 242
      ClientRectRight = 564
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 551
        ExplicitHeight = 185
        inherited cxGrid: TcxGrid
          Width = 563
          Height = 241
          ExplicitWidth = 551
          ExplicitHeight = 185
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 567
    ExplicitWidth = 555
    inherited lblFilterData: TcxLabel
      Left = 213
      ExplicitLeft = 201
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 274
      ExplicitLeft = 262
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 390
      ExplicitLeft = 378
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 485
      ExplicitLeft = 473
    end
    inherited lblsdFilter: TcxLabel
      Left = 366
      ExplicitLeft = 354
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 278
    Width = 567
    ExplicitTop = 278
    ExplicitWidth = 555
    inherited pnlFooter: TPanel
      Width = 567
      ExplicitWidth = 555
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
        Left = 490
        Action = actClose
        ExplicitLeft = 478
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 567
      ExplicitWidth = 555
      inherited lbEscape: TLabel
        Left = 493
        Height = 17
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
end
