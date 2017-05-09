inherited frmGeneratePOforAll: TfrmGeneratePOforAll
  Left = 208
  Top = 181
  Caption = 'Generate Purchasing Order for All'
  ClientHeight = 342
  ClientWidth = 659
  OldCreateOrder = True
  ExplicitWidth = 675
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 659
    OnDblClick = pnlBodyDblClick
    ExplicitWidth = 659
    object lbl3: TLabel
      Left = 18
      Top = 9
      Width = 107
      Height = 16
      Caption = 'No. Suggestion Order'
    end
    object lbl4: TLabel
      Left = 85
      Top = 36
      Width = 40
      Height = 16
      Caption = 'Date SO'
    end
    object lbl1: TLabel
      Left = 13
      Top = 93
      Width = 115
      Height = 16
      Caption = 'Date Purchasing Order'
    end
    object bvl1: TBevel
      Left = 13
      Top = 89
      Width = 254
      Height = 17
      Shape = bsTopLine
    end
    object lblSupplierMG: TLabel
      Left = 20
      Top = 64
      Width = 105
      Height = 16
      Caption = 'Supplier Merchandise'
    end
    object lblHeader: TLabel
      Left = 0
      Top = 0
      Width = 3
      Height = 16
    end
    object dtDateSO: TcxDateEdit
      Left = 133
      Top = 32
      TabOrder = 1
      Width = 132
    end
    object dtDatePO: TcxDateEdit
      Left = 133
      Top = 94
      TabOrder = 3
      Width = 132
    end
    object btnProcessPO: TcxButton
      Left = 152
      Top = 122
      Width = 113
      Height = 27
      Cursor = crHandPoint
      Action = actProcessPO
      Caption = 'Process PO (F5)'
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pbProcess: TcxProgressBar
      Left = 2
      Top = 250
      Align = alBottom
      Position = 30.000000000000000000
      Properties.PeakValue = 30.000000000000000000
      TabOrder = 7
      ExplicitTop = 253
      Width = 655
    end
    object pnl1: TPanel
      Left = 2
      Top = 221
      Width = 655
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      Color = 15198183
      TabOrder = 8
      DesignSize = (
        655
        29)
      object lblKet: TLabel
        Left = 8
        Top = 5
        Width = 132
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'processing generate PO...'
      end
    end
    object btn1: TcxButton
      Left = 271
      Top = 4
      Width = 58
      Height = 27
      Cursor = crHandPoint
      Caption = 'F2'
      OptionsImage.ImageIndex = 26
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 6
      TabStop = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btn1Click
    end
    object btnDetailPO: TcxButton
      Left = 152
      Top = 153
      Width = 113
      Height = 27
      Cursor = crHandPoint
      Action = actDetailPO
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbbSupplierMG: TcxExtLookupComboBox
      Left = 133
      Top = 60
      TabOrder = 2
      Width = 132
    end
    object cbbSO: TcxExtLookupComboBox
      Left = 133
      Top = 5
      Properties.OnValidate = cbbSOPropertiesValidate
      TabOrder = 0
      OnExit = cbbSOExit
      Width = 132
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Width = 659
    Height = 10
    Visible = False
    ExplicitWidth = 659
    ExplicitHeight = 10
    inherited pnlFooter: TPanel
      Top = -25
      Width = 659
      ExplicitTop = -25
      ExplicitWidth = 659
      inherited btnClose: TcxButton
        Left = 582
        Action = actCancel
        ExplicitLeft = 582
      end
      inherited btnSave: TcxButton
        Left = 489
        Action = actSave
        ExplicitLeft = 489
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 412
        ExplicitLeft = 412
      end
    end
    inherited pnlSortCut: TPanel
      Width = 659
      ExplicitWidth = 659
      inherited lbCTRLEnter: TLabel
        Left = 484
        Height = 15
        ExplicitLeft = 484
      end
      inherited lbEscape: TLabel
        Left = 575
        Height = 15
        ExplicitLeft = 575
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 408
        Height = 15
        ExplicitLeft = 408
      end
    end
  end
  inline fraFooter1Button1: TfraFooter1Button [2]
    Left = 0
    Top = 286
    Width = 659
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    ExplicitTop = 286
    ExplicitWidth = 659
    inherited pnlFooter: TPanel
      Width = 659
      ExplicitWidth = 659
      inherited btnClose: TcxButton
        Left = 577
        Cancel = True
        ExplicitLeft = 577
      end
    end
    inherited pnlSortCut: TPanel
      Width = 659
      ExplicitWidth = 659
      inherited lbl5: TLabel
        Left = 568
        ExplicitLeft = 571
      end
    end
  end
  object actlst1: TActionList
    Images = DMClient.imgListButton
    Left = 568
    Top = 38
    object actProcessPO: TAction
      Caption = 'Process PO'
      ImageIndex = 14
      OnExecute = actProcessPOExecute
    end
    object actDetailPO: TAction
      Caption = 'Detail PO (F3)'
      ImageIndex = 24
      OnExecute = actDetailPOExecute
    end
  end
end
