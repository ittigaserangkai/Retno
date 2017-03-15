object fraUOMConvertion: TfraUOMConvertion
  Left = 0
  Top = 0
  Width = 724
  Height = 348
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnlAddEdit: TPanel
    Left = 0
    Top = 266
    Width = 724
    Height = 82
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 2
    object Label1: TLabel
      Left = 128
      Top = 16
      Width = 9
      Height = 16
      Caption = ' ='
    end
    object lbl2BOX: TLabel
      Left = 200
      Top = 14
      Width = 21
      Height = 16
      Caption = 'BOX'
    end
    object Label2: TLabel
      Left = 264
      Top = 14
      Width = 41
      Height = 16
      Caption = 'Barcode'
    end
    object Panel1: TPanel
      Left = 2
      Top = 44
      Width = 720
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      Color = 15198183
      TabOrder = 0
      object btnSave: TcxButton
        Left = 64
        Top = 3
        Width = 65
        Height = 25
        Caption = 'Save'
        OptionsImage.ImageIndex = 32
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 0
        OnClick = btnSaveClick
      end
      object btnCancel: TcxButton
        Left = 132
        Top = 3
        Width = 61
        Height = 25
        Caption = 'Cancel'
        OptionsImage.ImageIndex = 4
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 1
        OnClick = btnSaveClick
      end
    end
    object fedtUOM: TcxCurrencyEdit
      Left = 13
      Top = 11
      TabOrder = 1
      OnEnter = fedtUOMEnter
      OnKeyDown = fedtUOMKeyDown
      OnKeyPress = fedtUOMKeyPress
      Width = 44
    end
    object cbbUom: TComboBox
      Left = 65
      Top = 11
      Width = 57
      Height = 24
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = cbbUomKeyPress
    end
    object fedUOM2: TcxCurrencyEdit
      Left = 149
      Top = 11
      TabOrder = 3
      OnKeyPress = fedUOM2KeyPress
      Width = 44
    end
    object edtBarcode: TEdit
      Left = 316
      Top = 11
      Width = 165
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = 'PIECES'
      OnKeyPress = edtBarcodeKeyPress
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'UOM CONVERSION'
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
    Top = 58
    Width = 724
    Height = 208
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 1
    DesignSize = (
      724
      208)
    object lblClose: TcxLabel
      Left = 669
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      Transparent = True
      OnClick = lblCloseClick
    end
    object lblAdd: TcxLabel
      Left = 568
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Add'
      ParentFont = False
      Transparent = True
      OnClick = lblAddClick
    end
    object lblDelete: TcxLabel
      Left = 627
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Delete'
      ParentFont = False
      Transparent = True
      OnClick = lblDeleteClick
    end
    object lblEdit: TcxLabel
      Left = 598
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Edit'
      ParentFont = False
      Transparent = True
      OnClick = lblEditClick
    end
    object cxGrid1: TcxGrid
      Left = 21
      Top = 21
      Width = 682
      Height = 166
      Align = alClient
      TabOrder = 4
      object cxGridViewUoMConvertion: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGridViewUoMConvertion
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 23
    Width = 724
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object lbl1: TLabel
      Left = 24
      Top = 8
      Width = 54
      Height = 16
      Caption = 'UOM Stock'
    end
    object edtNameUOM1: TEdit
      Left = 148
      Top = 5
      Width = 87
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      Text = 'PIECES'
    end
    object edtUOMstock: TEdit
      Left = 83
      Top = 5
      Width = 63
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      Text = 'PIECES'
    end
  end
end
