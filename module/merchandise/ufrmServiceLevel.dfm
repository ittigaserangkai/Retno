inherited frmServiceLevel: TfrmServiceLevel
  Left = 214
  Top = 146
  Caption = 'Service Level'
  ClientHeight = 438
  ClientWidth = 618
  OldCreateOrder = True
  ExplicitWidth = 634
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 618
    Height = 349
    BorderWidth = 0
    ExplicitWidth = 618
    ExplicitHeight = 349
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 97
      Width = 616
      Height = 218
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 97
      ExplicitWidth = 616
      ExplicitHeight = 218
      ClientRectBottom = 217
      ClientRectRight = 615
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 614
        ExplicitHeight = 216
        inherited cxGrid: TcxGrid
          Width = 614
          Height = 216
          ExplicitWidth = 614
          ExplicitHeight = 216
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 616
      Height = 96
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lblSupplier: TLabel
        Left = 15
        Top = 12
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object lblGrup: TLabel
        Left = 15
        Top = 36
        Width = 24
        Height = 16
        Caption = 'Grup'
      end
      object lblSubGrup: TLabel
        Left = 15
        Top = 60
        Width = 44
        Height = 16
        Caption = 'Sub Grup'
      end
      object edtKodeSuplier: TEdit
        Left = 84
        Top = 12
        Width = 61
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyUp = edtKodeSuplierKeyUp
      end
      object edtNamaSuplier: TEdit
        Left = 150
        Top = 12
        Width = 299
        Height = 22
        Color = 14145495
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object chkAllSup: TCheckBox
        Left = 454
        Top = 15
        Width = 59
        Height = 17
        Caption = 'All Sup'
        TabOrder = 2
      end
      object edtGrpCd: TEdit
        Left = 84
        Top = 36
        Width = 61
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtGrpNm: TEdit
        Left = 150
        Top = 36
        Width = 299
        Height = 22
        Color = 14145495
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object chkAllGrp: TCheckBox
        Left = 454
        Top = 39
        Width = 59
        Height = 17
        Caption = 'All Grup'
        TabOrder = 5
      end
      object edtSubGrpCd: TEdit
        Left = 84
        Top = 60
        Width = 61
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
      end
      object edtSubGrpNm: TEdit
        Left = 150
        Top = 60
        Width = 299
        Height = 22
        Color = 14145495
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object chkAllSubGrp: TCheckBox
        Left = 454
        Top = 63
        Width = 83
        Height = 17
        Caption = 'All Sub Grup'
        TabOrder = 8
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 315
      Width = 616
      Height = 33
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object lbl4: TLabel
        Left = 15
        Top = 8
        Width = 109
        Height = 16
        Caption = 'Average Service Level'
      end
      object lbl3: TLabel
        Left = 222
        Top = 8
        Width = 7
        Height = 16
        Caption = '%'
      end
      object fedtAvarageServiceLevel: TcxCurrencyEdit
        Left = 128
        Top = 6
        TabOrder = 0
        Width = 89
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 618
    ExplicitWidth = 618
    inherited lblFilterData: TcxLabel
      Left = 264
      ExplicitLeft = 264
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 325
      ExplicitLeft = 325
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 441
      ExplicitLeft = 441
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 536
      ExplicitLeft = 536
    end
    inherited lblsdFilter: TcxLabel
      Left = 417
      ExplicitLeft = 417
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 382
    Width = 618
    ExplicitTop = 382
    ExplicitWidth = 618
    inherited pnlFooter: TPanel
      Width = 618
      ExplicitWidth = 618
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
        Left = 541
        Action = actClose
        ExplicitLeft = 541
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 618
      ExplicitWidth = 618
      inherited lbEscape: TLabel
        Left = 544
        Height = 17
        ExplicitLeft = 544
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
