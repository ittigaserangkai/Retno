inherited frmElectricInvoice: TfrmElectricInvoice
  Left = 186
  Top = 141
  Caption = 'Electric Invoice'
  ClientHeight = 399
  ClientWidth = 924
  OldCreateOrder = True
  ExplicitWidth = 940
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 924
    Height = 310
    ExplicitWidth = 924
    ExplicitHeight = 256
    inherited pgcBrowse: TcxPageControl
      Top = 76
      Width = 922
      Height = 233
      TabOrder = 1
      ExplicitTop = 76
      ExplicitWidth = 922
      ExplicitHeight = 100
      ClientRectBottom = 232
      ClientRectRight = 921
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 920
        ExplicitHeight = 98
        inherited cxGrid: TcxGrid
          Width = 920
          Height = 231
          ExplicitWidth = 920
          ExplicitHeight = 98
          inherited cxGridView: TcxGridDBTableView
            object cxcolNo: TcxGridDBColumn
              AlternateCaption = 'No.'
              Caption = 'No.'
            end
            object cxcolInvoice: TcxGridDBColumn
              Caption = 'Invoice'
            end
            object cxcolCustomerCode: TcxGridDBColumn
              Caption = 'Customer Code'
            end
            object cxcolCustomerName: TcxGridDBColumn
              Caption = 'Customer Name'
            end
            object cxcolGroup: TcxGridDBColumn
              Caption = 'Group'
            end
            object cxcolPower: TcxGridDBColumn
              Caption = 'Power (VA)'
            end
            object cxcolAbodemen: TcxGridDBColumn
              Caption = 'Abodemen / KVA'
            end
            object cxcolUsageRate: TcxGridDBColumn
              Caption = 'Usage Rate / KWH'
            end
            object cxcolAbodemenCost: TcxGridDBColumn
              Caption = 'Abodemen Cost'
            end
            object cxcolUsageCost: TcxGridDBColumn
              Caption = 'Usage Cost'
            end
            object cxcolTTLBCost: TcxGridDBColumn
              Caption = 'TTLB Cost'
            end
            object cxcolPJUCost: TcxGridDBColumn
              Caption = 'PJU Cost'
            end
            object cxcolTotalCost: TcxGridDBColumn
              Caption = 'Total Cost'
            end
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 922
      Height = 75
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 24
        Top = 12
        Width = 77
        Height = 16
        Caption = 'Invoice Periode'
      end
      object lblPilih: TLabel
        Left = 25
        Top = 42
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object btnShow: TcxButton
        Left = 275
        Top = 36
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E000000000000000000007F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00
          FF003250003250FF00FFBFBFBFFFFFFFBFBFBF7F7F7F9F9F9F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF7F7F7F7F7F7FFF00FFBFBFBFDCDCDC
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FF003D
          B90033FF0099CC003250BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBFBFBFBF606060003DB90033
          FFB1C7FF0055FF0032507F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
          BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF003DB90033FFB1C7
          FF0055FF0033FF0032509F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FBFBFBFFFFFFF
          DCDCDCDCDCDCDCDCDCBFBFBFBFBFBFBFBFBFBFBFBF003DB90033FFB1C7FF0055
          FF0033FF003250FF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFBFBFBFFFFFFF
          DCDCDCDCDCDCBFBFBFFF9900CC6600CC6600CC6600BFBFBFBFBFBF0055FF0033
          FF003250FF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F
          7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFBFBFBFFFFFFF
          DCDCDCBFBFBFFF9900DE9A3EDE9A3EDE9A3ED78300CC66009F9F9F7F7F7F0032
          50FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFF9900DE9A3EFFCC99FFCC99FFCC99DE9A3ED78300663333003250FF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCFF9900FFE2B4FFE2B4FFE2B4FFCC99FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFF9900FFE2B4FFFFDEFFFFFFFFE2B4FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          DCDCDCFF9900DE9A3EFFFFFFFFFFDEFFE2B4FFCC99DE9A3E663333FF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF9F9F9FDCDCDCFF00FFFF00FFFF
          00FFBFBFBFBFBFBF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFDCDCDCCC6600DE9A3EFFE2B4FFE2B4DE9A3E6633337F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF9F9F9FDCDCDCFFFFFFFF
          FFFFFFFFFF7F7F7FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFFFFFFDCDCDCCC6600663333663333663333BFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF9F9F9F9F9F9F7F
          7F7F7F7F7FFF00FFBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFDCDCDCFFFFFFDCDCDCDCDCDCDCDCDC7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFC0C0C0FFFFFFFF00FFFF00FFFF00FFFF00FFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFF00FFFF00
          FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F9F
          9F9F7F7F7F9F9F9FBFBFBFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowClick
      end
      object dtpPeriode: TDateTimePicker
        Left = 112
        Top = 9
        Width = 153
        Height = 24
        BevelInner = bvLowered
        Date = 39349.000000000000000000
        Format = 'MMMM yyyy'
        Time = 39349.000000000000000000
        TabOrder = 1
        OnChange = dtpPeriodeChange
      end
      object cbPilih: TComboBox
        Left = 112
        Top = 38
        Width = 152
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 2
        Text = 'OPEN'
        Items.Strings = (
          'OPEN'
          'CLOSE')
      end
      object cb1: TcxExtLookupComboBox
        Left = 384
        Top = 0
        TabOrder = 3
        Width = 145
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 924
    ExplicitWidth = 924
    inherited lblFilterData: TcxLabel
      Left = 570
      ExplicitLeft = 570
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 631
      ExplicitLeft = 631
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 747
      ExplicitLeft = 747
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 842
      ExplicitLeft = 842
    end
    inherited lblsdFilter: TcxLabel
      Left = 723
      ExplicitLeft = 723
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 343
    Width = 924
    ExplicitTop = 343
    ExplicitWidth = 924
    inherited pnlFooter: TPanel
      Width = 924
      ExplicitWidth = 924
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
        Left = 847
        Action = actClose
        ExplicitLeft = 847
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 924
      ExplicitWidth = 924
      inherited lbEscape: TLabel
        Left = 850
        Height = 17
        ExplicitLeft = 850
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
    object actPaymentElectricInvoice: TAction
      Caption = 'Pa&yment'
      OnExecute = actPaymentElectricInvoiceExecute
    end
  end
end
