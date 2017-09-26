inherited frmActivatePOS: TfrmActivatePOS
  Left = 528
  Top = 275
  Caption = 'POS Activation'
  ClientHeight = 330
  ClientWidth = 562
  OldCreateOrder = True
  OnKeyUp = FormKeyUp
  ExplicitWidth = 578
  ExplicitHeight = 369
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 562
    Height = 241
    ExplicitWidth = 562
    ExplicitHeight = 241
    inherited pgcBrowse: TcxPageControl
      Width = 560
      Height = 239
      ExplicitWidth = 560
      ExplicitHeight = 239
      ClientRectBottom = 238
      ClientRectRight = 559
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 558
        ExplicitHeight = 237
        inherited cxGrid: TcxGrid
          Top = 34
          Width = 558
          Height = 203
          ExplicitLeft = -1
          ExplicitTop = 35
          ExplicitWidth = 558
          ExplicitHeight = 203
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 558
          Height = 34
          Align = alTop
          Anchors = [akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = 15198183
          TabOrder = 1
          DesignSize = (
            558
            34)
          object btnActivatePOS: TcxButton
            Left = 407
            Top = 3
            Width = 137
            Height = 27
            Cursor = crHandPoint
            Action = actActivatePOS
            Anchors = [akRight]
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
            Left = 248
            Top = 7
            Cursor = crHandPoint
            Anchors = [akRight]
            Caption = 'Check All'
            ParentColor = False
            ParentFont = False
            Style.Color = 15198183
            Style.TextColor = clWindowText
            Style.TextStyle = []
            StyleFocused.TextColor = clHotLight
            Transparent = True
            OnClick = lblCheckAllClick
          end
          object lblClearAll: TcxLabel
            Left = 313
            Top = 7
            Cursor = crHandPoint
            Anchors = [akRight]
            Caption = 'Clear All'
            ParentFont = False
            StyleFocused.TextColor = clHotLight
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
      Left = 324
      Visible = True
      ExplicitLeft = 327
      ExplicitTop = 5
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 211
      TabStop = False
      ExplicitLeft = 158
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 385
      Visible = True
      ExplicitLeft = 385
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 480
      ExplicitLeft = 480
    end
    inherited lblsdFilter: TcxLabel
      Left = 303
      ExplicitLeft = 303
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
        ExplicitLeft = 488
      end
    end
  end
  inherited actlstBrowse: TActionList
    Left = 496
    Top = 128
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
