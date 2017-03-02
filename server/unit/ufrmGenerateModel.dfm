object frmGenerateModel: TfrmGenerateModel
  Left = 0
  Top = 0
  Caption = 'Generate Model'
  ClientHeight = 343
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDaftarTable: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 343
    Align = alLeft
    TabOrder = 0
    object cxGridDBDaftarTable: TcxGrid
      Left = 1
      Top = 1
      Width = 279
      Height = 341
      Align = alClient
      TabOrder = 0
      ExplicitLeft = -32
      ExplicitTop = 72
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridDBTableDaftarTable: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = cxGridDBTableDaftarTableCellDblClick
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        Styles.ContentEven = cxstylcxGridEven
        Styles.ContentOdd = cxstylcxGridOdd
        Styles.Header = cxstylcxGridHeader
        object cxGridColNama: TcxGridDBColumn
          Caption = 'Nama '
          DataBinding.FieldName = 'Nama'
          HeaderAlignmentHorz = taCenter
          Width = 257
        end
      end
      object cxgrdlvlDaftarTable: TcxGridLevel
        GridView = cxGridDBTableDaftarTable
      end
    end
  end
  object cxspltrTable: TcxSplitter
    Left = 281
    Top = 0
    Width = 8
    Height = 343
    ExplicitLeft = 360
    ExplicitTop = 144
    ExplicitHeight = 100
  end
  object cxGridDB1: TcxGrid
    Left = 463
    Top = 72
    Width = 81
    Height = 89
    TabOrder = 2
    object cxgrdlvlGridDB1Level1: TcxGridLevel
    end
  end
  object btn1: TButton
    Left = 585
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 3
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 296
    Top = 72
    PixelsPerInch = 96
    object cxstylcxGridHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxstylcxGridEven: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
    object cxstylcxGridOdd: TcxStyle
      AssignedValues = [svColor]
      Color = clHighlightText
    end
  end
end
