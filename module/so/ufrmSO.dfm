inherited frmSO: TfrmSO
  Caption = 'Suggestion Order'
  ClientHeight = 362
  ClientWidth = 671
  ExplicitWidth = 687
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 671
    Height = 273
    ExplicitWidth = 671
    ExplicitHeight = 273
    inherited pgcBrowse: TcxPageControl
      Width = 649
      Height = 251
      ExplicitWidth = 649
      ExplicitHeight = 251
      ClientRectBottom = 250
      ClientRectRight = 648
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 647
        ExplicitHeight = 249
        inherited cxGrid: TcxGrid
          Width = 647
          Height = 249
          ExplicitWidth = 647
          ExplicitHeight = 249
        end
        object gbCetak: TcxGroupBox
          Left = 252
          Top = 136
          Caption = 'Opsi Cetak'
          TabOrder = 1
          Visible = False
          Height = 110
          Width = 278
          object rbPrintDlg: TcxRadioGroup
            Left = 2
            Top = 21
            Align = alTop
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = 'By Nomor SO'
              end
              item
                Caption = 'By Range Date'
              end>
            ItemIndex = 0
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 42
            Width = 274
          end
          object btnPrint: TcxButton
            AlignWithMargins = True
            Left = 4
            Top = 65
            Width = 270
            Height = 41
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            Caption = 'Cetak'
            OptionsImage.ImageIndex = 28
            OptionsImage.Images = DMClient.imgListButton
            TabOrder = 1
            OnClick = btnPrintClick
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 671
    ExplicitWidth = 671
    inherited lblHeader: TLabel
      Width = 106
      Caption = 'SUGGESTION ORDER'
      ExplicitWidth = 106
    end
    inherited lblFilterData: TcxLabel
      Left = 317
      Visible = True
      ExplicitLeft = 317
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 378
      Visible = True
      ExplicitLeft = 378
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 494
      Visible = True
      ExplicitLeft = 494
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 589
      ExplicitLeft = 589
    end
    inherited lblsdFilter: TcxLabel
      Left = 470
      Visible = True
      ExplicitLeft = 470
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 306
    Width = 671
    ExplicitTop = 306
    ExplicitWidth = 671
    inherited pnlFooter: TPanel
      Width = 671
      ExplicitWidth = 671
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
        Left = 594
        Action = actClose
        ExplicitLeft = 594
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 671
      ExplicitWidth = 671
      inherited lbEscape: TLabel
        Left = 597
        Height = 17
        ExplicitLeft = 597
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
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
