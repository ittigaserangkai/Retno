inherited frmElectricCustomer: TfrmElectricCustomer
  Left = 173
  Top = 97
  Caption = 'Electric Customer'
  ClientHeight = 473
  ClientWidth = 702
  OldCreateOrder = True
  ExplicitWidth = 718
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 702
    Height = 384
    ExplicitWidth = 702
    ExplicitHeight = 330
    inherited pgcBrowse: TcxPageControl
      Top = 89
      Width = 680
      Height = 284
      TabOrder = 1
      ExplicitTop = 89
      ExplicitWidth = 680
      ExplicitHeight = 230
      ClientRectBottom = 283
      ClientRectRight = 679
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 678
        ExplicitHeight = 228
        inherited cxGrid: TcxGrid
          Width = 678
          Height = 282
          ExplicitWidth = 678
          ExplicitHeight = 228
          inherited cxGridView: TcxGridDBTableView
            object cxcolGridViewColumn1: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcolGridViewColumn2: TcxGridDBColumn
              Caption = 'Customer Code'
            end
            object cxcolGridViewColumn3: TcxGridDBColumn
              Caption = 'Customer Name'
            end
            object cxcolGridViewColumn4: TcxGridDBColumn
              Caption = 'Kavling'
            end
            object cxcolGridViewColumn5: TcxGridDBColumn
              Caption = 'Begin Periode'
            end
            object cxcolGridViewColumn6: TcxGridDBColumn
              Caption = 'Group'
            end
            object cxcolGridViewColumn7: TcxGridDBColumn
              Caption = 'Power'
            end
            object cxcolGridViewColumn8: TcxGridDBColumn
              Caption = 'Charge'
            end
            object cxcolGridViewColumn9: TcxGridDBColumn
              Caption = 'Last Process'
            end
            object cxcolGridViewColumn10: TcxGridDBColumn
              Caption = 'Active'
            end
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 680
      Height = 78
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 24
        Top = 20
        Width = 76
        Height = 16
        Caption = 'Customer Code'
      end
      object edtCustName: TEdit
        Left = 110
        Top = 44
        Width = 248
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object cbpCustCode: TcxExtLookupComboBox
        Left = 110
        Top = 20
        TabOrder = 0
        Width = 80
      end
      object btnShow: TcxButton
        Left = 280
        Top = 16
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300993300500019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300993300993300500019FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0000009933009933009933009933005000
          19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300CC6600993300CC66009933
          00500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600993300CC6600993300CC66
          00993300500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600CC6600CC6600CC6600CC66
          00CC6600663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900CC6600FF9900CC6600FF99
          00663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900FF99006633
          33FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900663333FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OptionsImage.NumGlyphs = 2
        TabOrder = 2
        OnClick = btnShowClick
      end
      object btnPrint: TcxButton
        Left = 368
        Top = 16
        Width = 73
        Height = 49
        Cursor = crHandPoint
        Caption = 'Print'
        OptionsImage.ImageIndex = 28
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 3
        OnClick = btnShowClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 702
    ExplicitWidth = 702
    inherited lblFilterData: TcxLabel
      Left = 348
      ExplicitLeft = 348
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 409
      ExplicitLeft = 409
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 525
      ExplicitLeft = 525
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 620
      ExplicitLeft = 620
    end
    inherited lblsdFilter: TcxLabel
      Left = 501
      ExplicitLeft = 501
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 417
    Width = 702
    ExplicitTop = 363
    ExplicitWidth = 702
    inherited pnlFooter: TPanel
      Width = 702
      ExplicitWidth = 702
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
        Left = 625
        Action = actClose
        ExplicitLeft = 625
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 702
      ExplicitWidth = 702
      inherited lbEscape: TLabel
        Left = 628
        ExplicitLeft = 628
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
  object actlstElectricCustomer: TActionList
    Left = 587
    Top = 65
    object actAddElectricCustomer: TAction
      Caption = 'actAddElectricCustomer'
    end
    object actEditElectricCustomer: TAction
      Caption = 'actEditElectricCustomer'
    end
    object actDeleteElectricCustomer: TAction
      Caption = 'actDeleteElectricCustomer'
      OnExecute = actDeleteElectricCustomerExecute
    end
  end
end
