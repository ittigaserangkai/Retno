object frmCXMsgInfo: TfrmCXMsgInfo
  Left = 0
  Top = 0
  ClientHeight = 361
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Pesan :'
    PanelStyle.Active = True
    ParentBackground = False
    ParentColor = False
    Style.Color = clBtnFace
    Style.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    Height = 40
    Width = 634
    object mmPesan: TcxMemo
      Left = 2
      Top = 2
      Align = alClient
      Lines.Strings = (
        'Your Message Here , ex : List Of Failed Transaction :')
      ParentFont = False
      Properties.Alignment = taCenter
      Properties.ReadOnly = True
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
      Height = 36
      Width = 630
    end
  end
  object pnButtom: TcxGroupBox
    Left = 0
    Top = 321
    Align = alBottom
    PanelStyle.Active = True
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Style.Color = clDefault
    TabOrder = 1
    Transparent = True
    Height = 40
    Width = 634
    object btnCancel: TcxButton
      AlignWithMargins = True
      Left = 544
      Top = 5
      Width = 85
      Height = 30
      Align = alRight
      Caption = 'Cancel'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 2
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object btnSaveExcel: TcxButton
      AlignWithMargins = True
      Left = 362
      Top = 5
      Width = 85
      Height = 30
      Align = alRight
      Caption = 'Save Excel'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object btnOK: TcxButton
      AlignWithMargins = True
      Left = 271
      Top = 5
      Width = 85
      Height = 30
      Align = alRight
      Caption = 'OK'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object btnIgnore: TcxButton
      AlignWithMargins = True
      Left = 453
      Top = 5
      Width = 85
      Height = 30
      Align = alRight
      Caption = 'Ignore'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 5
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object btnNo: TcxButton
      AlignWithMargins = True
      Left = 180
      Top = 5
      Width = 85
      Height = 30
      Align = alRight
      Caption = 'No'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 7
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object btnYes: TcxButton
      AlignWithMargins = True
      Left = 89
      Top = 5
      Width = 85
      Height = 30
      Align = alRight
      Caption = 'Yes'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 6
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 40
    Width = 634
    Height = 281
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    object cxGrdMain: TcxGridDBTableView
      PopupMenu = PopupMenu1
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      Styles.ContentEven = styleEven
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 144
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 144
    object CheckAll1: TMenuItem
      Caption = 'Check All'
    end
    object UnCheckAll1: TMenuItem
      Caption = 'UnCheck All'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 96
    Top = 88
    PixelsPerInch = 96
    object styleEven: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
    object styleDefault: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
    object styleInfoBk: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clHighlightText
    end
  end
  object Timer1: TTimer
    Enabled = False
    Left = 112
    Top = 240
  end
end
