object frmPilihCabang: TfrmPilihCabang
  Left = 0
  Top = 0
  Caption = 'Pilih Cabang'
  ClientHeight = 102
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCabang: TLabel
    Left = 11
    Top = 11
    Width = 19
    Height = 13
    Caption = 'Unit'
  end
  object cbbUnit: TcxExtLookupComboBox
    Left = 64
    Top = 8
    Properties.DropDownAutoSize = True
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.FocusPopup = True
    Properties.View = cxGridDBTableCabang
    Properties.KeyFieldNames = 'ID'
    Properties.ListFieldItem = cxgrdbclmnGridDBTableCabangColumnNama
    TabOrder = 0
    Width = 145
  end
  object btnPilih: TButton
    Left = 64
    Top = 35
    Width = 145
    Height = 25
    Caption = 'Pilih'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnPilihClick
  end
  object cxGridRepCabang: TcxGridViewRepository
    Left = 112
    Top = 56
    object cxGridDBTableCabang: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object cxgrdbclmnGridDBTableCabangColumnKode: TcxGridDBColumn
        DataBinding.FieldName = 'Kode'
      end
      object cxgrdbclmnGridDBTableCabangColumnNama: TcxGridDBColumn
        DataBinding.FieldName = 'Nama'
      end
    end
  end
end
