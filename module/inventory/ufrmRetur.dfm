inherited frmRetur: TfrmRetur
  Left = 204
  Top = 67
  Caption = 'Retur'
  ClientHeight = 493
  ClientWidth = 634
  ExplicitWidth = 650
  ExplicitHeight = 532
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 151
    Width = 634
    Height = 286
    ExplicitTop = 151
    ExplicitWidth = 634
    ExplicitHeight = 286
    inherited pgcBrowse: TcxPageControl
      Width = 612
      Height = 264
      ExplicitWidth = 612
      ExplicitHeight = 264
      ClientRectBottom = 263
      ClientRectRight = 611
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 610
        ExplicitHeight = 262
        inherited cxGrid: TcxGrid
          Width = 610
          Height = 262
          ExplicitWidth = 610
          ExplicitHeight = 262
          inherited cxGridView: TcxGridDBTableView
            object cxcolNo: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcolPLU: TcxGridDBColumn
              Caption = 'PLU'
            end
            object cxcolUOM: TcxGridDBColumn
              Caption = 'UOM'
            end
            object cxcolQTY: TcxGridDBColumn
              Caption = 'Qty'
            end
            object cxcolNOMORPO: TcxGridDBColumn
              Caption = 'Nomor PO'
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 634
    ExplicitWidth = 634
    inherited lblHeader: TLabel
      Width = 88
      Caption = 'RETUR SUPPLIER'
      ExplicitWidth = 88
    end
    inherited lblFilterData: TcxLabel
      Left = 280
      ExplicitLeft = 280
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 341
      ExplicitLeft = 341
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 457
      ExplicitLeft = 457
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 552
      ExplicitLeft = 552
    end
    inherited lblsdFilter: TcxLabel
      Left = 433
      ExplicitLeft = 433
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 437
    Width = 634
    ExplicitTop = 437
    ExplicitWidth = 634
    inherited pnlFooter: TPanel
      Width = 634
      ExplicitWidth = 634
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
        Left = 557
        Action = actClose
        ExplicitLeft = 557
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 634
      ExplicitWidth = 634
      inherited lbEscape: TLabel
        Left = 560
        Height = 17
        ExplicitLeft = 560
      end
    end
  end
  object pnl1: TPanel [3]
    Left = 0
    Top = 33
    Width = 634
    Height = 118
    Align = alTop
    BevelWidth = 2
    TabOrder = 3
    object lblNoBukti: TLabel
      Left = 24
      Top = 29
      Width = 42
      Height = 16
      Caption = 'No Bukti'
    end
    object lbl1: TLabel
      Left = 24
      Top = 54
      Width = 27
      Height = 16
      Caption = 'Divisi'
    end
    object lblKeteranga: TLabel
      Left = 24
      Top = 79
      Width = 58
      Height = 16
      Caption = 'Keterangan'
    end
    object lblTanggal: TLabel
      Left = 351
      Top = 29
      Width = 37
      Height = 16
      Caption = 'Tanggal'
    end
    object edtMerchan: TcxButtonEdit
      Left = 128
      Top = 54
      Properties.Buttons = <
        item
        end>
      TabOrder = 3
      Text = '0'
      Width = 89
    end
    object edtKeterangan: TEdit
      Left = 128
      Top = 79
      Width = 401
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object dtDate: TcxDateEdit
      Left = 407
      Top = 29
      TabOrder = 2
      Width = 122
    end
    object edtMerchannama: TEdit
      Left = 222
      Top = 54
      Width = 307
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object btn1: TcxButton
      Left = 275
      Top = 26
      Width = 45
      Height = 25
      Caption = 'F2'
      OptionsImage.ImageIndex = 26
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = btn1Click
    end
    object edtNoBukti: TEdit
      Left = 128
      Top = 29
      Width = 137
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
end
