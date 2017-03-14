object fraProductTurunan: TfraProductTurunan
  Left = 0
  Top = 0
  Width = 689
  Height = 303
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'PRODUCT TURUNAN'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 689
    Height = 176
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 1
    DesignSize = (
      689
      176)
    object lblAdd: TcxLabel
      Left = 532
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Add'
      ParentFont = False
      Transparent = True
      OnClick = lblAddClick
    end
    object lblEdit: TcxLabel
      Left = 562
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Edit'
      ParentFont = False
      Transparent = True
      OnClick = lblEditClick
    end
    object lbl22: TcxLabel
      Left = 592
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Delete'
      ParentFont = False
      Transparent = True
    end
    object lblClose: TcxLabel
      Left = 633
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      Transparent = True
      OnClick = lblCloseClick
    end
    object pnl2: TPanel
      Left = 21
      Top = 122
      Width = 647
      Height = 33
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object edt30: TEdit
        Left = 80
        Top = 6
        Width = 491
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Text = 'WHITE STICK 30 X 10 S / 12 GR'
      end
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 647
      Height = 101
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object pnlAddEdit: TPanel
    Left = 0
    Top = 199
    Width = 689
    Height = 104
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 2
    object lbl2: TLabel
      Left = 20
      Top = 8
      Width = 67
      Height = 16
      Caption = 'Product Code'
    end
    object lbl3: TLabel
      Left = 20
      Top = 30
      Width = 65
      Height = 16
      Caption = 'Qty per OUM'
    end
    object lbl4: TLabel
      Left = 20
      Top = 53
      Width = 57
      Height = 16
      Caption = 'Percentage'
    end
    object lbl5: TLabel
      Left = 160
      Top = 56
      Width = 7
      Height = 16
      Caption = '%'
    end
    object lbl7: TLabel
      Left = 18
      Top = 67
      Width = 53
      Height = 16
      Caption = '(from HPP)'
    end
    object edt1: TEdit
      Left = 93
      Top = 6
      Width = 49
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = '123456'
      OnKeyUp = edt1KeyUp
    end
    object edt2: TEdit
      Left = 143
      Top = 6
      Width = 330
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'WHITE STICK 30 X 10 S / 12 GR'
    end
    object fedt5: TcxCurrencyEdit
      Left = 93
      Top = 29
      TabOrder = 2
      Width = 62
    end
    object edt15: TEdit
      Left = 156
      Top = 29
      Width = 38
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'CRT'
    end
    object fedt1: TcxCurrencyEdit
      Left = 93
      Top = 52
      TabOrder = 4
      Width = 62
    end
    object btnCancel: TcxButton
      Left = 340
      Top = 51
      Width = 61
      Height = 25
      Caption = 'Cancel'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object btnSave: TcxButton
      Left = 272
      Top = 51
      Width = 65
      Height = 25
      Caption = 'Save'
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 6
      OnClick = btnSaveClick
    end
  end
end
