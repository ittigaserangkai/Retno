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
    BorderWidth = 0
    ExplicitWidth = 648
    ExplicitHeight = 369
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 1
      Width = 756
      Height = 367
      ExplicitLeft = 1
      ExplicitTop = 129
      ExplicitWidth = 646
      ExplicitHeight = 239
      ClientRectBottom = 366
      ClientRectRight = 755
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 644
        ExplicitHeight = 237
        inherited cxGrid: TcxGrid
          Width = 754
          Height = 365
          ExplicitWidth = 644
          ExplicitHeight = 237
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 758
    ExplicitWidth = 648
    inherited lblHeader: TLabel
      Width = 155
      Caption = 'LISTING RECEIVING PRODUCT'
      ExplicitWidth = 155
    end
    inherited lblFilterData: TcxLabel
      Left = 404
      Visible = True
      ExplicitLeft = 294
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 465
      Visible = True
      ExplicitLeft = 355
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 581
      Visible = True
      ExplicitLeft = 471
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 676
      ExplicitLeft = 566
    end
    inherited lblsdFilter: TcxLabel
      Left = 557
      Visible = True
      ExplicitLeft = 447
      AnchorY = 17
    end
    object cbbSUpMG: TcxExtLookupComboBox
      AlignWithMargins = True
      Left = 296
      Top = 4
      Align = alRight
      TabOrder = 5
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
      ExplicitLeft = 201
      ExplicitTop = 0
      Height = 31
      Width = 58
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 402
    Width = 758
    ExplicitTop = 402
    ExplicitWidth = 648
    inherited pnlFooter: TPanel
      Width = 758
      ExplicitWidth = 648
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
        ExplicitLeft = 571
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 758
      ExplicitWidth = 648
      inherited lbEscape: TLabel
        Left = 684
        Height = 17
        ExplicitLeft = 574
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
