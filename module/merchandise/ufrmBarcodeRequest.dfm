inherited frmBarcodeRequest: TfrmBarcodeRequest
  Left = 240
  Top = 165
  Caption = 'Barcode Label Requestition'
  ClientHeight = 405
  ClientWidth = 612
  OldCreateOrder = True
  ExplicitWidth = 628
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 612
    Height = 316
    ExplicitWidth = 120
    ExplicitHeight = 252
    inherited pgcBrowse: TcxPageControl
      Top = 136
      Width = 590
      Height = 169
      TabOrder = 1
      ExplicitTop = 136
      ExplicitWidth = 98
      ExplicitHeight = 105
      ClientRectBottom = 168
      ClientRectRight = 589
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 96
        ExplicitHeight = 103
        inherited cxGrid: TcxGrid
          Width = 588
          Height = 167
          ExplicitWidth = 96
          ExplicitHeight = 103
        end
      end
    end
    object Panel1: TPanel
      Left = 11
      Top = 11
      Width = 590
      Height = 125
      Align = alTop
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 98
      object lbl6: TLabel
        Left = 16
        Top = 10
        Width = 75
        Height = 16
        Caption = 'Transaction No'
      end
      object Label1: TLabel
        Left = 16
        Top = 37
        Width = 39
        Height = 16
        Caption = 'Supplier'
      end
      object Label3: TLabel
        Left = 257
        Top = 60
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object edtSupplierCode: TEdit
        Left = 144
        Top = 34
        Width = 129
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = edtSupplierCodeKeyPress
      end
      object edtSupplierName: TEdit
        Left = 276
        Top = 34
        Width = 301
        Height = 22
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object dtDateFrom: TcxDateEdit
        Left = 144
        Top = 60
        TabOrder = 2
        Width = 105
      end
      object dtDateTo: TcxDateEdit
        Left = 275
        Top = 60
        TabOrder = 3
        Width = 105
      end
      object btnAddRow: TcxButton
        Left = 11
        Top = 89
        Width = 107
        Height = 27
        Cursor = crHandPoint
        Action = actAddRow
        Default = True
        TabOrder = 4
      end
      object chkDateOfTransaction: TCheckBox
        Left = 16
        Top = 60
        Width = 124
        Height = 17
        Caption = 'Date of Transaction'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object edbNoTransaksi: TcxButtonEdit
        Left = 144
        Top = 6
        Cursor = crIBeam
        Properties.Buttons = <
          item
          end>
        TabOrder = 6
        Width = 129
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 612
    ExplicitWidth = 120
    inherited lblFilterData: TcxLabel
      Left = 258
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 319
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 435
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 530
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 411
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 349
    Width = 612
    ExplicitTop = -112
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 612
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
        Left = 535
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 612
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 538
        Height = 17
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
    object actAddRow: TAction
      Caption = '&Show'
      ImageIndex = 18
      OnExecute = actAddRowExecute
    end
  end
end
