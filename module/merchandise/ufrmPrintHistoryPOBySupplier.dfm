inherited frmPrintHistoryPOBySupplier: TfrmPrintHistoryPOBySupplier
  Left = 273
  Caption = 'Print History PO By Supplier'
  ClientHeight = 490
  ClientWidth = 627
  OldCreateOrder = True
  ExplicitWidth = 643
  ExplicitHeight = 529
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 627
    Height = 401
    BorderWidth = 0
    ExplicitWidth = 627
    ExplicitHeight = 401
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 109
      Width = 625
      Height = 291
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 109
      ExplicitWidth = 625
      ExplicitHeight = 236
      ClientRectBottom = 290
      ClientRectRight = 624
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 623
        ExplicitHeight = 234
        inherited cxGrid: TcxGrid
          Width = 623
          Height = 289
          ExplicitWidth = 623
          ExplicitHeight = 234
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 625
      Height = 108
      Align = alTop
      TabOrder = 0
      object lbl2: TLabel
        Left = 16
        Top = 23
        Width = 37
        Height = 16
        Caption = 'Periode'
      end
      object lbl3: TLabel
        Left = 16
        Top = 50
        Width = 39
        Height = 16
        Caption = 'Supplier'
      end
      object lbl1: TLabel
        Left = 16
        Top = 76
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl4: TLabel
        Left = 176
        Top = 23
        Width = 19
        Height = 16
        Caption = 's.d.'
      end
      object dtp1: TDateTimePicker
        Left = 72
        Top = 19
        Width = 97
        Height = 24
        Date = 39391.525717592600000000
        Time = 39391.525717592600000000
        TabOrder = 0
      end
      object dtp2: TDateTimePicker
        Left = 195
        Top = 19
        Width = 97
        Height = 24
        Date = 39391.525717592600000000
        Time = 39391.525717592600000000
        TabOrder = 1
      end
      object edtSupplier: TEdit
        Left = 192
        Top = 47
        Width = 202
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object chkSupplier: TCheckBox
        Left = 408
        Top = 46
        Width = 97
        Height = 17
        Caption = 'Semua Supplier'
        TabOrder = 3
      end
      object chkStatus: TCheckBox
        Left = 408
        Top = 75
        Width = 97
        Height = 17
        Caption = 'Semua Status'
        TabOrder = 4
      end
      object edbSupplier: TcxButtonEdit
        Left = 72
        Top = 46
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edbSupplierPropertiesButtonClick
        TabOrder = 5
        Text = 'edbSupplier'
        Width = 97
      end
      object cbbStatusPO: TcxComboBox
        Left = 72
        Top = 72
        TabOrder = 6
        Text = 'cbbStatusPO'
        Width = 321
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 627
    ExplicitWidth = 627
    inherited lblHeader: TLabel
      Width = 169
      Caption = 'PRINT HISTORY PO BY SUPPLIER'
      ExplicitWidth = 169
    end
    inherited lblFilterData: TcxLabel
      Left = 273
      ExplicitLeft = 273
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 334
      ExplicitLeft = 334
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 450
      ExplicitLeft = 450
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 545
      ExplicitLeft = 545
    end
    inherited lblsdFilter: TcxLabel
      Left = 426
      ExplicitLeft = 426
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 434
    Width = 627
    ExplicitTop = 434
    ExplicitWidth = 627
    inherited pnlFooter: TPanel
      Width = 627
      ExplicitWidth = 627
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
        Left = 550
        Action = actClose
        ExplicitLeft = 550
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 627
      ExplicitWidth = 627
      inherited lbEscape: TLabel
        Left = 553
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
