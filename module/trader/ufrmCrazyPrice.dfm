inherited frmCrazyPrice: TfrmCrazyPrice
  Left = 247
  Top = 117
  Caption = 'Crazy Price'
  ClientHeight = 454
  ClientWidth = 710
  OldCreateOrder = True
  ExplicitWidth = 726
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 710
    Height = 365
    ExplicitWidth = 710
    ExplicitHeight = 309
    inherited pgcBrowse: TcxPageControl
      Top = 81
      Width = 688
      Height = 273
      TabOrder = 1
      ExplicitTop = 81
      ExplicitWidth = 688
      ExplicitHeight = 217
      ClientRectBottom = 272
      ClientRectRight = 687
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 686
        ExplicitHeight = 215
        inherited cxGrid: TcxGrid
          Width = 686
          Height = 271
          ExplicitWidth = 686
          ExplicitHeight = 215
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
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 688
      Height = 70
      Align = alTop
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 0
      object Label4: TLabel
        Left = 21
        Top = 42
        Width = 62
        Height = 16
        Caption = 'Date Create'
      end
      object Label1: TLabel
        Left = 197
        Top = 42
        Width = 15
        Height = 16
        Caption = 'S.d'
      end
      object Label2: TLabel
        Left = 20
        Top = 9
        Width = 54
        Height = 16
        Caption = 'Tipe Harga'
      end
      object dtFrom: TcxDateEdit
        Left = 91
        Top = 39
        TabOrder = 1
        Width = 97
      end
      object dtTo: TcxDateEdit
        Left = 219
        Top = 39
        TabOrder = 2
        Width = 97
      end
      object cbTipeHarga: TComboBox
        Left = 91
        Top = 9
        Width = 225
        Height = 24
        BevelKind = bkSoft
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 710
    ExplicitWidth = 710
    inherited lblHeader: TLabel
      Width = 74
      Caption = 'CRAZY PRICE '
      ExplicitWidth = 74
    end
    inherited lblFilterData: TcxLabel
      Left = 356
      ExplicitLeft = 356
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 417
      ExplicitLeft = 417
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 533
      ExplicitLeft = 533
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 628
      ExplicitLeft = 628
    end
    inherited lblsdFilter: TcxLabel
      Left = 509
      ExplicitLeft = 509
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 398
    Width = 710
    ExplicitTop = 342
    ExplicitWidth = 710
    inherited pnlFooter: TPanel
      Width = 710
      ExplicitWidth = 710
      inherited btnClose: TcxButton
        Left = 633
        ExplicitLeft = 633
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 710
      ExplicitWidth = 710
      inherited lbEscape: TLabel
        Left = 636
        ExplicitLeft = 636
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
