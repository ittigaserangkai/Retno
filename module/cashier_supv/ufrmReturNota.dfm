inherited frmReturNota: TfrmReturNota
  Left = 230
  Top = 153
  Caption = 'Retur Nota (CN)'
  ClientHeight = 368
  ClientWidth = 689
  OldCreateOrder = True
  ExplicitWidth = 705
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 689
    Height = 279
    BorderWidth = 0
    ExplicitWidth = 689
    ExplicitHeight = 223
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 687
      Height = 277
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 687
      ExplicitHeight = 221
      ClientRectBottom = 276
      ClientRectRight = 686
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 685
        ExplicitHeight = 219
        inherited cxGrid: TcxGrid
          Width = 685
          Height = 275
          ExplicitWidth = 685
          ExplicitHeight = 219
          inherited cxGridView: TcxGridDBTableView
            PopupMenu = pm1
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 689
    ExplicitWidth = 689
    inherited lblFilterData: TcxLabel
      Left = 335
      Visible = True
      ExplicitLeft = 335
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 396
      Visible = True
      ExplicitLeft = 396
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 512
      Visible = True
      ExplicitLeft = 512
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 607
      ExplicitLeft = 607
    end
    inherited lblsdFilter: TcxLabel
      Left = 488
      Visible = True
      ExplicitLeft = 488
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 312
    Width = 689
    ExplicitTop = 312
    ExplicitWidth = 689
    inherited pnlFooter: TPanel
      Width = 689
      ExplicitWidth = 689
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
        Left = 612
        Action = actClose
        ExplicitLeft = 612
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 689
      ExplicitWidth = 689
      inherited lbEscape: TLabel
        Left = 615
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  object pm1: TPopupMenu
    Left = 336
    Top = 184
    object Cetak1: TMenuItem
      Caption = 'Cetak'
      OnClick = Cetak1Click
    end
    object Refresh1: TMenuItem
      Caption = 'Refresh'
      OnClick = Refresh1Click
    end
  end
end
