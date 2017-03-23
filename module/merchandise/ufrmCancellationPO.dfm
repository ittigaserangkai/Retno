inherited frmCancellationPO: TfrmCancellationPO
  Left = 222
  Top = 225
  Caption = 'Cancellation PO'
  ClientHeight = 352
  ClientWidth = 582
  OldCreateOrder = True
  ExplicitWidth = 598
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 582
    Height = 263
    BorderWidth = 0
    ExplicitWidth = 512
    ExplicitHeight = 207
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 57
      Width = 580
      Height = 205
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 57
      ExplicitWidth = 510
      ExplicitHeight = 149
      ClientRectBottom = 204
      ClientRectRight = 579
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 508
        ExplicitHeight = 147
        inherited cxGrid: TcxGrid
          Width = 578
          Height = 203
          ExplicitWidth = 508
          ExplicitHeight = 147
        end
      end
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 580
      Height = 56
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 510
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
        Width = 426
        Height = 16
        Caption = 
          'This module will change PO Status from APPROVED, ORDERED, EXPIRE' +
          'D into CANCELED'
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
    Width = 582
    ExplicitWidth = 512
    inherited lblFilterData: TcxLabel
      Left = 228
      ExplicitLeft = 158
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 289
      ExplicitLeft = 219
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 405
      ExplicitLeft = 335
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 500
      ExplicitLeft = 430
    end
    inherited lblsdFilter: TcxLabel
      Left = 381
      ExplicitLeft = 311
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 296
    Width = 582
    ExplicitTop = 296
    ExplicitWidth = 512
    inherited pnlFooter: TPanel
      Width = 582
      ExplicitWidth = 512
      inherited btnAdd: TcxButton
        Action = actAdd
        Visible = False
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 505
        Action = actClose
        ExplicitLeft = 435
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 582
      ExplicitWidth = 512
      inherited lbEscape: TLabel
        Left = 508
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
