inherited frmHistoryPO: TfrmHistoryPO
  Left = 196
  Top = 115
  Caption = 'History PO'
  ClientHeight = 407
  ClientWidth = 643
  OldCreateOrder = True
  ExplicitWidth = 659
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 643
    Height = 318
    ExplicitWidth = 643
    ExplicitHeight = 318
    inherited pgcBrowse: TcxPageControl
      Top = 121
      Width = 621
      Height = 186
      TabOrder = 1
      ExplicitTop = 153
      ExplicitWidth = 621
      ExplicitHeight = 154
      ClientRectBottom = 185
      ClientRectRight = 620
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 619
        ExplicitHeight = 152
        inherited cxGrid: TcxGrid
          Width = 619
          Height = 184
          ExplicitWidth = 619
          ExplicitHeight = 152
        end
      end
    end
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 621
      Height = 110
      Align = alTop
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      object lbl3: TLabel
        Left = 16
        Top = 0
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object lbl4: TLabel
        Left = 16
        Top = 27
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object schckgrpStatusPO: TcxCheckGroup
        Left = 11
        Top = 50
        Align = alBottom
        Caption = 'PO Status'
        ParentFont = False
        Properties.Columns = 4
        Properties.Items = <
          item
          end
          item
          end
          item
          end
          item
          end>
        TabOrder = 2
        Height = 49
        Width = 599
      end
      object edtSupplierCode: TEdit
        Left = 88
        Top = 27
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyUp = edtSupplierCodeKeyUp
      end
      object edtSuplierName: TEdit
        Left = 216
        Top = 27
        Width = 297
        Height = 22
        CharCase = ecUpperCase
        Color = 15198183
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtMercNm: TEdit
        Left = 216
        Top = 3
        Width = 297
        Height = 22
        CharCase = ecUpperCase
        Color = 15198183
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtDivisionCode: TEdit
        Left = 88
        Top = 3
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        OnKeyUp = edtSupplierCodeKeyUp
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 643
    ExplicitWidth = 643
    inherited lblHeader: TLabel
      Width = 64
      Caption = 'HISTORY PO'
      ExplicitWidth = 64
    end
    inherited lblFilterData: TcxLabel
      Left = 289
      ExplicitLeft = 289
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 350
      ExplicitLeft = 350
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 466
      ExplicitLeft = 466
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 561
      ExplicitLeft = 561
    end
    inherited lblsdFilter: TcxLabel
      Left = 442
      ExplicitLeft = 442
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 351
    Width = 643
    ExplicitTop = 351
    ExplicitWidth = 643
    inherited pnlFooter: TPanel
      Width = 643
      ExplicitWidth = 643
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
        Left = 566
        Action = actClose
        ExplicitLeft = 566
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 643
      ExplicitWidth = 643
      inherited lbEscape: TLabel
        Left = 569
        Height = 17
        ExplicitLeft = 569
      end
    end
  end
end
