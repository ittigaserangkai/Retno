inherited frmCompany: TfrmCompany
  Caption = 'frmCompany'
  ClientHeight = 359
  ClientWidth = 783
  ExplicitWidth = 799
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 783
    Height = 270
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 761
      Height = 248
      ExplicitWidth = 102
      ClientRectBottom = 247
      ClientRectRight = 760
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 100
        ExplicitHeight = 290
        inherited cxGrid: TcxGrid
          Width = 759
          Height = 246
          ExplicitWidth = 100
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 783
    ExplicitWidth = 124
    inherited lblHeader: TLabel
      Width = 54
      Caption = 'COMPANY'
      ExplicitWidth = 54
    end
    inherited lblFilterData: TcxLabel
      Left = 429
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 490
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 606
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 701
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 582
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 303
    Width = 783
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 783
      ExplicitWidth = 124
      inherited btnClose: TcxButton
        Left = 706
        ExplicitLeft = 47
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 783
      ExplicitWidth = 124
      inherited lbEscape: TLabel
        Left = 709
        Height = 17
      end
    end
  end
end
