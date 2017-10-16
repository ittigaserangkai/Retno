inherited frmDialogPOFromTrader: TfrmDialogPOFromTrader
  Left = 210
  Top = 92
  Caption = 'frmDialogPOFromTrader'
  ClientHeight = 498
  ClientWidth = 774
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitTop = -158
  ExplicitWidth = 790
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 774
    Height = 442
    ExplicitWidth = 774
    ExplicitHeight = 442
    inherited cxGrid: TcxGrid
      Top = 120
      Width = 770
      Height = 320
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitLeft = 4
      ExplicitTop = 121
      ExplicitWidth = 770
      ExplicitHeight = 320
      inherited cxGridView: TcxGridDBTableView
        object cxGridColPODKode: TcxGridDBColumn
          Caption = 'Kode'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object cxGridColPODNama: TcxGridDBColumn
          Caption = 'Nama'
          HeaderAlignmentHorz = taCenter
          Width = 209
        end
        object cxGridColPODUOM: TcxGridDBColumn
          Caption = 'UOM'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODHarga: TcxGridDBColumn
          Caption = 'Harga'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxGridColPODQty: TcxGridDBColumn
          Caption = 'Qty'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODDisc: TcxGridDBColumn
          Caption = 'Disc'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODPPN: TcxGridDBColumn
          Caption = 'PPN'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODTotal: TcxGridDBColumn
          Caption = 'Total'
          HeaderAlignmentHorz = taCenter
          Width = 131
        end
      end
      inherited cxlvMaster: TcxGridLevel
        Caption = 'PO Trader Item'
      end
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 770
      Height = 118
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 30
        Top = 8
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lbl2: TLabel
        Left = 23
        Top = 36
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lbl5: TLabel
        Left = 250
        Top = 35
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object lbl9: TLabel
        Left = 370
        Top = 35
        Width = 26
        Height = 16
        Caption = 'T.O.P'
      end
      object lbl6: TLabel
        Left = 259
        Top = 62
        Width = 41
        Height = 16
        Caption = 'Total PO'
      end
      object lblIsMember: TLabel
        Left = 237
        Top = 8
        Width = 63
        Height = 16
        Caption = 'Tipe Member'
      end
      object lblOrganizasi: TLabel
        Left = 11
        Top = 66
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblDesc: TLabel
        Left = 470
        Top = 9
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object dtTgl: TcxDateEdit
        Left = 71
        Top = 31
        TabOrder = 1
        Width = 146
      end
      object edTotalPO: TcxCurrencyEdit
        Left = 304
        Top = 58
        TabStop = False
        Enabled = False
        TabOrder = 7
        Width = 150
      end
      object edNoBukti: TcxTextEdit
        Left = 71
        Top = 4
        Enabled = False
        TabOrder = 0
        Width = 146
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 71
        Top = 58
        HelpType = htKeyword
        HelpKeyword = 'Organisasi'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 0
        TabOrder = 2
        Width = 146
      end
      object edOrganizationName: TcxButtonEdit
        Left = 71
        Top = 85
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 3
        Width = 383
      end
      object edTipeMember: TcxTextEdit
        Left = 304
        Top = 5
        Enabled = False
        TabOrder = 4
        Width = 150
      end
      object edLeadTime: TcxTextEdit
        Left = 304
        Top = 31
        Enabled = False
        TabOrder = 5
        Width = 47
      end
      object edTOP: TcxTextEdit
        Left = 404
        Top = 31
        Enabled = False
        TabOrder = 6
        Width = 50
      end
      object memDescription: TcxMemo
        Left = 541
        Top = 5
        TabOrder = 8
        Height = 104
        Width = 220
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 442
    Width = 774
    ExplicitTop = 442
    ExplicitWidth = 774
    inherited pnlFooter: TPanel
      Width = 774
      ExplicitWidth = 774
      inherited btnClose: TcxButton
        Left = 697
        Action = actCancel
        ExplicitLeft = 697
      end
      inherited btnSave: TcxButton
        Left = 604
        Action = actSave
        ExplicitLeft = 604
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 527
        Action = actPrint
        ExplicitLeft = 527
      end
    end
    inherited pnlSortCut: TPanel
      Width = 774
      ExplicitWidth = 774
      inherited lbCTRLEnter: TLabel
        Left = 599
        Height = 15
        ExplicitLeft = 599
      end
      inherited lbEscape: TLabel
        Left = 690
        Height = 15
        ExplicitLeft = 690
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 523
        Height = 15
        ExplicitLeft = 523
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 528
    Top = 176
  end
end
