inherited frmDialogUser: TfrmDialogUser
  Left = 385
  Top = 245
  Caption = 'Dialog User'
  ClientHeight = 418
  ClientWidth = 677
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 693
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 677
    Height = 362
    ExplicitWidth = 373
    ExplicitHeight = 213
    object DataUser: TGroupBox
      Left = 2
      Top = 2
      Width = 673
      Height = 119
      Align = alTop
      Caption = 'Data User'
      TabOrder = 0
      object lbl1: TLabel
        Left = 31
        Top = 20
        Width = 27
        Height = 16
        Caption = 'Login'
      end
      object lbl2: TLabel
        Left = 31
        Top = 51
        Width = 46
        Height = 16
        Caption = 'Password'
      end
      object lbl3: TLabel
        Left = 31
        Top = 82
        Width = 39
        Height = 16
        Caption = 'Confirm'
      end
      object lbl4: TLabel
        Left = 351
        Top = 20
        Width = 46
        Height = 16
        Caption = 'Full Name'
      end
      object lbl5: TLabel
        Left = 351
        Top = 52
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl6: TLabel
        Left = 351
        Top = 84
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object edtLogin: TEdit
        Tag = 1
        Left = 98
        Top = 20
        Width = 192
        Height = 22
        TabOrder = 0
        Text = 'edtLogin'
      end
      object edtPassword: TEdit
        Tag = 1
        Left = 98
        Top = 48
        Width = 192
        Height = 22
        PasswordChar = '*'
        TabOrder = 1
        Text = 'edtPassword'
      end
      object edtConfirm: TEdit
        Tag = 1
        Left = 98
        Top = 80
        Width = 192
        Height = 22
        PasswordChar = '*'
        TabOrder = 2
        Text = 'edtConfirm'
      end
      object edtFullName: TEdit
        Tag = 1
        Left = 418
        Top = 18
        Width = 192
        Height = 22
        TabOrder = 3
        Text = 'edtFullName'
      end
      object cbbStatus: TComboBox
        Tag = 1
        Left = 418
        Top = 49
        Width = 192
        Height = 24
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'Not Active'
        Items.Strings = (
          'Not Active'
          'Active')
      end
      object edtDescription: TEdit
        Left = 418
        Top = 82
        Width = 192
        Height = 22
        TabOrder = 5
        Text = 'edtDescription'
      end
    end
    object cxgrdMenu: TcxGrid
      Left = 2
      Top = 121
      Width = 673
      Height = 239
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitLeft = 216
      ExplicitTop = 80
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridTableMenu: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxgrdlvlMenu: TcxGridLevel
        Caption = 'Setting Menu'
        GridView = cxGridTableMenu
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 362
    Width = 677
    ExplicitTop = 213
    ExplicitWidth = 373
    inherited pnlFooter: TPanel
      Width = 677
      ExplicitWidth = 373
      inherited btnClose: TcxButton
        Left = 524
        Action = actCancel
        ExplicitLeft = 220
      end
      inherited btnSave: TcxButton
        Left = 431
        Action = actSave
        ExplicitLeft = 127
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 601
        Action = actPrint
        ExplicitLeft = 297
      end
    end
    inherited pnlSortCut: TPanel
      Width = 677
      ExplicitWidth = 373
      inherited lbCTRLEnter: TLabel
        Left = 587
        Height = 15
        ExplicitLeft = 283
      end
      inherited lbEscape: TLabel
        Left = 502
        Height = 15
        ExplicitLeft = 198
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 426
        Height = 15
        ExplicitLeft = 122
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
