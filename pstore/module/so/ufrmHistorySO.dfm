inherited frmHistorySO: TfrmHistorySO
  Left = 240
  Top = 196
  Caption = 'History Suggestion Order'
  ClientHeight = 448
  ClientWidth = 656
  OldCreateOrder = True
  ExplicitWidth = 672
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 656
    Height = 359
    BorderWidth = 0
    ExplicitWidth = 656
    ExplicitHeight = 359
    inherited cxGrid: TcxGrid
      Left = 1
      Top = 73
      Width = 654
      Height = 285
      PopupMenu = ppmn1
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 73
      ExplicitWidth = 654
      ExplicitHeight = 285
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'No.'
          Width = 39
        end
        object cxGridViewColumn2: TcxGridDBColumn
          Caption = 'No. Suggention Order'
          Width = 132
        end
        object cxGridViewColumn3: TcxGridDBColumn
          Caption = 'Date'
          Width = 83
        end
        object cxGridViewColumn4: TcxGridDBColumn
          Caption = 'Total'
          Width = 97
        end
        object cxGridViewColumn5: TcxGridDBColumn
          Caption = 'Status SO'
          Width = 93
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 654
      Height = 72
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      DesignSize = (
        654
        72)
      object lbl3: TLabel
        Left = 311
        Top = 9
        Width = 47
        Height = 16
        Caption = 'Category'
      end
      object bvl1: TBevel
        Left = -27
        Top = -90
        Width = 385
        Height = 69
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 512
        Top = 48
        Width = 134
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'Double Click to show Detail'
      end
      object cbbMerchanGroup: TComboBox
        Left = 365
        Top = 5
        Width = 160
        Height = 24
        BevelKind = bkSoft
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 0
        Text = 'All'
        OnChange = cbbMerchanGroupChange
        Items.Strings = (
          'All'
          'Hard Line'
          'Soft Line'
          'Dry Food'
          'Fresh & Frozen')
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 656
    ExplicitWidth = 656
    DesignSize = (
      656
      33)
    inherited lblFilterData: TcxLabel
      Left = 298
      ExplicitLeft = 298
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 362
      ExplicitLeft = 362
    end
    inherited lblsdFilter: TcxLabel
      Left = 458
      ExplicitLeft = 458
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 482
      ExplicitLeft = 482
    end
    inherited btnSearch: TcxButton
      Left = 581
      OnClick = btnSearchClick
      ExplicitLeft = 581
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 392
    Width = 656
    ExplicitTop = 392
    ExplicitWidth = 656
    inherited pnlFooter: TPanel
      Width = 656
      ExplicitWidth = 656
      inherited btnClose: TcxButton
        Left = 574
        ExplicitLeft = 574
      end
    end
    inherited pnlSortCut: TPanel
      Width = 656
      ExplicitWidth = 656
      inherited lbl5: TLabel
        Left = 566
        ExplicitLeft = 566
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlst1: TActionList
    Left = 609
    Top = 39
    object actCancelSO: TAction
      Caption = 'Cancel SO'
      OnExecute = actCancelSOExecute
    end
  end
  object ppmn1: TPopupMenu
    Left = 136
    Top = 169
    object miShowDetailSO: TMenuItem
      Caption = 'Show Detail SO'
      OnClick = miShowDetailSOClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miBatalkan: TMenuItem
      Caption = 'Cancel SO'
    end
  end
end
