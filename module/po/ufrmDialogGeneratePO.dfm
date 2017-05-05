inherited frmDialogDetailGeneratePO: TfrmDialogDetailGeneratePO
  Left = 138
  Top = 177
  Caption = 'Detail Generated PO'
  ClientHeight = 396
  ClientWidth = 777
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 793
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 777
    Height = 340
    ExplicitWidth = 777
    ExplicitHeight = 340
    object spl1: TSplitter [0]
      Left = 2
      Top = 154
      Width = 773
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 775
    end
    inherited cxGrid: TcxGrid
      Top = 157
      Width = 773
      Height = 181
      TabOrder = 2
      ExplicitTop = 158
      ExplicitWidth = 773
      ExplicitHeight = 181
      inherited cxGridView: TcxGridDBTableView
        object cxgrdbclmnGridViewColumn1: TcxGridDBColumn
          Caption = 'NO'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn2: TcxGridDBColumn
          Caption = 'KODE'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn3: TcxGridDBColumn
          Caption = 'NAMA'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn4: TcxGridDBColumn
          Caption = 'SATUAN'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn5: TcxGridDBColumn
          Caption = 'HARGA'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn6: TcxGridDBColumn
          Caption = 'DISC1'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn7: TcxGridDBColumn
          Caption = 'DISC2'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn8: TcxGridDBColumn
          Caption = 'DISC3'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn9: TcxGridDBColumn
          Caption = 'PPN'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn10: TcxGridDBColumn
          Caption = 'PPNBM'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGridViewColumn11: TcxGridDBColumn
          Caption = 'TOTAL'
          HeaderAlignmentHorz = taCenter
        end
      end
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 773
      Height = 34
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object lbl1: TLabel
        Left = 8
        Top = 6
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lbl2: TLabel
        Left = 304
        Top = 6
        Width = 40
        Height = 16
        Caption = 'SO Date'
      end
      object lbl3: TLabel
        Left = 142
        Top = 6
        Width = 33
        Height = 16
        Caption = 'SO No.'
      end
      object lbl6: TLabel
        Left = 464
        Top = 6
        Width = 80
        Height = 16
        Caption = 'Merchan. Group'
      end
      object dtPO: TcxDateEdit
        Left = 51
        Top = 5
        TabOrder = 0
        Width = 84
      end
      object dtSO: TcxDateEdit
        Left = 346
        Top = 5
        TabOrder = 1
        Width = 84
      end
      object edtSO_NO: TEdit
        Left = 177
        Top = 5
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtMerchanGrup: TEdit
        Left = 546
        Top = 5
        Width = 216
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 36
      Width = 773
      Height = 118
      Align = alTop
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 0
      object cxgrdParent: TcxGrid
        Left = 11
        Top = 11
        Width = 751
        Height = 96
        Align = alClient
        TabOrder = 0
        LockedStateImageOptions.Text = 'Mohon ditunggu...'
        object grdParent: TcxGridDBTableView
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
          object cxgrdbclmnParentColumn1: TcxGridDBColumn
            Caption = 'NO'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn2: TcxGridDBColumn
            Caption = 'NO PO'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn3: TcxGridDBColumn
            Caption = 'TANGGAL'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn4: TcxGridDBColumn
            Caption = 'SUPPLIER'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn5: TcxGridDBColumn
            Caption = 'DUE DATE'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn6: TcxGridDBColumn
            Caption = 'SO NO'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn7: TcxGridDBColumn
            Caption = 'SO DATE'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn8: TcxGridDBColumn
            Caption = 'COLIE'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn9: TcxGridDBColumn
            Caption = 'SUBTOTAL'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn10: TcxGridDBColumn
            Caption = 'PPN'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn11: TcxGridDBColumn
            Caption = 'PPN BM'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
          object cxgrdbclmnParentColumn12: TcxGridDBColumn
            Caption = 'PURCHASE'
            GroupSummaryAlignment = taCenter
            HeaderAlignmentHorz = taCenter
          end
        end
        object grdlvlParent: TcxGridLevel
          GridView = grdParent
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 340
    Width = 777
    ExplicitTop = 340
    ExplicitWidth = 777
    inherited pnlFooter: TPanel
      Width = 777
      ExplicitWidth = 777
      inherited btnClose: TcxButton
        Left = 700
        Action = actCancel
        ExplicitLeft = 700
      end
      inherited btnSave: TcxButton
        Left = 607
        Action = actSave
        Visible = False
        ExplicitLeft = 607
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 530
        ExplicitLeft = 530
      end
    end
    inherited pnlSortCut: TPanel
      Width = 777
      ExplicitWidth = 777
      inherited lbCTRLEnter: TLabel
        Left = 602
        Visible = False
        ExplicitLeft = 602
      end
      inherited lbEscape: TLabel
        Left = 693
        ExplicitLeft = 693
      end
      inherited lblCTRLP: TLabel
        Left = 526
        ExplicitLeft = 526
      end
    end
  end
end
