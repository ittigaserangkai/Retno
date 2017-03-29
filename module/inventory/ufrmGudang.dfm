inherited frmGudang: TfrmGudang
  Left = 216
  Top = 102
  Caption = ''
  ClientHeight = 380
  ClientWidth = 764
  OldCreateOrder = True
  ExplicitWidth = 780
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 764
    Height = 291
    ExplicitWidth = 764
    ExplicitHeight = 291
    inherited pgcBrowse: TcxPageControl
      Width = 742
      Height = 269
      ExplicitWidth = 742
      ExplicitHeight = 269
      ClientRectBottom = 268
      ClientRectRight = 741
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 740
        ExplicitHeight = 267
        inherited cxGrid: TcxGrid
          Width = 740
          Height = 267
          ExplicitWidth = 740
          ExplicitHeight = 267
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 764
    ExplicitWidth = 764
    inherited lblHeader: TLabel
      Width = 45
      Caption = 'GUDANG'
      ExplicitWidth = 45
    end
    inherited lblFilterData: TcxLabel
      Left = 410
      ExplicitLeft = 410
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 471
      ExplicitLeft = 471
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 587
      ExplicitLeft = 587
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 682
      ExplicitLeft = 682
    end
    inherited lblsdFilter: TcxLabel
      Left = 563
      ExplicitLeft = 563
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 324
    Width = 764
    ExplicitTop = 324
    ExplicitWidth = 764
    inherited pnlFooter: TPanel
      Width = 764
      ExplicitWidth = 764
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
        Left = 687
        Action = actClose
        ExplicitLeft = 687
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 764
      ExplicitWidth = 764
      inherited lbEscape: TLabel
        Left = 690
        Height = 17
        ExplicitLeft = 690
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
