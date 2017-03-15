inherited frmDaftarCompetitor: TfrmDaftarCompetitor
  Left = 248
  Top = 186
  Caption = 'Competitor Master'
  ClientHeight = 409
  ClientWidth = 709
  KeyPreview = True
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 725
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 709
    Height = 320
    ParentBiDiMode = False
    ExplicitWidth = 120
    ExplicitHeight = 258
    inherited pgcBrowse: TcxPageControl
      Width = 687
      Height = 298
      ExplicitWidth = 98
      ExplicitHeight = 236
      ClientRectBottom = 297
      ClientRectRight = 686
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 98
        ExplicitHeight = 236
        inherited cxGrid: TcxGrid
          Width = 687
          Height = 298
          ExplicitWidth = 98
          ExplicitHeight = 236
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 709
    ExplicitWidth = 709
    inherited lblFilterData: TcxLabel
      Left = 355
      ExplicitLeft = 355
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 416
      ExplicitLeft = -173
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 532
      ExplicitLeft = -57
    end
    inherited btnSearch: TcxButton
      Left = 627
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 508
      ExplicitLeft = 508
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 353
    Width = 709
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 709
      ExplicitWidth = 120
      inherited btnAdd: TcxButton
        Action = actAdd
        OnClick = btnAddClick
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        OnClick = btnUpdateClick
      end
      inherited btnPrint: TcxButton
        Action = actPrint
        OnClick = btnPrintClick
      end
      inherited btnClose: TcxButton
        Left = 632
        Action = actClose
        ExplicitLeft = 43
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
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
  object actlstDaftarCompetitor: TActionList
    Left = 440
    Top = 8
    object actAddDaftarKompetitor: TAction
      Caption = 'Add'
      ShortCut = 16451
    end
    object actEditDaftarKompetitor: TAction
      Caption = 'Edit'
      ShortCut = 16453
    end
    object actDeleteDaftarKompetitor: TAction
      Caption = 'Delete'
      ShortCut = 16430
    end
    object actRefreshDaftarKompetitor: TAction
      Caption = 'Refresh'
      ShortCut = 16500
    end
  end
end
