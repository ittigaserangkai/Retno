inherited frmReprintNP: TfrmReprintNP
  Top = 211
  Caption = 'Reprint / Check List PO'
  ClientHeight = 335
  ClientWidth = 537
  OldCreateOrder = True
  ExplicitWidth = 553
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 537
    Height = 305
    BorderWidth = 0
    ExplicitWidth = 120
    ExplicitHeight = 305
    object lbl1: TLabel
      Left = 24
      Top = 10
      Width = 34
      Height = 16
      Caption = 'PO No.'
    end
    object edt1: TEdit
      Left = 60
      Top = 10
      Width = 153
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnExit = edt1Exit
      OnKeyPress = edt1KeyPress
      OnKeyUp = edt1KeyUp
    end
    inline frafoo1: TfraFooter1Button
      Left = 1
      Top = 251
      Width = 535
      Height = 53
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 251
      ExplicitWidth = 118
      ExplicitHeight = 53
      inherited pnlFooter: TPanel
        Top = 18
        Width = 535
        ExplicitTop = 18
        ExplicitWidth = 118
        inherited btnClose: TcxButton
          Left = 453
          Cancel = True
          ExplicitLeft = 453
        end
      end
      inherited pnlSortCut: TPanel
        Width = 535
        Height = 18
        ExplicitWidth = 118
        ExplicitHeight = 18
        inherited lbl5: TLabel
          Left = 451
          Top = 2
          ExplicitLeft = 448
          ExplicitTop = 2
        end
      end
    end
    object btnSearch: TcxButton
      Left = 226
      Top = 9
      Width = 41
      Height = 25
      Caption = 'F2'
      OptionsImage.ImageIndex = 30
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 2
      OnClick = btnSearchClick
    end
    object btnReprintNP: TcxButton
      Left = 64
      Top = 40
      Width = 145
      Height = 25
      Action = actReprintNP
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 3
    end
    object btnCheckListPO: TcxButton
      Left = 64
      Top = 72
      Width = 145
      Height = 25
      Action = actCheckListReprintNP
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 4
    end
    object cxShowDetailPO: TcxButton
      Left = 64
      Top = 104
      Width = 145
      Height = 25
      Action = actShowDetailReprintNP
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 5
    end
  end
  inherited pnlHeader: TPanel
    Width = 537
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 151
      Caption = 'REPRINT NP / CHECK LIST PO'
      ExplicitWidth = 151
    end
  end
  object actlst1: TActionList
    Images = DMClient.imgListButton
    Left = 360
    Top = 102
    object actReprintNP: TAction
      Caption = 'Reprint NP (Ctrl-C)'
      ImageIndex = 32
      OnExecute = actReprintNPExecute
    end
    object actCheckListReprintNP: TAction
      Caption = 'Check List NP (Ctrl-D)'
      ImageIndex = 32
      OnExecute = actCheckListReprintNPExecute
    end
    object actShowDetailReprintNP: TAction
      Caption = 'Show Detail NP (Ctrl-H)'
      ImageIndex = 18
      OnExecute = actShowDetailReprintNPExecute
    end
  end
end
