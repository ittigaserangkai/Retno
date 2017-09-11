inherited frmSettingKoneksi: TfrmSettingKoneksi
  Caption = 'Setting Koneksi'
  ClientHeight = 283
  ClientWidth = 395
  ExplicitWidth = 411
  ExplicitHeight = 322
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 395
    Height = 227
    ExplicitWidth = 395
    ExplicitHeight = 227
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = ' Rest Server '
      ParentBackground = False
      ParentColor = False
      Style.Color = clWhite
      TabOrder = 0
      Height = 159
      Width = 391
      object edServer: TcxTextEdit
        Left = 100
        Top = 20
        TabOrder = 0
        Text = '127.0.0.1'
        Width = 126
      end
      object cxLabel1: TcxLabel
        Left = 57
        Top = 21
        Caption = 'Server'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
      object cxLabel2: TcxLabel
        Left = 69
        Top = 45
        Caption = 'Port'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
      object cxLabel3: TcxLabel
        Left = 37
        Top = 69
        Caption = 'User Name'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
      object edUser: TcxTextEdit
        Left = 100
        Top = 68
        TabOrder = 4
        Width = 126
      end
      object cxLabel4: TcxLabel
        Left = 44
        Top = 92
        Caption = 'Password'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
      object edPassword: TcxTextEdit
        Left = 100
        Top = 91
        TabOrder = 6
        Width = 93
      end
      object btnTest: TcxButton
        AlignWithMargins = True
        Left = 101
        Top = 119
        Width = 121
        Height = 27
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '&Test Connection'
        OptionsImage.ImageIndex = 24
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 7
        OnClick = btnTestClick
      end
      object edPort: TcxSpinEdit
        Left = 100
        Top = 44
        TabOrder = 8
        Value = 8080
        Width = 65
      end
    end
    object gbStore: TcxGroupBox
      Left = 2
      Top = 161
      Align = alClient
      Caption = ' Pilih Unit '
      ParentBackground = False
      ParentColor = False
      Style.Color = clWhite
      TabOrder = 1
      Height = 64
      Width = 391
      object cxLookupCabang: TcxExtLookupComboBox
        Left = 100
        Top = 23
        TabOrder = 0
        Width = 195
      end
      object cxLabel5: TcxLabel
        Left = 69
        Top = 24
        Caption = 'Unit'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 227
    Width = 395
    ExplicitTop = 227
    ExplicitWidth = 395
    inherited pnlFooter: TPanel
      Width = 395
      ExplicitWidth = 395
      inherited btnClose: TcxButton
        Left = 318
        Action = actCancel
        ExplicitLeft = 318
      end
      inherited btnSave: TcxButton
        Left = 225
        Action = actSave
        ExplicitLeft = 225
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        Visible = False
      end
      inherited btnPrint: TcxButton
        Left = 148
        Action = actPrint
        Visible = False
        ExplicitLeft = 148
      end
    end
    inherited pnlSortCut: TPanel
      Width = 395
      ExplicitWidth = 395
      inherited lbCTRLEnter: TLabel
        Left = 220
        Height = 15
        ExplicitLeft = 220
      end
      inherited lbEscape: TLabel
        Left = 311
        Height = 15
        ExplicitLeft = 311
      end
      inherited lbCTRLDel: TLabel
        Height = 15
        Visible = False
      end
      inherited lblCTRLP: TLabel
        Left = 144
        Height = 15
        Visible = False
        ExplicitLeft = 144
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 304
    Top = 8
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
