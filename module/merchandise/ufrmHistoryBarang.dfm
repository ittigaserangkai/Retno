inherited frmHistoryBarang: TfrmHistoryBarang
  Caption = 'History Barang'
  ClientHeight = 432
  ClientWidth = 705
  ExplicitWidth = 721
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 705
    Height = 343
    ExplicitWidth = 621
    ExplicitHeight = 251
    inherited pgcBrowse: TcxPageControl
      Width = 703
      Height = 341
      ExplicitWidth = 619
      ExplicitHeight = 249
      ClientRectBottom = 340
      ClientRectRight = 702
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 617
        ExplicitHeight = 247
        inherited cxGrid: TcxGrid
          Width = 701
          Height = 228
          ExplicitWidth = 617
          ExplicitHeight = 145
        end
        object cxPCCheckExternalCode: TcxPageControl
          Left = 0
          Top = 228
          Width = 701
          Height = 111
          Align = alBottom
          TabOrder = 1
          Properties.ActivePage = cxTSCheckExternalCode
          Properties.CustomButtons.Buttons = <>
          ExplicitTop = 136
          ExplicitWidth = 617
          ClientRectBottom = 107
          ClientRectLeft = 4
          ClientRectRight = 697
          ClientRectTop = 27
          object cxTSCheckExternalCode: TcxTabSheet
            Caption = 'Check External Code'
            ImageIndex = 0
            ExplicitLeft = 5
            ExplicitWidth = 609
            ExplicitHeight = 56
            object lblExternalCode: TLabel
              Left = 2
              Top = 5
              Width = 70
              Height = 16
              Caption = 'External Code'
            end
            object lblKodeBarang: TLabel
              Left = 48
              Top = 35
              Width = 24
              Height = 16
              Caption = 'Kode'
            end
            object lblNamaBarang: TLabel
              Left = 45
              Top = 63
              Width = 27
              Height = 16
              Caption = 'Nama'
            end
            object lblUOM: TLabel
              Left = 299
              Top = 32
              Width = 34
              Height = 16
              Caption = 'Satuan'
            end
            object edExternalCode: TcxTextEdit
              Left = 76
              Top = 1
              TabOrder = 0
              Width = 121
            end
            object edKodeBarang: TcxTextEdit
              Left = 76
              Top = 28
              TabOrder = 1
              Width = 121
            end
            object edNamaBarang: TcxTextEdit
              Left = 76
              Top = 55
              TabOrder = 2
              Width = 344
            end
            object edUOM: TcxTextEdit
              Left = 341
              Top = 28
              TabOrder = 3
              Width = 79
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 705
    ExplicitWidth = 621
    inherited lblHeader: TLabel
      Width = 94
      Caption = 'HISTORY BARANG'
      ExplicitWidth = 94
    end
    inherited lblFilterData: TcxLabel
      Left = 351
      ExplicitLeft = 267
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 412
      ExplicitLeft = 328
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 528
      ExplicitLeft = 444
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 623
      ExplicitLeft = 539
    end
    inherited lblsdFilter: TcxLabel
      Left = 504
      ExplicitLeft = 420
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 376
    Width = 705
    ExplicitTop = 284
    ExplicitWidth = 621
    inherited pnlFooter: TPanel
      Width = 705
      ExplicitWidth = 621
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
        Left = 628
        Action = actClose
        ExplicitLeft = 544
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 705
      ExplicitWidth = 621
      inherited lbEscape: TLabel
        Left = 631
        Height = 17
        ExplicitLeft = 547
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
