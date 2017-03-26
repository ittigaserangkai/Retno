inherited frmChangeStatusPO: TfrmChangeStatusPO
  Left = 346
  Top = 250
  Caption = 'Change Status PO'
  ClientHeight = 338
  ClientWidth = 592
  OldCreateOrder = True
  ExplicitWidth = 608
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 592
    Height = 249
    BorderWidth = 0
    ExplicitWidth = 560
    ExplicitHeight = 193
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 57
      Width = 590
      Height = 191
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 57
      ExplicitWidth = 558
      ExplicitHeight = 135
      ClientRectBottom = 190
      ClientRectRight = 589
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 556
        ExplicitHeight = 133
        inherited cxGrid: TcxGrid
          Width = 588
          Height = 189
          ExplicitWidth = 556
          ExplicitHeight = 133
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 590
      Height = 56
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 558
      object lbl1: TLabel
        Left = 16
        Top = 25
        Width = 63
        Height = 16
        Caption = 'PO No. / SPB'
      end
      object lbl2: TLabel
        Left = 216
        Top = 25
        Width = 11
        Height = 16
        Caption = 'to'
      end
      object lbl3: TLabel
        Left = 16
        Top = 4
        Width = 324
        Height = 16
        Caption = 'This module will change PO Status from CANCELED into APPROVED'
      end
      object edPONOAwal: TEdit
        Left = 88
        Top = 25
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyDown = edPONOAwalKeyDown
      end
      object edPONOAkhir: TEdit
        Left = 240
        Top = 25
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyDown = edPONOAwalKeyDown
      end
      object btnShowPO: TcxButton
        Left = 372
        Top = 22
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show PO'
        OptionsImage.ImageIndex = 14
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowPOClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 592
    ExplicitWidth = 560
    inherited lblFilterData: TcxLabel
      Left = 238
      ExplicitLeft = 206
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 299
      ExplicitLeft = 267
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 415
      ExplicitLeft = 383
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 510
      ExplicitLeft = 478
    end
    inherited lblsdFilter: TcxLabel
      Left = 391
      ExplicitLeft = 359
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 282
    Width = 592
    ExplicitTop = 282
    ExplicitWidth = 560
    inherited pnlFooter: TPanel
      Width = 592
      ExplicitWidth = 560
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
        Left = 515
        Action = actClose
        ExplicitLeft = 483
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 592
      ExplicitWidth = 560
      inherited lbEscape: TLabel
        Left = 518
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
