inherited frmInputProductForNotSO: TfrmInputProductForNotSO
  Left = 239
  Top = 212
  Caption = 'Input Product For Not SO'
  ClientHeight = 391
  ClientWidth = 604
  KeyPreview = True
  OldCreateOrder = True
  ExplicitWidth = 620
  ExplicitHeight = 430
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 82
    Width = 604
    Height = 253
    ExplicitTop = 82
    ExplicitWidth = 604
    ExplicitHeight = 197
    inherited pgcBrowse: TcxPageControl
      Width = 582
      Height = 231
      ExplicitWidth = 582
      ExplicitHeight = 175
      ClientRectBottom = 230
      ClientRectRight = 581
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 580
        ExplicitHeight = 173
        inherited cxGrid: TcxGrid
          Width = 580
          Height = 229
          ExplicitWidth = 580
          ExplicitHeight = 173
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 604
    ExplicitWidth = 604
    inherited lblFilterData: TcxLabel
      Left = 250
      ExplicitLeft = 250
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 311
      ExplicitLeft = 311
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 427
      ExplicitLeft = 427
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 522
      ExplicitLeft = 522
    end
    inherited lblsdFilter: TcxLabel
      Left = 403
      ExplicitLeft = 403
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 335
    Width = 604
    TabOrder = 3
    ExplicitTop = 335
    ExplicitWidth = 604
    inherited pnlFooter: TPanel
      Width = 604
      ExplicitWidth = 604
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
        Left = 527
        Action = actClose
        ExplicitLeft = 527
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 604
      ExplicitWidth = 604
      inherited lbEscape: TLabel
        Left = 530
        Height = 17
      end
    end
  end
  object pnlSupplier: TPanel [3]
    Left = 0
    Top = 33
    Width = 604
    Height = 49
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 2
    object lbl1: TLabel
      Left = 16
      Top = 13
      Width = 71
      Height = 16
      Caption = 'Supplier Code:'
    end
    object edtName: TEdit
      Left = 176
      Top = 13
      Width = 289
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object cbpCode: TcxExtLookupComboBox
      Left = 468
      Top = 13
      TabStop = False
      TabOrder = 2
      Visible = False
      OnKeyDown = cbpCodeKeyDown
      OnKeyPress = cbpCodeKeyPress
      OnKeyUp = cbpCodeKeyUp
      Width = 69
    end
    object edtKode: TcxButtonEdit
      Left = 100
      Top = 13
      Properties.Buttons = <>
      TabOrder = 0
      Text = '0'
      OnKeyPress = edtKodeKeyPress
      Width = 73
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  object actlstInputProductForNotSO: TActionList
    Left = 560
    Top = 38
    object actAddProductNotForSO: TAction
      Caption = 'Add'
    end
    object actEditProductNotForSO: TAction
      Caption = 'Edit'
    end
    object actDeleteProductNotForSO: TAction
      Caption = 'Delete'
    end
    object actRefreshProductNotForSO: TAction
      Caption = 'Refresh'
    end
  end
end
