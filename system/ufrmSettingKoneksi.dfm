inherited frmMasterDialog1: TfrmMasterDialog1
  Caption = 'Setting Koneksi'
  ClientHeight = 315
  ClientWidth = 411
  ExplicitWidth = 427
  ExplicitHeight = 354
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 411
    Height = 259
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = ' Rest Server '
      ParentBackground = False
      ParentColor = False
      Style.Color = clWhite
      TabOrder = 0
      ExplicitWidth = 565
      Height = 159
      Width = 407
      object cxTextEdit1: TcxTextEdit
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
      object cxTextEdit2: TcxTextEdit
        Left = 100
        Top = 44
        TabOrder = 3
        Text = '8080'
        Width = 81
      end
      object cxLabel3: TcxLabel
        Left = 37
        Top = 69
        Caption = 'User Name'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
      object cxTextEdit3: TcxTextEdit
        Left = 100
        Top = 68
        TabOrder = 5
        Width = 126
      end
      object cxLabel4: TcxLabel
        Left = 44
        Top = 92
        Caption = 'Password'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
      object cxTextEdit4: TcxTextEdit
        Left = 100
        Top = 91
        TabOrder = 7
        Width = 93
      end
      object btnPrint: TcxButton
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
        TabOrder = 8
        Visible = False
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 161
      Align = alClient
      Caption = ' Pilih Unit '
      ParentBackground = False
      ParentColor = False
      Style.Color = clWhite
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 162
      ExplicitWidth = 322
      ExplicitHeight = 104
      Height = 96
      Width = 407
      object cxLookupSupplierMerchan: TcxExtLookupComboBox
        Left = 100
        Top = 30
        TabOrder = 0
        Width = 195
      end
      object cxLabel5: TcxLabel
        Left = 53
        Top = 31
        Caption = 'Cabang'
        Properties.Alignment.Horz = taRightJustify
        AnchorX = 94
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 259
    Width = 411
    inherited pnlFooter: TPanel
      Width = 411
      inherited btnClose: TcxButton
        Left = 334
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 241
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        Visible = False
      end
      inherited btnPrint: TcxButton
        Left = 164
        Visible = False
        ExplicitTop = 5
      end
    end
    inherited pnlSortCut: TPanel
      Width = 411
      inherited lbCTRLEnter: TLabel
        Left = 236
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 327
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
        Visible = False
      end
      inherited lblCTRLP: TLabel
        Left = 160
        Height = 15
        Visible = False
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 328
    Top = 24
  end
end
