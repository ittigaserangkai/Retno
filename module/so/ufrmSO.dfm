inherited frmSO: TfrmSO
  Caption = 'Suggestion Order'
  ClientHeight = 345
  ClientWidth = 664
  ExplicitTop = 8
  ExplicitWidth = 680
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 664
    Height = 256
    ExplicitWidth = 664
    ExplicitHeight = 256
    inherited pgcBrowse: TcxPageControl
      Width = 642
      Height = 234
      ExplicitWidth = 642
      ExplicitHeight = 234
      ClientRectBottom = 233
      ClientRectRight = 641
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 640
        ExplicitHeight = 232
        inherited cxGrid: TcxGrid
          Width = 640
          Height = 232
          ExplicitWidth = 640
          ExplicitHeight = 232
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 664
    ExplicitWidth = 664
    inherited lblHeader: TLabel
      Width = 106
      Caption = 'SUGGESTION ORDER'
      ExplicitWidth = 106
    end
    inherited lblFilterData: TcxLabel
      Left = 310
      Visible = True
      ExplicitLeft = 310
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 371
      Visible = True
      ExplicitLeft = 371
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 487
      Visible = True
      ExplicitLeft = 487
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 582
      ExplicitLeft = 582
    end
    inherited lblsdFilter: TcxLabel
      Left = 463
      Visible = True
      ExplicitLeft = 463
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 289
    Width = 664
    ExplicitTop = 289
    ExplicitWidth = 664
    inherited pnlFooter: TPanel
      Width = 664
      ExplicitWidth = 664
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
        Left = 587
        Action = actClose
        ExplicitLeft = 587
        ExplicitTop = 4
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 664
      ExplicitWidth = 664
      inherited lbEscape: TLabel
        Left = 590
        Height = 17
        ExplicitLeft = 590
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
