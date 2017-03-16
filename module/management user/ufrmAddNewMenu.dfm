inherited frmAddNewMenu: TfrmAddNewMenu
  Left = 234
  Top = 204
  Caption = 'Adding New Menu'
  ClientHeight = 397
  ClientWidth = 673
  OldCreateOrder = True
  ExplicitWidth = 689
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 673
    Height = 311
    ExplicitWidth = 673
    ExplicitHeight = 311
    object pnlBodyUp: TPanel
      Left = 11
      Top = 11
      Width = 651
      Height = 38
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 41
        Height = 16
        Caption = 'Search :'
      end
      object edtPencarian: TEdit
        Left = 52
        Top = 8
        Width = 201
        Height = 24
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 0
        OnChange = edtPencarianChange
        OnKeyPress = edtPencarianKeyPress
      end
    end
    object cxGrid: TcxGrid
      Left = 11
      Top = 49
      Width = 651
      Height = 251
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = 'NO'
        end
        object cxGridDBTableView1Column2: TcxGridDBColumn
          Caption = 'Menu No'
        end
        object cxGridDBTableView1Column3: TcxGridDBColumn
          Caption = 'Menu ID'
        end
        object cxGridDBTableView1Column4: TcxGridDBColumn
          Caption = 'Parent ID'
        end
        object cxGridDBTableView1Column5: TcxGridDBColumn
          Caption = 'Menu Name'
        end
        object cxGridDBTableView1Column6: TcxGridDBColumn
          Caption = 'Caption'
        end
        object cxGridDBTableView1Column7: TcxGridDBColumn
          Caption = 'Modul ID'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 673
    ExplicitWidth = 673
    inherited lblHeader: TLabel
      Width = 75
      Caption = 'DAFTAR MENU'
      ExplicitWidth = 75
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 341
    Width = 673
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 341
    ExplicitWidth = 673
    inherited pnlFooter: TPanel
      Width = 673
      ExplicitWidth = 673
      inherited btnClose: TcxButton
        Left = 591
        OnClick = btnCloseClick
        ExplicitLeft = 591
      end
      inherited btnAdd: TcxButton
        OnClick = btnAddClick
      end
      inherited btnUpdate: TcxButton
        OnClick = btnUpdateClick
      end
      inherited btnDelete: TcxButton
        OnClick = btnDeleteClick
      end
      inherited btnRefresh: TcxButton
        OnClick = btnRefreshClick
      end
    end
    inherited pnlSortCut: TPanel
      Width = 673
      ExplicitWidth = 673
      inherited lbl5: TLabel
        Left = 583
        ExplicitLeft = 583
      end
    end
  end
  object actAddNewMenu: TActionList
    Left = 544
    Top = 48
    object actAddMenu: TAction
      Caption = 'Add'
    end
    object actEditMenu: TAction
      Caption = 'Edit'
    end
    object actDeleteMenu: TAction
      Caption = 'Delete'
    end
  end
end
