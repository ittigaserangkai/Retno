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
    Height = 256
    BorderWidth = 0
    ExplicitWidth = 659
    ExplicitHeight = 256
    object lbl3: TLabel
      Left = 18
      Top = 6
      Width = 107
      Height = 16
      Caption = 'No. Suggestion Order'
    end
    object lbl4: TLabel
      Left = 85
      Top = 29
      Width = 40
      Height = 16
      Caption = 'Date SO'
    end
    object lbl1: TLabel
      Left = 13
      Top = 62
      Width = 115
      Height = 16
      Caption = 'Date Purchasing Order'
    end
    object bvl1: TBevel
      Left = 13
      Top = 58
      Width = 254
      Height = 17
      Shape = bsTopLine
    end
    object edtNoSO: TEdit
      Left = 133
      Top = 6
      Width = 132
      Height = 22
      Ctl3D = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edtNoSOChange
      OnKeyPress = edtNoSOKeyPress
    end
    object dtDateSO: TcxDateEdit
      Left = 133
      Top = 29
      TabOrder = 2
      Width = 132
    end
    object dtDatePO: TcxDateEdit
      Left = 133
      Top = 63
      TabOrder = 3
      Width = 132
    end
    object btnProcessPO: TcxButton
      Left = 152
      Top = 86
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
      Left = 1
      Top = 231
      Align = alBottom
      Position = 30.000000000000000000
      Properties.PeakValue = 30.000000000000000000
      TabOrder = 6
      ExplicitTop = 234
      Width = 657
    end
    object pnl1: TPanel
      Left = 1
      Top = 202
      Width = 657
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      Color = 15198183
      TabOrder = 7
      DesignSize = (
        657
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
      TabOrder = 1
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
      Top = 112
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
  end
  inherited pnlHeader: TPanel
    Width = 659
    ExplicitWidth = 659
    inherited lblHeader: TLabel
      Height = 18
    end
  end
  inline fraFooter1Button1: TfraFooter1Button
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
