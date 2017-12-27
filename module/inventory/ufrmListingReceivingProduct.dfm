inherited frmListingReceivingProduct: TfrmListingReceivingProduct
  Left = 241
  Top = 206
  Caption = 'Listing Receiving Product'
  ClientHeight = 458
  ClientWidth = 758
  OldCreateOrder = True
  ExplicitWidth = 774
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 758
    Height = 369
    ExplicitWidth = 758
    ExplicitHeight = 369
    inherited pgcBrowse: TcxPageControl
      Width = 756
      Height = 367
      ExplicitWidth = 756
      ExplicitHeight = 367
      ClientRectBottom = 366
      ClientRectRight = 755
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 754
        ExplicitHeight = 365
        inherited cxGrid: TcxGrid
          Width = 754
          Height = 365
          ExplicitWidth = 754
          ExplicitHeight = 365
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 758
    ExplicitWidth = 758
    inherited lblHeader: TLabel
      Width = 155
      Caption = 'LISTING RECEIVING PRODUCT'
      ExplicitWidth = 155
    end
    inherited lblFilterData: TcxLabel
      Left = 404
      Visible = True
      ExplicitLeft = 404
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 465
      Visible = True
      ExplicitLeft = 465
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 581
      Visible = True
      ExplicitLeft = 581
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 676
      TabOrder = 3
      ExplicitLeft = 676
    end
    inherited lblsdFilter: TcxLabel
      Left = 557
      Visible = True
      ExplicitLeft = 557
      AnchorY = 17
    end
    object cbbSUpMG: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 296
      Top = 4
      Align = alRight
      TabOrder = 0
      Width = 105
    end
    object llblSupMG: TcxLabel
      Left = 235
      Top = 1
      Align = alRight
      AutoSize = False
      Caption = 'Supplier MG'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 31
      Width = 58
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 402
    Width = 758
    ExplicitTop = 402
    ExplicitWidth = 758
    inherited pnlFooter: TPanel
      Width = 758
      ExplicitWidth = 758
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
        Left = 681
        Action = actClose
        ExplicitLeft = 681
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 758
      ExplicitWidth = 758
      inherited lbEscape: TLabel
        Left = 684
        Height = 17
        ExplicitLeft = 684
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
  end
end
