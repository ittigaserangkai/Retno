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
    ExplicitWidth = 710
    ExplicitHeight = 365
    inherited pgcBrowse: TcxPageControl
      Width = 806
      Height = 421
      ExplicitTop = 71
      ExplicitWidth = 708
      ExplicitHeight = 293
      ClientRectBottom = 420
      ClientRectRight = 805
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 706
        ExplicitHeight = 291
        inherited cxGrid: TcxGrid
          Width = 804
          Height = 419
          ExplicitWidth = 706
          ExplicitHeight = 291
          inherited cxGridView: TcxGridDBTableView
            object cxcolGridViewColumn1: TcxGridDBColumn
              Caption = 'CHECK'
            end
            object cxcolGridViewColumn2: TcxGridDBColumn
              Caption = 'PRODUCT CODE'
            end
            object cxcolGridViewColumn3: TcxGridDBColumn
              Caption = 'PRODUCT NAME'#13#10
            end
            object cxcolGridViewColumn4: TcxGridDBColumn
              Caption = 'UOM'
            end
            object cxcolGridViewColumn5: TcxGridDBColumn
              Caption = 'BUY PRICE'
            end
            object cxcolGridViewColumn6: TcxGridDBColumn
              Caption = 'MARK UP %'
            end
            object cxcolGridViewColumn7: TcxGridDBColumn
              Caption = 'SELL PRICE'
            end
            object cxcolGridViewColumn8: TcxGridDBColumn
              Caption = 'KONVERSI VALUE'
            end
            object cxcolGridViewColumn9: TcxGridDBColumn
              Caption = 'DISC PERSEN'
            end
            object cxcolGridViewColumn10: TcxGridDBColumn
              Caption = 'DISC NOMINAL'
            end
            object cxcolGridViewColumn11: TcxGridDBColumn
              Caption = 'SELL PRICE DISC'
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
      ExplicitLeft = 454
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 515
      ExplicitLeft = 417
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 631
      ExplicitLeft = 533
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 726
      ExplicitLeft = 628
    end
    inherited lblsdFilter: TcxLabel
      Left = 607
      ExplicitLeft = 607
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 456
    Width = 808
    ExplicitTop = 398
    ExplicitWidth = 710
    inherited pnlFooter: TPanel
      Width = 808
      ExplicitWidth = 710
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
        ExplicitLeft = 633
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 808
      ExplicitWidth = 710
      inherited lbEscape: TLabel
        Left = 734
        ExplicitLeft = 734
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
