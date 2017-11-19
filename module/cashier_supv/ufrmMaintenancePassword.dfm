inherited frmMaintenancePassword: TfrmMaintenancePassword
  Left = 600
  Top = 103
  Caption = 'Cashier and Password Maintenance'
  ClientHeight = 334
  ClientWidth = 728
  OldCreateOrder = True
  ExplicitWidth = 744
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 728
    Height = 245
    ExplicitWidth = 567
    ExplicitHeight = 245
    inherited pgcBrowse: TcxPageControl
      Width = 726
      Height = 243
      ExplicitWidth = 565
      ExplicitHeight = 243
      ClientRectBottom = 242
      ClientRectRight = 725
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 563
        ExplicitHeight = 241
        inherited cxGrid: TcxGrid
          Width = 724
          Height = 241
          ExplicitLeft = 2
          ExplicitWidth = 563
          ExplicitHeight = 241
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 728
    ExplicitWidth = 567
    inherited lblFilterData: TcxLabel
      Left = 374
      ExplicitLeft = 213
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 435
      ExplicitLeft = 274
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 551
      ExplicitLeft = 390
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 646
      ExplicitLeft = 485
    end
    inherited lblsdFilter: TcxLabel
      Left = 527
      ExplicitLeft = 366
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 278
    Width = 728
    ExplicitTop = 278
    ExplicitWidth = 567
    inherited pnlFooter: TPanel
      Width = 728
      ExplicitWidth = 567
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
        Left = 651
        Action = actClose
        ExplicitLeft = 490
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 728
      ExplicitWidth = 567
      inherited lbEscape: TLabel
        Left = 654
        Height = 17
        ExplicitLeft = 493
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 432
    Top = 96
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
