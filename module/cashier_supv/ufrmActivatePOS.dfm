inherited frmActivatePOS: TfrmActivatePOS
  Left = 528
  Top = 275
  Caption = 'POS Activation'
  ClientHeight = 330
  ClientWidth = 562
  OldCreateOrder = True
  ExplicitWidth = 578
  ExplicitHeight = 369
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 562
    Height = 241
    BorderWidth = 0
    ExplicitWidth = 562
    ExplicitHeight = 185
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 560
      Height = 239
      ExplicitLeft = 1
      ExplicitTop = 40
      ExplicitWidth = 560
      ExplicitHeight = 144
      ClientRectBottom = 238
      ClientRectRight = 559
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 558
        ExplicitHeight = 142
        inherited cxGrid: TcxGrid
          Top = 39
          Width = 558
          Height = 198
          ExplicitWidth = 558
          ExplicitHeight = 142
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 558
          Height = 39
          Align = alTop
          Anchors = [akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = 15198183
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitWidth = 560
          object btnActivatePOS: TcxButton
            Left = 416
            Top = 3
            Width = 137
            Height = 27
            Cursor = crHandPoint
            Action = actActivatePOS
            OptionsImage.Images = DMClient.imgListButton
            TabOrder = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCheckAll: TcxLabel
            Left = 264
            Top = 11
            Cursor = crHandPoint
            Caption = 'Check All'
            ParentFont = False
            Transparent = True
            OnClick = lblCheckAllClick
          end
          object lblClearAll: TcxLabel
            Left = 345
            Top = 11
            Cursor = crHandPoint
            Caption = 'Clear All'
            ParentFont = False
            Transparent = True
            OnClick = lblClearAllClick
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 562
    ExplicitWidth = 562
    inherited lblFilterData: TcxLabel
      Left = 208
      Visible = True
      ExplicitLeft = 208
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 269
      Visible = True
      ExplicitLeft = 269
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 385
      ExplicitLeft = 385
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 480
      ExplicitLeft = 480
    end
    inherited lblsdFilter: TcxLabel
      Left = 361
      ExplicitLeft = 361
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 274
    Width = 562
    ExplicitTop = 274
    ExplicitWidth = 562
    inherited pnlFooter: TPanel
      Width = 562
      ExplicitWidth = 562
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
        Left = 485
        Action = actClose
        ExplicitLeft = 485
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 562
      ExplicitWidth = 562
      inherited lbEscape: TLabel
        Left = 488
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
    object actActivatePOS: TAction
      Caption = 'Activate (F9)'
      ImageIndex = 14
      OnExecute = actActivatePOSExecute
    end
  end
end
