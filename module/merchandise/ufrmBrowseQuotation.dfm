inherited frmBrowseQuotation: TfrmBrowseQuotation
  Caption = 'frmBrowseQuotation'
  ClientHeight = 383
  ClientWidth = 722
  ExplicitWidth = 738
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 722
    Height = 294
    ExplicitWidth = 722
    ExplicitHeight = 294
    inherited pgcBrowse: TcxPageControl
      Width = 720
      Height = 292
      ExplicitWidth = 720
      ExplicitHeight = 292
      ClientRectBottom = 291
      ClientRectRight = 719
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 718
        ExplicitHeight = 290
        inherited cxGrid: TcxGrid
          Width = 718
          Height = 290
          ExplicitWidth = 718
          ExplicitHeight = 290
          inherited cxGridView: TcxGridDBTableView
            OnFocusedRecordChanged = cxGridViewFocusedRecordChanged
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 722
    ExplicitWidth = 722
    inherited lblFilterData: TcxLabel
      Left = 222
      Caption = 'Filter Effective Date'
      Visible = True
      ExplicitLeft = 312
      ExplicitWidth = 114
      Width = 114
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 339
      Visible = True
      ExplicitLeft = 429
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 455
      Visible = True
      ExplicitLeft = 545
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 550
      ExplicitLeft = 640
    end
    inherited lblsdFilter: TcxLabel
      Left = 431
      Visible = True
      ExplicitLeft = 521
      AnchorY = 17
    end
    object btnActivate: TcxButton
      AlignWithMargins = True
      Left = 633
      Top = 3
      Width = 86
      Height = 27
      Cursor = crHandPoint
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Aktifkan'
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.ImageIndex = 13
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 5
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnActivateClick
      ExplicitLeft = 688
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 327
    Width = 722
    ExplicitTop = 327
    ExplicitWidth = 722
    inherited pnlFooter: TPanel
      Width = 722
      ExplicitWidth = 722
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
        Left = 645
        Action = actClose
        ExplicitLeft = 645
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 722
      ExplicitWidth = 722
      inherited lbEscape: TLabel
        Left = 648
        Height = 17
        ExplicitLeft = 648
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
