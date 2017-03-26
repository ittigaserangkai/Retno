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
    ExplicitWidth = 120
    ExplicitHeight = 254
    inherited pgcBrowse: TcxPageControl
      Top = 153
      Width = 621
      Height = 154
      TabOrder = 1
      ExplicitTop = 153
      ExplicitWidth = 98
      ExplicitHeight = 90
      ClientRectBottom = 153
      ClientRectRight = 620
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 96
        ExplicitHeight = 88
        inherited cxGrid: TcxGrid
          Width = 619
          Height = 152
          ExplicitWidth = 96
          ExplicitHeight = 88
        end
      end
    end
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 621
      Height = 142
      Align = alTop
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      ExplicitTop = 19
      object lbl1: TLabel
        Left = 16
        Top = 8
        Width = 37
        Height = 16
        Caption = 'Periode'
      end
      object lbl2: TLabel
        Left = 192
        Top = 8
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object lbl3: TLabel
        Left = 16
        Top = 32
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object lbl4: TLabel
        Left = 16
        Top = 59
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object schckgrpStatusPO: TcxCheckGroup
        Left = 11
        Top = 82
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
        TabOrder = 4
        Height = 49
        Width = 599
      end
      object dtTglFrom: TcxDateEdit
        Left = 88
        Top = 6
        TabOrder = 0
        Width = 89
      end
      object dtTglTo: TcxDateEdit
        Left = 216
        Top = 6
        TabOrder = 1
        Width = 89
      end
      object edtSupplierCode: TEdit
        Left = 88
        Top = 59
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnKeyUp = edtSupplierCodeKeyUp
      end
      object edtSuplierName: TEdit
        Left = 216
        Top = 59
        Width = 297
        Height = 22
        CharCase = ecUpperCase
        Color = 15198183
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object btnShow: TcxButton
        Left = 523
        Top = 57
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show'
        OptionsImage.ImageIndex = 18
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 6
        OnClick = btnShowClick
      end
      object edtMercNm: TEdit
        Left = 216
        Top = 35
        Width = 297
        Height = 22
        CharCase = ecUpperCase
        Color = 15198183
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
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
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 466
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 561
      ExplicitLeft = 38
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
    ExplicitTop = -112
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 643
      ExplicitWidth = 120
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
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 643
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 569
        ExplicitLeft = 569
      end
    end
  end
end
