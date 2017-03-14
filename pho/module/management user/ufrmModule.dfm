inherited frmModule: TfrmModule
  Left = 238
  Top = 150
  Caption = ''
  ClientHeight = 423
  ClientWidth = 707
  OldCreateOrder = True
  ExplicitWidth = 723
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 707
    Height = 342
    ExplicitWidth = 707
    ExplicitHeight = 342
    object pnlBodyUp: TPanel
      Left = 11
      Top = 11
      Width = 685
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
        Left = 56
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
      Width = 685
      Height = 282
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 88
      ExplicitTop = 136
      ExplicitWidth = 473
      ExplicitHeight = 201
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = 'NO'
        end
        object cxGridDBTableView1Column2: TcxGridDBColumn
          Caption = 'ID'
        end
        object cxGridDBTableView1Column3: TcxGridDBColumn
          Caption = 'NAME'
        end
        object cxGridDBTableView1Column4: TcxGridDBColumn
          Caption = 'CAPTION'
        end
        object cxGridDBTableView1Column5: TcxGridDBColumn
          Caption = 'LABEL'
        end
        object cxGridDBTableView1Column6: TcxGridDBColumn
          Caption = 'ACTION'
        end
        object cxGridDBTableView1Column7: TcxGridDBColumn
          Caption = 'ICON PATH'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 707
    ExplicitWidth = 707
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 372
    Width = 707
    Height = 51
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 372
    ExplicitWidth = 707
    ExplicitHeight = 51
    inherited pnlFooter: TPanel
      Top = 16
      Width = 707
      ExplicitTop = 16
      ExplicitWidth = 707
      DesignSize = (
        707
        35)
      inherited btnClose: TcxButton
        Left = 617
        ExplicitLeft = 617
      end
      inherited btnAdd: TcxButton
        Caption = 'Add'
        OnClick = fraFooter5Button1btnAddClick
      end
      inherited btnUpdate: TcxButton
        Caption = 'Edit'
        OnClick = fraFooter5Button1btnUpdateClick
      end
      inherited btnDelete: TcxButton
        OnClick = fraFooter5Button1btnDeleteClick
      end
      inherited btnRefresh: TcxButton
        OnClick = fraFooter5Button1btnRefreshClick
      end
    end
    inherited pnlSortCut: TPanel
      Width = 707
      Height = 16
      ExplicitWidth = 707
      ExplicitHeight = 16
      DesignSize = (
        707
        16)
      inherited lbl1: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl2: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl3: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl4: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl5: TLabel
        Left = 617
        Top = -2
        ExplicitLeft = 625
        ExplicitTop = -2
      end
    end
  end
end
