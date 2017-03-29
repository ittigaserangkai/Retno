object fraPaymentNotaRetur: TfraPaymentNotaRetur
  Left = 0
  Top = 0
  Width = 575
  Height = 236
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnExit = FrameExit
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 236
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 573
      Height = 34
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        573
        34)
      object lbl1: TLabel
        Left = 8
        Top = 5
        Width = 67
        Height = 18
        Caption = 'Total Retur'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object curredt1: TcxCurrencyEdit
        Left = 440
        Top = 5
        Anchors = [akTop, akRight]
        ParentFont = False
        TabOrder = 0
        Width = 121
      end
    end
    object pnl5: TPanel
      Left = 1
      Top = 198
      Width = 573
      Height = 37
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        573
        37)
      object lbl8: TLabel
        Left = 8
        Top = 6
        Width = 45
        Height = 18
        Caption = 'Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object curredt4: TcxCurrencyEdit
        Left = 440
        Top = 6
        Anchors = [akTop, akRight]
        ParentFont = False
        TabOrder = 0
        Width = 121
      end
    end
    object pnl6: TPanel
      Left = 1
      Top = 35
      Width = 573
      Height = 163
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        573
        163)
      object lbl2: TLabel
        Left = 9
        Top = 6
        Width = 76
        Height = 18
        Caption = 'Payment Type'
      end
      object lbl9: TcxLabel
        Left = 8
        Top = 140
        Cursor = crHandPoint
        Anchors = [akLeft, akBottom]
        Caption = 'Print Payment (F3)'
        ParentFont = False
        Transparent = True
      end
      object cbp1: TcxExtLookupComboBox
        Left = 96
        Top = 5
        TabOrder = 0
        OnKeyPress = cbp1KeyPress
        Width = 121
      end
      object pnl4: TPanel
        Left = 239
        Top = 5
        Width = 321
        Height = 34
        TabOrder = 1
        object lbl3: TLabel
          Left = 8
          Top = 6
          Width = 25
          Height = 18
          Caption = 'Cash'
        end
        object curredt2: TcxCurrencyEdit
          Left = 80
          Top = 6
          TabOrder = 0
          Width = 121
        end
      end
      object pnl3: TPanel
        Left = 239
        Top = 45
        Width = 321
        Height = 112
        TabOrder = 2
        object lbl4: TLabel
          Left = 8
          Top = 8
          Width = 57
          Height = 18
          Caption = 'Card Code'
        end
        object lbl5: TLabel
          Left = 8
          Top = 34
          Width = 48
          Height = 18
          Caption = 'Card No.'
        end
        object lbl6: TLabel
          Left = 8
          Top = 58
          Width = 29
          Height = 18
          Caption = 'Value'
        end
        object lbl7: TLabel
          Left = 8
          Top = 82
          Width = 76
          Height = 18
          Caption = 'Authorize No.'
        end
        object cbp2: TcxExtLookupComboBox
          Left = 90
          Top = 8
          TabOrder = 0
          Width = 213
        end
        object edt1: TEdit
          Left = 90
          Top = 33
          Width = 149
          Height = 24
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object curredt3: TcxCurrencyEdit
          Left = 90
          Top = 58
          TabOrder = 2
          Width = 121
        end
        object edt2: TEdit
          Left = 90
          Top = 83
          Width = 213
          Height = 24
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
        end
      end
    end
  end
end
