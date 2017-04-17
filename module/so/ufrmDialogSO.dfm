inherited frmDialogSO: TfrmDialogSO
  Caption = 'Dialog Suggestion Order'
  ClientHeight = 451
  ClientWidth = 890
  OnDestroy = FormDestroy
  ExplicitTop = -28
  ExplicitWidth = 906
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 890
    Height = 395
    ExplicitWidth = 839
    ExplicitHeight = 395
    object pnlTop: TPanel
      Left = 2
      Top = 2
      Width = 886
      Height = 127
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 835
      object lbl1: TLabel
        Left = 73
        Top = 7
        Width = 33
        Height = 16
        Caption = 'No. SO'
      end
      object lbl2: TLabel
        Left = 375
        Top = 7
        Width = 40
        Height = 16
        Caption = 'Date SO'
      end
      object lbl3: TLabel
        Left = 10
        Top = 34
        Width = 96
        Height = 16
        Caption = 'Merchandise Group'
      end
      object lblSuppMerGroup: TLabel
        Left = 318
        Top = 34
        Width = 97
        Height = 16
        Caption = 'Supplier Mer. Group'
      end
      object lblSuppMerGroupOpsional: TLabel
        Left = 620
        Top = 34
        Width = 42
        Height = 16
        Caption = 'Optional'
      end
      object edtNoSO: TEdit
        Left = 110
        Top = 4
        Width = 195
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = '0000812'
      end
      object dtTgl: TcxDateEdit
        Left = 419
        Top = 3
        TabOrder = 1
        Width = 195
      end
      object pnl1: TPanel
        Left = 2
        Top = 91
        Width = 882
        Height = 34
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 15198183
        TabOrder = 5
        ExplicitWidth = 831
        object lbl4: TLabel
          Left = 230
          Top = 8
          Width = 296
          Height = 16
          Caption = '(Use this button to add product beyond SO schedulling day)'
        end
        object btnAddOthersProdSO: TcxButton
          Left = 8
          Top = 4
          Width = 217
          Height = 25
          Cursor = crHandPoint
          Caption = 'CTRL-A >> Add Other Products for SO'
          OptionsImage.ImageIndex = 0
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 0
        end
        object btnToExcel: TcxButton
          Left = 536
          Top = 4
          Width = 73
          Height = 25
          Cursor = crHandPoint
          Caption = 'To Excel'
          OptionsImage.ImageIndex = 34
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 1
        end
        object btnAddFromPOTrader: TcxButton
          Left = 616
          Top = 4
          Width = 137
          Height = 25
          Cursor = crHandPoint
          Caption = 'Add From PO Trader'
          OptionsImage.ImageIndex = 26
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 2
        end
      end
      object btnShow: TcxButton
        Left = 419
        Top = 58
        Width = 195
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.ImageIndex = 30
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 4
      end
      object cbbMerchanGroup: TcxExtLookupComboBox
        Left = 110
        Top = 30
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 2
        Width = 195
      end
      object cbbSupplierMerchGroup: TcxExtLookupComboBox
        Left = 419
        Top = 30
        TabOrder = 3
        Width = 195
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 129
      Width = 886
      Height = 264
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      ExplicitWidth = 835
      object cxGridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        FilterRow.Visible = True
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.GroupByBox = False
        object cxColNo: TcxGridDBColumn
          Caption = 'NO'
          Width = 34
        end
        object cxColStatus: TcxGridDBColumn
          Caption = '[X]'
          Width = 32
        end
        object cxGridViewColumn3: TcxGridDBColumn
          Caption = 'PLU'
        end
        object cxGridViewColumn4: TcxGridDBColumn
          Caption = 'NAMA BARANG'
          Width = 72
        end
        object cxGridViewColumn5: TcxGridDBColumn
          Caption = 'UOM'
          Width = 55
        end
        object cxGridViewColumn7: TcxGridDBColumn
          Caption = 'MIN ORDER'
        end
        object cxGridViewColumn13: TcxGridDBColumn
          Caption = 'MAX ORDER'
        end
        object cxGridViewColumn8: TcxGridDBColumn
          Caption = 'CURRENT STOCK'
          Width = 97
        end
        object cxGridViewColumn11: TcxGridDBColumn
          Caption = 'QTY SO'
        end
        object cxGridViewColumn12: TcxGridDBColumn
          Caption = 'QTY ORDER'
          Width = 62
        end
        object cxGridViewColumn14: TcxGridDBColumn
          Caption = 'SUPPLIER CODE'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Width = 82
        end
        object cxGridViewColumn15: TcxGridDBColumn
          Caption = 'SUPPLIER NAME'
          Width = 81
        end
        object cxGridViewColumn16: TcxGridDBColumn
          Caption = 'LEAD TIME'
          Width = 61
        end
        object cxGridViewColumn17: TcxGridDBColumn
          Caption = 'BUY PRICE'
          Width = 57
        end
        object cxGridViewColumn18: TcxGridDBColumn
          Caption = 'DISC1'
          Width = 34
        end
        object cxGridViewColumn19: TcxGridDBColumn
          Caption = 'DISC2'
          Width = 34
        end
        object cxGridViewColumn20: TcxGridDBColumn
          Caption = 'DISC3'
          Width = 46
        end
        object cxGridViewColumn31: TcxGridDBColumn
          Caption = 'NET PRICE'
        end
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 395
    Width = 890
    ExplicitTop = 395
    ExplicitWidth = 839
    inherited pnlFooter: TPanel
      Width = 890
      ExplicitWidth = 839
      inherited btnClose: TcxButton
        Left = 813
        Action = actCancel
        ExplicitLeft = 762
      end
      inherited btnSave: TcxButton
        Left = 720
        Action = actSave
        ExplicitLeft = 669
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 643
        ExplicitLeft = 592
      end
    end
    inherited pnlSortCut: TPanel
      Width = 890
      ExplicitWidth = 839
      inherited lbCTRLEnter: TLabel
        Left = 715
        Height = 15
        ExplicitLeft = 664
      end
      inherited lbEscape: TLabel
        Left = 806
        Height = 15
        ExplicitLeft = 755
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 639
        ExplicitLeft = 517
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 704
    Top = 40
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
