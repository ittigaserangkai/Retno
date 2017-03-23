object dmReport: TdmReport
  Left = 748
  Top = 198
  Caption = 'Laporan'
  ClientHeight = 484
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TePageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 693
    Height = 447
    ActivePage = TeTabSheet2
    Align = alClient
    TabOrder = 0
    object TeTabSheet1: TTabSheet
      Caption = 'Text Report'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object mmo: TMemo
        Left = 0
        Top = 0
        Width = 687
        Height = 422
        Align = alClient
        Color = clSilver
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TeTabSheet2: TTabSheet
      Caption = 'Graphics Report'
      object frPreview1: TfrxPreview
        Left = 0
        Top = 0
        Width = 685
        Height = 419
        Align = alClient
        OutlineVisible = False
        OutlineWidth = 120
        ThumbnailVisible = False
        UseReportHints = True
      end
    end
  end
  object TePanel1: TPanel
    Left = 0
    Top = 447
    Width = 693
    Height = 37
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      693
      37)
    object bCetak: TButton
      Left = 528
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cetak'
      TabOrder = 0
      OnClick = bCetakClick
    end
    object bTutup: TButton
      Left = 616
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = bTutupClick
    end
  end
  object frDBDataSet2: TfrxDBDataset
    UserName = 'frDBDataSet2'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 32
    Top = 24
  end
  object frDBDataSet1: TfrxDBDataset
    UserName = 'frDBDataSet1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 64
    Top = 24
  end
  object frReport1: TfrxReport
    Version = '5.3.16'
    DataSet = frDBDataSet1
    DataSetName = 'frDBDataSet1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    Preview = frPreview1
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42787.314668136580000000
    ReportOptions.LastChange = 42787.314668136580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 32
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 64
    Top = 64
  end
  object dsTemp: TDataSource
    Left = 187
    Top = 70
  end
end
