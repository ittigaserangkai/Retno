inherited frmElectricCustomer: TfrmElectricCustomer
  Left = 173
  Top = 97
  Caption = 'Electric Customer'
  ClientHeight = 473
  ClientWidth = 722
  OldCreateOrder = True
  ExplicitWidth = 738
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 722
    Height = 384
    ExplicitWidth = 702
    ExplicitHeight = 384
    object pnl1: TPanel [0]
      Left = 1
      Top = 1
      Width = 700
      Height = 78
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
    inherited pgcBrowse: TcxPageControl
      Width = 720
      Height = 382
      TabOrder = 1
      ExplicitTop = 79
      ExplicitWidth = 700
      ExplicitHeight = 304
      ClientRectBottom = 381
      ClientRectRight = 719
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 698
        ExplicitHeight = 302
        inherited cxGrid: TcxGrid
          Width = 718
          Height = 380
          ExplicitWidth = 698
          ExplicitHeight = 302
          inherited cxGridView: TcxGridDBTableView
            object cxcolGridViewColumn1: TcxGridDBColumn
              Caption = 'No.'
              HeaderAlignmentHorz = taCenter
              Width = 53
            end
            object cxcolGridViewColumn2: TcxGridDBColumn
              Caption = 'Customer Code'
              HeaderAlignmentHorz = taCenter
              Width = 87
            end
            object cxcolGridViewColumn3: TcxGridDBColumn
              Caption = 'Customer Name'
              HeaderAlignmentHorz = taCenter
              Width = 88
            end
            object cxcolGridViewColumn4: TcxGridDBColumn
              Caption = 'Kavling'
              HeaderAlignmentHorz = taCenter
            end
            object cxcolGridViewColumn5: TcxGridDBColumn
              Caption = 'Begin Periode'
              HeaderAlignmentHorz = taCenter
              Width = 79
            end
            object cxcolGridViewColumn6: TcxGridDBColumn
              Caption = 'Group'
              HeaderAlignmentHorz = taCenter
            end
            object cxcolGridViewColumn7: TcxGridDBColumn
              Caption = 'Power'
              HeaderAlignmentHorz = taCenter
            end
            object cxcolGridViewColumn8: TcxGridDBColumn
              Caption = 'Charge'
              HeaderAlignmentHorz = taCenter
            end
            object cxcolGridViewColumn9: TcxGridDBColumn
              Caption = 'Last Process'
              HeaderAlignmentHorz = taCenter
              Width = 71
            end
            object cxcolGridViewColumn10: TcxGridDBColumn
              Caption = 'Active'
              HeaderAlignmentHorz = taCenter
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 722
    ExplicitWidth = 702
    inherited lblFilterData: TcxLabel
      Left = 368
      ExplicitLeft = 348
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 429
      ExplicitLeft = 409
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 545
      ExplicitLeft = 525
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 640
      ExplicitLeft = 620
    end
    inherited lblsdFilter: TcxLabel
      Left = 521
      ExplicitLeft = 501
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 417
    Width = 722
    ExplicitTop = 417
    ExplicitWidth = 702
    inherited pnlFooter: TPanel
      Width = 722
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
        Left = 645
        Action = actClose
        ExplicitLeft = 625
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 722
      ExplicitWidth = 702
      inherited lbEscape: TLabel
        Left = 648
        Height = 17
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
