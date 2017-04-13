inherited frmImportFromMDB: TfrmImportFromMDB
  Caption = 'Import From MDB'
  ClientHeight = 337
  ClientWidth = 544
  OldCreateOrder = True
  ExplicitWidth = 560
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 544
    Height = 307
    ExplicitWidth = 544
    ExplicitHeight = 307
    object Panel1: TPanel
      Left = 11
      Top = 11
      Width = 522
      Height = 47
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 51
        Height = 16
        Caption = 'FileName :'
      end
      object btnImport: TButton
        Left = 438
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Import'
        TabOrder = 0
        OnClick = btnImportClick
      end
    end
    object mmoImport: TMemo
      Left = 11
      Top = 58
      Width = 522
      Height = 238
      Align = alClient
      Color = 12582911
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
      ExplicitHeight = 234
    end
    object edtFileName: TcxButtonEdit
      Left = 72
      Top = 18
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtFileNamePropertiesButtonClick
      TabOrder = 2
      Text = 'edtFileName'
      Width = 369
    end
  end
  inherited pnlHeader: TPanel
    Width = 544
    ExplicitWidth = 544
    inherited lblHeader: TLabel
      Width = 122
      Caption = 'Import Data From MDB'
      ExplicitWidth = 122
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 488
    Top = 8
  end
end
