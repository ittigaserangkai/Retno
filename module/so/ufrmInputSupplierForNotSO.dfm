inherited frmInputSupplierForNotSO: TfrmInputSupplierForNotSO
  Left = 229
  Top = 180
  Caption = 'Input Supplier For Not SO'
  ClientHeight = 392
  ClientWidth = 593
  OldCreateOrder = True
  ExplicitWidth = 609
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 74
    Width = 593
    Height = 262
    ExplicitTop = 74
    ExplicitWidth = 593
    ExplicitHeight = 206
    inherited pgcBrowse: TcxPageControl
      Width = 571
      Height = 240
      ExplicitWidth = 571
      ExplicitHeight = 184
      ClientRectBottom = 239
      ClientRectRight = 570
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 569
        ExplicitHeight = 182
        inherited cxGrid: TcxGrid
          Width = 569
          Height = 238
          ExplicitWidth = 569
          ExplicitHeight = 182
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 593
    ExplicitWidth = 593
    inherited lblFilterData: TcxLabel
      Left = 239
      ExplicitLeft = 239
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 300
      ExplicitLeft = 300
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 416
      ExplicitLeft = 416
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 511
      ExplicitLeft = 511
    end
    inherited lblsdFilter: TcxLabel
      Left = 392
      ExplicitLeft = 392
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 336
    Width = 593
    TabOrder = 3
    ExplicitTop = 336
    ExplicitWidth = 593
    inherited pnlFooter: TPanel
      Width = 593
      ExplicitWidth = 593
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
        Left = 516
        Action = actClose
        ExplicitLeft = 516
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 593
      ExplicitWidth = 593
      inherited lbEscape: TLabel
        Left = 519
        Height = 17
      end
    end
  end
  object pnlKeterangan: TPanel [3]
    Left = 0
    Top = 33
    Width = 593
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    BorderWidth = 10
    Caption = 'List of supplier which not included in "SUGGESTION ORDER" (SO):'
    Color = 15198183
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
