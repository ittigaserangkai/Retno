inherited frmCrazyPrice: TfrmCrazyPrice
  Left = 247
  Top = 117
  Caption = 'Crazy Price'
  ClientHeight = 512
  ClientWidth = 808
  OldCreateOrder = True
  ExplicitWidth = 824
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 808
    Height = 423
    ExplicitWidth = 808
    ExplicitHeight = 423
    inherited pgcBrowse: TcxPageControl
      Width = 806
      Height = 421
      ExplicitWidth = 806
      ExplicitHeight = 421
      ClientRectBottom = 420
      ClientRectRight = 805
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 804
        ExplicitHeight = 419
        inherited cxGrid: TcxGrid
          Width = 804
          Height = 419
          ExplicitWidth = 804
          ExplicitHeight = 419
          inherited cxGridView: TcxGridDBTableView
            OnEditing = cxGridViewEditing
            OptionsData.Editing = True
            object cxGridColCPPilih: TcxGridDBColumn
              DataBinding.FieldName = 'pilih'
              Width = 95
              IsCaptionAssigned = True
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 808
    ExplicitWidth = 808
    inherited lblHeader: TLabel
      Width = 74
      Caption = 'CRAZY PRICE '
      ExplicitWidth = 74
    end
    inherited lblFilterData: TcxLabel
      Left = 454
      Visible = True
      ExplicitLeft = 454
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 515
      Visible = True
      ExplicitLeft = 515
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 631
      Visible = True
      ExplicitLeft = 631
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 726
      ExplicitLeft = 726
    end
    inherited lblsdFilter: TcxLabel
      Left = 607
      Visible = True
      ExplicitLeft = 607
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 456
    Width = 808
    ExplicitTop = 456
    ExplicitWidth = 808
    inherited pnlFooter: TPanel
      Width = 808
      ExplicitWidth = 808
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
        Left = 731
        Action = actClose
        ExplicitLeft = 731
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 808
      ExplicitWidth = 808
      inherited lbEscape: TLabel
        Left = 734
        Height = 17
        ExplicitLeft = 734
      end
    end
  end
  object chkPilih: TcxCheckBox [3]
    Left = 8
    Top = 35
    AutoSize = False
    Caption = 'PILIH SEMUA'
    Style.TextStyle = [fsBold]
    TabOrder = 3
    Transparent = True
    OnClick = chkPilihClick
    Height = 24
    Width = 92
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
