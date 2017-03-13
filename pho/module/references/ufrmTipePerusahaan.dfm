inherited frmTipePerusahaan: TfrmTipePerusahaan
  Left = 184
  Top = 237
  Caption = 'Company Type'
  ClientHeight = 324
  ClientWidth = 546
  OldCreateOrder = True
  OnDeactivate = FormDeactivate
  ExplicitWidth = 562
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 546
    Height = 235
    ExplicitWidth = 546
    ExplicitHeight = 179
    inherited pgcBrowse: TcxPageControl
      Width = 524
      Height = 213
      ExplicitWidth = 524
      ExplicitHeight = 157
      ClientRectBottom = 213
      ClientRectRight = 524
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 524
        ExplicitHeight = 157
        inherited cxGrid: TcxGrid
          Width = 524
          Height = 213
          ExplicitWidth = 524
          ExplicitHeight = 157
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
      ExplicitLeft = 253
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 369
      ExplicitLeft = 369
      ExplicitHeight = 23
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
    Top = 268
    Width = 546
    ExplicitTop = 268
    ExplicitWidth = 546
    inherited pnlFooter: TPanel
      Width = 546
      ExplicitWidth = 546
      inherited btnClose: TcxButton
        Left = 469
        Action = actClose
        ExplicitLeft = 469
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 546
      ExplicitWidth = 546
      inherited lbl1: TLabel
        Height = 15
      end
      inherited lbl2: TLabel
        Height = 15
      end
      inherited lbl5: TLabel
        Left = 472
        Height = 17
        ExplicitLeft = 472
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
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
