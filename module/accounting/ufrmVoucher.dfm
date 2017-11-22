inherited frmVoucher: TfrmVoucher
  Left = 199
  Top = 213
  Caption = 'Voucher'
  ClientHeight = 414
  ClientWidth = 631
  OldCreateOrder = True
  ExplicitWidth = 647
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 631
    Height = 325
    ExplicitWidth = 631
    ExplicitHeight = 325
    inherited pgcBrowse: TcxPageControl
      Top = 73
      Width = 629
      Height = 251
      TabOrder = 1
      ExplicitTop = 79
      ExplicitWidth = 629
      ExplicitHeight = 245
      ClientRectBottom = 250
      ClientRectRight = 628
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 627
        ExplicitHeight = 243
        inherited cxGrid: TcxGrid
          Width = 627
          Height = 249
          ExplicitWidth = 627
          ExplicitHeight = 243
          inherited cxGridView: TcxGridDBTableView
            object cxcolGridViewColumn1: TcxGridDBColumn
              Caption = 'Pemilik'
            end
            object cxcolGridViewColumn2: TcxGridDBColumn
              Caption = 'Tgl Dibuat'
            end
            object cxcolGridViewColumn3: TcxGridDBColumn
              Caption = 'Nominal'
            end
            object cxcolGridViewColumn4: TcxGridDBColumn
              Caption = 'Tgl Mulai'
            end
            object cxcolGridViewColumn5: TcxGridDBColumn
              Caption = 'Tgl Expired'
              Width = 91
            end
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 629
      Height = 72
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 16
        Top = 14
        Width = 77
        Height = 16
        Caption = 'Owner Voucher'
      end
      object Label1: TLabel
        Left = 16
        Top = 41
        Width = 50
        Height = 16
        Caption = 'Tgl Dibuat'
      end
      object Label2: TLabel
        Left = 256
        Top = 41
        Width = 18
        Height = 16
        Caption = 'S/D'
      end
      object cbpDataCombo: TcxExtLookupComboBox
        Left = 104
        Top = 11
        TabOrder = 0
        Width = 89
      end
      object dtTgl: TcxDateEdit
        Left = 104
        Top = 40
        TabOrder = 1
        Width = 137
      end
      object JvDateEdit1: TcxDateEdit
        Left = 280
        Top = 40
        TabOrder = 2
        Width = 137
      end
      object edtInput: TEdit
        Left = 200
        Top = 11
        Width = 217
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 631
    ExplicitWidth = 631
    inherited lblFilterData: TcxLabel
      Left = 277
      ExplicitLeft = 277
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 338
      ExplicitLeft = 338
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 454
      ExplicitLeft = 454
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 549
      ExplicitLeft = 549
    end
    inherited lblsdFilter: TcxLabel
      Left = 430
      ExplicitLeft = 430
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 358
    Width = 631
    ExplicitTop = 358
    ExplicitWidth = 631
    inherited pnlFooter: TPanel
      Width = 631
      ExplicitWidth = 631
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
        Left = 554
        Action = actClose
        ExplicitLeft = 554
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 631
      ExplicitWidth = 631
      inherited lbEscape: TLabel
        Left = 557
        Height = 17
        ExplicitLeft = 557
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
