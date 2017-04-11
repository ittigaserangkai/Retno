object frmDownlink: TfrmDownlink
  Left = 544
  Top = 121
  Width = 444
  Height = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 320
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object chkDB: TCheckBox
    Left = 24
    Top = 32
    Width = 97
    Height = 17
    Caption = 'From database'
    TabOrder = 1
    OnClick = chkDBClick
  end
  object chkFile: TCheckBox
    Left = 24
    Top = 56
    Width = 97
    Height = 17
    Caption = 'From File'
    TabOrder = 2
    OnClick = chkFileClick
  end
  object edtFileNm: TEdit
    Left = 98
    Top = 52
    Width = 255
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 3
  end
  object btnBrowse: TButton
    Left = 354
    Top = 53
    Width = 27
    Height = 20
    Caption = '....'
    TabOrder = 4
    OnClick = btnBrowseClick
  end
  object btnClose: TButton
    Left = 224
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 5
    OnClick = btnCloseClick
  end
  object OpDlg: TOpenDialog
    Filter = 'Text File (*.txt)|*.txt'
    Left = 328
    Top = 16
  end
end
