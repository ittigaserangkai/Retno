inherited frmHistorySO: TfrmHistorySO
  Left = 240
  Top = 196
  Caption = 'History Suggestion Order'
  ClientHeight = 448
  ClientWidth = 656
  OldCreateOrder = True
  ExplicitTop = 8
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
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 73
      Width = 654
      Height = 285
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 73
      ExplicitWidth = 654
      ExplicitHeight = 285
      ClientRectBottom = 284
      ClientRectRight = 653
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Left = 1
          Top = 73
          Width = 654
          Height = 285
          PopupMenu = ppmn1
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
    inherited lblFilterData: TcxLabel
      Left = 302
      ExplicitLeft = 302
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 363
      ExplicitLeft = 362
      ExplicitHeight = 21
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 479
      ExplicitLeft = 482
      ExplicitHeight = 21
    end
    inherited btnSearch: TcxButton
      Left = 574
      OnClick = btnSearchClick
      ExplicitLeft = 581
    end
    inherited lblsdFilter: TcxLabel
      Left = 455
      ExplicitLeft = 455
      AnchorY = 17
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
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 574
        Action = actClose
        ExplicitLeft = 574
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
      end
    end
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
