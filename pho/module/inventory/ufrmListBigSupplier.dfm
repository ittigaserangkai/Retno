inherited frmListBigSupplier: TfrmListBigSupplier
  Left = 199
  Top = 84
  Caption = 'Daily Sales Analysis'
  ClientHeight = 438
  ClientWidth = 633
  OldCreateOrder = True
  ExplicitWidth = 649
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 633
    Height = 349
    BorderWidth = 0
    ExplicitTop = 33
    ExplicitWidth = 633
    ExplicitHeight = 293
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 92
      Width = 631
      Height = 256
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 92
      ExplicitWidth = 631
      ExplicitHeight = 200
      ClientRectBottom = 255
      ClientRectRight = 630
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 629
        ExplicitHeight = 198
        inherited cxGrid: TcxGrid
          Width = 629
          Height = 254
          ExplicitWidth = 629
          ExplicitHeight = 198
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'SUB GROUP CODE & NAME'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'S A L E S'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = '% TOTAL SALES'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'P R O F I T'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = '% G P'
            end
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 631
      Height = 91
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl3: TLabel
        Left = 16
        Top = 10
        Width = 50
        Height = 16
        Caption = 'Date from'
      end
      object lbl4: TLabel
        Left = 15
        Top = 35
        Width = 60
        Height = 16
        Caption = 'Report Type'
      end
      object lbl5: TLabel
        Left = 219
        Top = 10
        Width = 11
        Height = 16
        Caption = 'to'
      end
      object dtTglFrom: TcxDateEdit
        Left = 88
        Top = 8
        TabOrder = 0
        OnKeyUp = dtTglFromKeyUp
        Width = 121
      end
      object edtGroupName: TEdit
        Left = 215
        Top = 34
        Width = 306
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object cbpGroup: TcxExtLookupComboBox
        Left = 88
        Top = 33
        TabOrder = 2
        OnKeyUp = cbpGroupKeyUp
        Width = 121
      end
      object dtTglTo: TcxDateEdit
        Left = 238
        Top = 8
        TabOrder = 1
        OnKeyUp = dtTglFromKeyUp
        Width = 121
      end
      object chkContrabon: TCheckBox
        Left = 88
        Top = 60
        Width = 81
        Height = 17
        Caption = 'Contrabon'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object btnShow: TcxButton
        Left = 216
        Top = 60
        Width = 113
        Height = 25
        Cursor = crHandPoint
        Caption = 'Show Listing'
        OptionsImage.ImageIndex = 14
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 5
        OnClick = btnShowClick
      end
      object btnCetak: TcxButton
        Left = 368
        Top = 60
        Width = 113
        Height = 25
        Cursor = crHandPoint
        Caption = 'Print'
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 6
        OnClick = btnShowClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 633
    ExplicitWidth = 633
    inherited lblFilterData: TcxLabel
      Left = 279
      ExplicitLeft = 279
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 340
      ExplicitLeft = 340
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 456
      ExplicitLeft = 456
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 551
      ExplicitLeft = 551
    end
    inherited lblsdFilter: TcxLabel
      Left = 432
      ExplicitLeft = 432
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 382
    Width = 633
    ExplicitTop = 326
    ExplicitWidth = 633
    inherited pnlFooter: TPanel
      Width = 633
      ExplicitWidth = 633
      inherited btnClose: TcxButton
        Left = 556
        ExplicitLeft = 556
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 633
      ExplicitWidth = 633
      inherited lbEscape: TLabel
        Left = 559
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
